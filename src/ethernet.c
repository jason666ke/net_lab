#include "ethernet.h"
#include "utils.h"
#include "driver.h"
#include "arp.h"
#include "ip.h"
/**
 * @brief 处理一个收到的数据包
 * 
 * @param buf 要处理的数据包
 */
void ethernet_in(buf_t *buf)
{
    // 数据长度 < 以太网头部长度则直接丢弃
    int head_len = 2 * NET_MAC_LEN + 2;
    if (buf->len < head_len) {
        return ;
    }

    // 处理buf内数据
    ether_hdr_t *hdr = (ether_hdr_t *) buf->data;

    // 将协议号转换成大端
    uint16_t protocol_type = swap16(hdr->protocol16);
    
    // 调用buf_remove_header函数移除包头
    buf_remove_header(buf, head_len);

    // 调用net_in()函数向上层传递包头
    net_in(buf, protocol_type, hdr->src);
}
/**
 * @brief 处理一个要发送的数据包
 * 
 * @param buf 要处理的数据包
 * @param mac 目标MAC地址
 * @param protocol 上层协议
 */
void ethernet_out(buf_t *buf, const uint8_t *mac, net_protocol_t protocol)
{
    // 数据长度不足46则显式填充0
    if (buf->len < ETHERNET_MIN_TRANSPORT_UNIT) {
        buf_add_padding(buf, ETHERNET_MIN_TRANSPORT_UNIT - (buf->len));
    }
    
    // 调用buf_add_header()函数添加以太网包头
    buf_add_header(buf, sizeof(ether_hdr_t));
    ether_hdr_t *hdr = (ether_hdr_t *) buf->data;

    // 填写目的MAC地址
    memcpy(hdr->dst, mac, NET_MAC_LEN);
     
    // 填写源MAC地址
    memcpy(hdr->src, net_if_mac, NET_MAC_LEN);

    // 填写协议类型
    uint16_t protocol_type = swap16(protocol);
    hdr->protocol16 = protocol_type;

    // 调用driver_send()函数将添加了以太网包头的数据帧发送到驱动层
    driver_send(buf);
}
/**
 * @brief 初始化以太网协议
 * 
 */
void ethernet_init()
{
    buf_init(&rxbuf, ETHERNET_MAX_TRANSPORT_UNIT + sizeof(ether_hdr_t));
}

/**
 * @brief 一次以太网轮询
 * 
 */
void ethernet_poll()
{
    if (driver_recv(&rxbuf) > 0)
        ethernet_in(&rxbuf);
}
