/**
 * STM8S-EK ����������ϰ--led����
 * delay.h
 * @author lisy
 * @date   20170506 2330
*/
#ifndef         _DELAY_H
#define         _DELAY_H

#include "stm8s.h"

/**
 * @brief ��ʼ����ʱ��
*/
extern void delay_init(void);

/**
 * @brief ��ȡϵͳʱ���׼
 *
*/
extern uint32_t get_clock(void);

/**
 * @brief ��5usΪ��λ
*/
extern void delay_5us(uint8_t interval);

/**
 * @note ��ʱ n ms
 * @parame cycles ָ��ѭ������
*/
extern void delay_nms(uint32_t interval);

/**
 * @note ��ȡ��ʱ��cntֵ����λ��5.3us
 * @warning ʹ���������������ʱʱ ע�ⲻ�ܳ��� RELOAD
*/
extern uint8_t get_cnt(void);

#endif