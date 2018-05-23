/**
 * STM8S-EK 驱动程序练习--按键部分，包含一个普通按键和一个Joystick
 * key.h
 * @author lisy
 * @date   20170507 1207
*/
#ifndef         _KEY_H
#define         _KEY_H

#include "stm8s.h"

#define    KEY              (0x01<<0)
#define    JOYSTICK_UP      (0x01<<6)
#define    JOYSTICK_DOWN    (0x01<<7)
#define    JOYSTICK_LEFT    (0x01<<4)
#define    JOYSTICK_RIGHT   (0x01<<1)
#define    JOYSTICK_ENTER   (0x01<<5)

#define    PRESSED(key, sta) (((sta)&(key))==0?1:0)

/**
 *@brief init the kay and joystick
*/
extern void key_init(void);

/**
 *@brief 获取key和joystick状态
 *@return bit0  key;
 *        bit1  joystick_right
 *        bit4  joystick_left
 *        bit5  joystick_enter
 *        bit6  joystick_up
 *        bit7  joystick_down
*/
extern uint8_t get_key_state(void);

#endif