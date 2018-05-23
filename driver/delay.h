/**
 * STM8S-EK 驱动程序练习--led部分
 * delay.h
 * @author lisy
 * @date   20170506 2330
*/
#ifndef         _DELAY_H
#define         _DELAY_H

#include "stm8s.h"

/**
 * @brief 初始化定时器
*/
extern void delay_init(void);

/**
 * @brief 获取系统时间基准
 *
*/
extern uint32_t get_clock(void);

/**
 * @brief 以5us为单位
*/
extern void delay_5us(uint8_t interval);

/**
 * @note 延时 n ms
 * @parame cycles 指定循环次数
*/
extern void delay_nms(uint32_t interval);

/**
 * @note 获取计时器cnt值。单位：5.3us
 * @warning 使用这个函数计算延时时 注意不能超过 RELOAD
*/
extern uint8_t get_cnt(void);

#endif