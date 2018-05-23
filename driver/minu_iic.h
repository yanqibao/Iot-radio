/**
 * STM8S-EK 驱动程序练习--模拟iic部分
 * minu_iic.h
 * @author lisy
 * @date   20170512
*/
#ifndef     MINU_IIC_H
#define     MINU_IIC_H
#include "stm8s.h"
#define         IIC_READ    0x01
#define         IIC_WRITE   0x00

#define         IIC_ACK            0
#define         IIC_NOACK          1

/**
 * 模拟iic使用引脚初始化
*/
extern void simu_iic_gpio_init(void);

/**
 * @brief 产生开始信号
*/
extern void simu_iic_start(void);

/**
 * @brief 产生一个结束信号
*/
extern void simu_iic_stop(void);

/**
 * @brief 在总线上传输一个字节，并返回接收方的响应。
 * @param 传输数据
 * @return 
*/
extern uint8_t simu_iic_send(uint8_t dat);

/**
 * @brief 在总线上接收一个字节。
 * @param 是否发送ack响应
 * @return 返回接收到的数据
*/
extern uint8_t simu_iic_receive(uint8_t ack);

#endif