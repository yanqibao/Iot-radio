/**
 * STM8S-EK 驱动程序练习--led部分
 * led.h
 * @author lisy
 * @date   20170506 2313
*/
#ifndef     _LED_H
#define     _LED_H

#include "stm8s.h"

#define    LED1    0u
#define    LED2    1u
/**
 * @note led灯初始化，熄灭所有led灯
*/
extern void led_init(void);

/**
 * @note 点亮led灯，num指定led编号
 * @param num--LED1~LED2
*/
extern void led_on(uint8_t num);

/**
 * @note 熄灭led灯，num指定led编号
 * @param num--LED1~LED2
*/
extern void led_off(uint8_t num);

/**
 * @note 闪烁led灯，num指定led编号
 * @param num--LED1~LED2
*/
extern void led_flash(uint8_t num);

#endif