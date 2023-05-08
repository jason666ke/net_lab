#include "net.h"
#include "icmp.h"
#include "ip.h"

/**
 * @brief 发送icmp响应
 * 
 * @param req_buf 收到的icmp请求包
 * @param src_ip 源ip地址
 */
static void icmp_resp(buf_t *req_buf, uint8_t *src_ip)
{
    // 初始化txbuf，数据部分直接拷贝接收的回显请求报文
    buf_copy(&txbuf, req_buf, 0);

    icmp_hdr_t *p = (icmp_hdr_t *) txbuf.data;

    // 填写报头数据
    p->type = ICMP_TYPE_ECHO_REPLY;
    p->code = 0;
    p->checksum16 = 0;
    p->checksum16 = checksum16((uint16_t *)p, txbuf.len);

    // 调用ip_out函数发送数据
    ip_out(&txbuf, src_ip, NET_PROTOCOL_ICMP);
}

/**
 * @brief 处理一个收到的数据包
 * 
 * @param buf 要处理的数据包
 * @param src_ip 源ip地址
 */
void icmp_in(buf_t *buf, uint8_t *src_ip)
{
    // 报头检测
    if (buf->len < sizeof(icmp_hdr_t)) {
        return;
    }

    // 判断是否回显请求
    icmp_hdr_t *p = (icmp_hdr_t *) buf->data;

    // 如果是，调用icmp_resp()应答
    if (p->type == ICMP_TYPE_ECHO_REQUEST) {
        icmp_resp(buf, src_ip);
    }
}

/**
 * @brief 发送icmp不可达
 * 
 * @param recv_buf 收到的ip数据包
 * @param src_ip 源ip地址
 * @param code icmp code，协议不可达或端口不可达
 */
void icmp_unreachable(buf_t *recv_buf, uint8_t *src_ip, icmp_code_t code)
{
    // 初始化txbuf, icmp head + ip head + ip data[0-8]
    buf_init(&txbuf, sizeof(icmp_hdr_t) + sizeof(ip_hdr_t) + 8);

    icmp_hdr_t *p = (icmp_hdr_t *) txbuf.data;

    // 填写icmp报头
    p->type = ICMP_TYPE_UNREACH;
    p->code = code;
    p->id16 = 0;
    p->seq16 = 0;
    p->checksum16 = 0;
    
    // 填写icmp数据
    memcpy(txbuf.data + sizeof(icmp_hdr_t), recv_buf->data, sizeof(ip_hdr_t) + 8);
    p->checksum16 = checksum16((uint16_t *) txbuf.data, txbuf.len);

    // 发送数据
    ip_out(&txbuf, src_ip, NET_PROTOCOL_ICMP);
}

/**
 * @brief 初始化icmp协议
 * 
 */
void icmp_init(){
    net_add_protocol(NET_PROTOCOL_ICMP, icmp_in);
}