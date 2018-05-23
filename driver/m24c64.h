/**
 * STM8S-EK 驱动程序练习--eeprom存储部分
 * m24c64.h
 * @author lisy
 * @date   20170508~12
*/
#ifndef     M24C64_H
#define     M24C64_H
#include "stm8s.h"

/**
 * @brief m24c64提供的存储功能
 * @note  m24c64提供8K bytes存储空间，将其编制为0~8K-1的地址。
 * @param addr 指定存储地址，buff、len指定缓冲区指针和长度
 * @return 返回操作状态 0x00 成功，0x01 异常
*/
extern uint8_t m24c64_save(uint16_t addr, uint8_t *buff, uint16_t len);

/**
 * @brief m24c64提供的存储功能;读取数据
 * @param addr 指定存储地址，buff、len指定缓冲区指针和长度
 * @return 返回操作状态 0x00 成功，0x01 异常
*/
extern uint8_t m24c64_read(uint16_t addr, uint8_t *buff, uint16_t len);

/**
 * @brief 操作m24c64时的初始化函数
*/
extern void m24c64_init(void);
#endif
