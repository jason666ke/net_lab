#include "net.h"
#include "ip.h"
#include "ethernet.h"
#include "arp.h"
#include "icmp.h"

static uint16_t ip_id = 0;

/**
 * @brief 处理一个收到的数据包
 * 
 * @param buf 要处理的数据包
 * @param src_mac 源mac地址
 */
void ip_in(buf_t *buf, uint8_t *src_mac)
{
    // 判断数据包长度是否小于IP头部长度
    if (buf->len < sizeof(ip_hdr_t)) {
        return;
    }

    ip_hdr_t *p = (ip_hdr_t*) buf->data;
    
    // 检测版本号是否为IPv4
    if (p->version != IP_VERSION_4) {
        return;
    }

    // 检测包长是否大于IP报头最小长度20字节
    if (buf->len < (p->hdr_len << 2)) {
        return;
    }

    // 检测报头长度是否正确
    if (p->hdr_len < 5) {
        return;
    }
    
    // 计算checksum
    uint16_t checksum_origin = p->hdr_checksum16;
    p->hdr_checksum16 = 0;
    uint16_t checksum_real = checksum16((uint16_t *)buf->data, sizeof(ip_hdr_t));
    // checksum与预设值不一样则丢弃
    if (checksum_origin != checksum_real) {
        return;
    }
    // 一样则恢复
    p->hdr_checksum16 = checksum_origin;

    // 对比目的IP地址与本机IP地址，若非本机IP地址则直接丢弃
    if (memcmp(p->dst_ip, net_if_ip, NET_IP_LEN) != 0) {
        return;
    }

    // 接收到的数据包长度大于IP头部长度则说明有填充字段，需要去除填充字段
    uint16_t total_len = swap16(p->total_len16);
    if (buf->len > total_len) {
        buf_remove_padding(buf, buf->len - total_len);
    }

    // 去掉IP报头
    buf_remove_header(buf, sizeof(ip_hdr_t));

    // 调用net_in函数向上层传递数据包，若为无法识别类型则调用icmp_unreachable
    if (net_in(buf, p->protocol, p->src_ip) < 0) {
        buf_add_header(buf, sizeof(ip_hdr_t));
        icmp_unreachable(buf, p->src_ip, ICMP_CODE_PROTOCOL_UNREACH);
    }
}

/**
 * @brief 处理一个要发送的ip分片
 * 
 * @param buf 要发送的分片
 * @param ip 目标ip地址
 * @param protocol 上层协议
 * @param id 数据包id
 * @param offset 分片offset，必须被8整除
 * @param mf 分片mf标志，是否有下一个分片
 */
void ip_fragment_out(buf_t *buf, uint8_t *ip, net_protocol_t protocol, int id, uint16_t offset, int mf)
{
    // 调用buf_add_header增加IP数据报头部缓存空间
    buf_add_header(buf, sizeof(ip_hdr_t));

    // 填写IP头部数据段
    ip_hdr_t *p = (ip_hdr_t *) buf->data;
    p->version = IP_VERSION_4;
    p->hdr_len = sizeof(ip_hdr_t) >> 2;
    p->tos = 0;
    p->total_len16 = swap16(buf->len);
    p->id16 = swap16(id);
    p->flags_fragment16 = swap16((mf ? IP_MORE_FRAGMENT : 0) | (offset >> 3));
    p->ttl = IP_DEFALUT_TTL;
    p->protocol = protocol;
    memcpy(p->dst_ip, ip, NET_IP_LEN);
    memcpy(p->src_ip, net_if_ip, NET_IP_LEN);
    
    // 首部校验和数据段
    p->hdr_checksum16 = 0;
    p->hdr_checksum16 = checksum16((uint16_t *) buf->data, sizeof(ip_hdr_t));
    
    // 发送IP头和数据
    arp_out(buf, ip);
}

/**
 * @brief 处理一个要发送的ip数据包
 * 
 * @param buf 要处理的包
 * @param ip 目标ip地址
 * @param protocol 上层协议
 */
void ip_out(buf_t *buf, uint8_t *ip, net_protocol_t protocol)
{
    // 检查数据报包长是否大于协议最大负载包长
    const size_t ip_max_length = ETHERNET_MAX_TRANSPORT_UNIT - sizeof(ip_hdr_t);
    // 如果超过最大包长，分片发送
    if (buf->len > ip_max_length) {
        uint16_t offset = 0;
        // 将数据包截断并发出
        while (offset < buf->len) {
            // 分片size
            uint16_t size = (buf->len - offset < ip_max_length) ? (buf->len - offset) : ip_max_length;
            buf_t ip_buf;
            buf_init(&ip_buf, size);
            memcpy(ip_buf.data, buf->data + offset, size);
            // 对于同一分片，ip_id不变
            ip_fragment_out(&ip_buf, ip, protocol, ip_id, offset, offset + size != buf->len);
            offset += size;
        }
    }
    else {
        // buf.len < MTU直接发出即可
        ip_fragment_out(buf, ip, protocol, ip_id++, 0, 0);
    }
}

/**
 * @brief 初始化ip协议
 * 
 */
void ip_init()
{
    net_add_protocol(NET_PROTOCOL_IP, ip_in);
}