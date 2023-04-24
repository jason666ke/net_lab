#include <string.h>
#include <stdio.h>
#include "net.h"
#include "arp.h"
#include "ethernet.h"
/**
 * @brief 初始的arp包
 * 
 */
static const arp_pkt_t arp_init_pkt = {
    .hw_type16 = constswap16(ARP_HW_ETHER),
    .pro_type16 = constswap16(NET_PROTOCOL_IP),
    .hw_len = NET_MAC_LEN,
    .pro_len = NET_IP_LEN,
    .sender_ip = NET_IF_IP,
    .sender_mac = NET_IF_MAC,
    .target_mac = {0}};

/**
 * @brief arp地址转换表，<ip,mac>的容器
 * 
 */
map_t arp_table;

/**
 * @brief arp buffer，<ip,buf_t>的容器
 * 
 */
map_t arp_buf;

/**
 * @brief 打印一条arp表项
 * 
 * @param ip 表项的ip地址
 * @param mac 表项的mac地址
 * @param timestamp 表项的更新时间
 */
void arp_entry_print(void *ip, void *mac, time_t *timestamp)
{
    printf("%s | %s | %s\n", iptos(ip), mactos(mac), timetos(*timestamp));
}

/**
 * @brief 打印整个arp表
 * 
 */
void arp_print()
{
    printf("===ARP TABLE BEGIN===\n");
    map_foreach(&arp_table, arp_entry_print);
    printf("===ARP TABLE  END ===\n");
}

/**
 * @brief 发送一个arp请求
 * 
 * @param target_ip 想要知道的目标的ip地址
 */
void arp_req(uint8_t *target_ip)
{
    // 初始化txbuf
    buf_init(&txbuf, sizeof(arp_pkt_t) + ARP_PADDING);
    arp_pkt_t *arp_pkt = (arp_pkt_t *) txbuf.data;

    // 填写ARP报头
    memcpy(arp_pkt, &arp_init_pkt, sizeof(arp_pkt_t));

    // 设置ARP操作类型
    arp_pkt->opcode16 = constswap16(ARP_REQUEST);

    // 填写目标IP地址
    memcpy(arp_pkt->target_ip, target_ip, NET_IP_LEN);

    // 填充末尾的18个字节
    memset(txbuf.data + sizeof(arp_pkt_t), 0, ARP_PADDING);

    // 调用Ethernet_out函数发送ARP报文
    ethernet_out(&txbuf, ether_broadcast_mac, NET_PROTOCOL_ARP);
}

/**
 * @brief 发送一个arp响应
 * 
 * @param target_ip 目标ip地址
 * @param target_mac 目标mac地址
 */
void arp_resp(uint8_t *target_ip, uint8_t *target_mac)
{
    // 初始化txbuf
    buf_init(&txbuf, sizeof(arp_pkt_t) + ARP_PADDING);

    arp_pkt_t * arp_pkt = (arp_pkt_t *) txbuf.data;
    
    // 填写ARP报头
    memcpy(arp_pkt, &arp_init_pkt, sizeof(arp_pkt_t));
    memcpy(arp_pkt->target_ip, target_ip, NET_IP_LEN);
    memcpy(arp_pkt->target_mac, target_mac, NET_MAC_LEN);
    memcpy(arp_pkt->sender_ip, net_if_ip, NET_IP_LEN);
    memcpy(arp_pkt->sender_mac, net_if_mac, NET_MAC_LEN);
    arp_pkt->opcode16 = constswap16(ARP_REPLY);

    // 填充末尾的18个字节
    memset(txbuf.data + sizeof(arp_pkt_t), 0, ARP_PADDING);

    // 调用ethernet_out发送报文
    ethernet_out(&txbuf, target_mac, NET_PROTOCOL_ARP);
}

/**
 * @brief 处理一个收到的数据包
 * 
 * @param buf 要处理的数据包
 * @param src_mac 源mac地址
 */
void arp_in(buf_t *buf, uint8_t *src_mac)
{
    // 判断数据长度是否小于ARP头部长度
    if (buf->len < sizeof(arp_pkt_t)) {
        return;
    }

    arp_pkt_t * arp_pkt = (arp_pkt_t *) buf->data;

    // 检查硬件类型、上层协议类型、硬件地址长度、IP地址长度
    if (arp_pkt->hw_type16  == constswap16(ARP_HW_ETHER) &&
        arp_pkt->pro_type16 == constswap16(NET_PROTOCOL_IP) &&
        arp_pkt->hw_len     == NET_MAC_LEN &&
        arp_pkt->pro_len    == NET_IP_LEN)
    {
        // 处理ARP响应报文
        if (arp_pkt->opcode16 == constswap16(ARP_REPLY) &&
            memcmp(arp_pkt->target_ip, net_if_ip, NET_IP_LEN) == 0 &&
            memcmp(arp_pkt->target_mac, net_if_mac, NET_MAC_LEN) == 0)
        {
            map_set(&arp_table, arp_pkt->sender_ip, arp_pkt->sender_mac);
            // 判断IP地址是否有对应的ARP缓存
            buf_t *arp_pending = (buf_t *)map_get(&arp_buf, arp_pkt->sender_ip);
            if (arp_pending) {
                ethernet_out(arp_pending, arp_pkt->sender_mac, NET_PROTOCOL_IP);
                map_delete(&arp_buf, arp_pkt->sender_ip);
            }
        }
        // 处理ARP请求报文
        else {
            if (arp_pkt->opcode16 == constswap16(ARP_REQUEST) &&
                memcmp(arp_pkt->target_ip, net_if_ip, NET_IP_LEN) == 0)
            {   
                // 更新arp表项
                map_set(&arp_table, arp_pkt->sender_ip, arp_pkt->sender_mac);
                // 回复响应报文
                arp_resp(arp_pkt->sender_ip, arp_pkt->sender_mac);
            }
        }
    }
}

/**
 * @brief 处理一个要发送的数据包
 * 
 * @param buf 要处理的数据包
 * @param ip 目标ip地址
 * @param protocol 上层协议
 */
void arp_out(buf_t *buf, uint8_t *ip)
{
    // 调用map_get函数, 根据IP地址查找ARP表
    uint8_t *mac = (uint8_t *)map_get(&arp_table, ip);
    // 没有找到对应mac地址
    if (!mac) {
        // 判断arp_buf中是否有包
        buf_t *pkt = (buf_t *)map_get(&arp_buf, ip);
        if (pkt) {
            // 说明此时的IP地址正在等待回应ARP
            // 忽略这个请求
        } else {
            // 调用map_set()将IP层数据缓存到arp_buf
            map_set(&arp_buf, ip, buf);
            // 调用arp_req()函数发送请求目标IP地址的ARP Request
            arp_req(ip);
        }
    } else {
        // 找到对应的IP地址，直接发送
        ethernet_out(buf, mac, NET_PROTOCOL_IP);
    }
}

/**
 * @brief 初始化arp协议
 * 
 */
void arp_init()
{
    map_init(&arp_table, NET_IP_LEN, NET_MAC_LEN, 0, ARP_TIMEOUT_SEC, NULL);
    map_init(&arp_buf, NET_IP_LEN, sizeof(buf_t), 0, ARP_MIN_INTERVAL, buf_copy);
    net_add_protocol(NET_PROTOCOL_ARP, arp_in);
    arp_req(net_if_ip);
}