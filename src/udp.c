#include "udp.h"
#include "ip.h"
#include "icmp.h"

/**
 * @brief udp处理程序表
 * 
 */
map_t udp_table;

/**
 * @brief udp伪校验和计算
 * 
 * @param buf 要计算的包
 * @param src_ip 源ip地址
 * @param dst_ip 目的ip地址
 * @return uint16_t 伪校验和
 */
static uint16_t udp_checksum(buf_t *buf, uint8_t *src_ip, uint8_t *dst_ip)
{
    // 拷贝IP头部, 避免被覆盖
    uint8_t ip_hdr_copy[sizeof(ip_hdr_t)];
    memcpy(ip_hdr_copy, buf->data - sizeof(ip_hdr_t), sizeof(ip_hdr_t));
    ip_hdr_t *ip_header = (ip_hdr_t *) ip_hdr_copy;
    uint16_t udp_length = buf->len;

    // 增加UDP伪头部
    buf_add_header(buf, sizeof(udp_peso_hdr_t));
    udp_peso_hdr_t *peso_udp_header = (udp_peso_hdr_t *) buf->data;

    // 填写UDP伪头部
    memcpy(peso_udp_header->dst_ip, dst_ip, NET_IP_LEN);
    memcpy(peso_udp_header->src_ip, src_ip, NET_IP_LEN);
    peso_udp_header->placeholder = 0;
    peso_udp_header->protocol = ip_header->protocol;
    peso_udp_header->total_len16 = swap16(udp_length);

    // 若数据报长度为奇数，则需要填充一位方便进行校验和的计算
    int has_padding = 0;
    if (buf->len & 1) {
        buf_add_padding(buf, 1);
        has_padding = 1;
    }

    // 计算UDP校验和
    uint16_t checksum = checksum16((uint16_t *) buf->data, buf->len);

    // 去除填充位
    if (has_padding) {
        buf_remove_padding(buf, 1);
    }

    // 去除UDP伪头部
    buf_remove_header(buf, sizeof(udp_peso_hdr_t));

    // 拷贝暂存的IP头部
    memcpy(buf->data - sizeof(ip_hdr_t), ip_hdr_copy, sizeof(ip_hdr_t));

    return checksum;
}

/**
 * @brief 处理一个收到的udp数据包
 * 
 * @param buf 要处理的包
 * @param src_ip 源ip地址
 */
void udp_in(buf_t *buf, uint8_t *src_ip)
{
    printf("udp_in(): src_ip = %s\n", iptos(src_ip));
    // 包检查
    if (buf->len < sizeof(udp_hdr_t)) {
        return;
    }
    uint8_t src_ip_copy[NET_IP_LEN];
    memcpy(src_ip_copy, src_ip, sizeof(src_ip_copy));
    udp_hdr_t *p = (udp_hdr_t *) buf->data;
    uint16_t total_len = swap16(p->total_len16);
    if (buf->len < total_len) {
        return;
    }

    // 计算校验和
    uint16_t checksum_origin = p->checksum16;
    p->checksum16 = 0;
    uint16_t checksum_actual = udp_checksum(buf, src_ip_copy, net_if_ip);
    if (checksum_origin != checksum_actual) {
        return;
    }
    p->checksum16 = checksum_origin;

    // 查询目的端口号对应的处理函数
    uint16_t dst_port = swap16(p->dst_port16);
    udp_handler_t *handler = (udp_handler_t *) map_get(&udp_table, &dst_port);

    if (handler) {
        (*handler)(buf->data + sizeof(udp_hdr_t), buf->len - sizeof(udp_hdr_t), src_ip_copy, swap16(p->src_port16));
    } else {
        buf_add_header(buf, sizeof(ip_hdr_t));
        icmp_unreachable(buf, src_ip_copy, ICMP_CODE_PORT_UNREACH);
    }
}

/**
 * @brief 处理一个要发送的数据包
 * 
 * @param buf 要处理的包
 * @param src_port 源端口号
 * @param dst_ip 目的ip地址
 * @param dst_port 目的端口号
 */
void udp_out(buf_t *buf, uint16_t src_port, uint8_t *dst_ip, uint16_t dst_port)
{
    // 添加UDP报头
    buf_add_header(buf, sizeof(udp_hdr_t));

    // 填充UDP首部
    udp_hdr_t *p = (udp_hdr_t *) buf->data;
    p->src_port16 = swap16(src_port);
    p->dst_port16 = swap16(dst_port);
    p->total_len16 = swap16(buf->len);

    // 计算校验和
    p->checksum16 = 0;
    p->checksum16 = udp_checksum(buf, net_if_ip, dst_ip);

    // 调用ip_out发送UDP数据报
    ip_out(buf, dst_ip, NET_PROTOCOL_UDP);
}

/**
 * @brief 初始化udp协议
 * 
 */
void udp_init()
{
    map_init(&udp_table, sizeof(uint16_t), sizeof(udp_handler_t), 0, 0, NULL);
    net_add_protocol(NET_PROTOCOL_UDP, udp_in);
}

/**
 * @brief 打开一个udp端口并注册处理程序
 * 
 * @param port 端口号
 * @param handler 处理程序
 * @return int 成功为0，失败为-1
 */
int udp_open(uint16_t port, udp_handler_t handler)
{
    return map_set(&udp_table, &port, &handler);
}

/**
 * @brief 关闭一个udp端口
 * 
 * @param port 端口号
 */
void udp_close(uint16_t port)
{
    map_delete(&udp_table, &port);
}

/**
 * @brief 发送一个udp包
 * 
 * @param data 要发送的数据
 * @param len 数据长度
 * @param src_port 源端口号
 * @param dst_ip 目的ip地址
 * @param dst_port 目的端口号
 */
void udp_send(uint8_t *data, uint16_t len, uint16_t src_port, uint8_t *dst_ip, uint16_t dst_port)
{
    buf_init(&txbuf, len);
    memcpy(txbuf.data, data, len);
    udp_out(&txbuf, src_port, dst_ip, dst_port);
}