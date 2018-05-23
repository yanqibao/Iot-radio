/**
 * STM8S-EK 驱动程序练习--时钟部分
 * rda5807p.h
 * @author lisy
 * @date   20170513 1338
*/
#ifndef     RAD5807P_H
#define     RAD5807P_H
#include "stm8s.h"

/**
 * @brief rda5807p 初始化函数
*/
extern void rda5807p_init(void);

/**
 * @brief change radio channel
 * @param freq -- 电台频率 单位KHz
*/
extern uint8_t rda5807p_set_channel(uint32_t freq);

/**
 * @brief 调整音量,0~31
 * @param volume取值0~31
*/
extern uint8_t rda5807p_volume(uint8_t volume);

/**
 * @brief radio工作在87~108MHz频段，100KHz工作间隔。
*/
extern uint8_t rda5807p_seek(uint32_t *channel, uint16_t cnt);
#endif