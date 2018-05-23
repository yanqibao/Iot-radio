/**
 * STM8S-EK ����������ϰ--ʱ�Ӳ���
 * clock.h
 * @author lisy
 * @date   20170506 2336
*/

#ifndef     CLOCK_H
#define     CLOCK_H
#include "stm8s.h"
/**
 *@waring ϵͳ������24M-HES����16M-HISģʽ
 *        ������24M�£�Ҫ����OPT.wait stateλ Ϊ1.
*/
enum clock_type
{
    HSE=0,
    HSI
};

/**
 * @note ��ʼ��ʱ��
*/
extern void sys_clock_init(enum clock_type clock);

/**
 * @brief ��ȡϵͳ����ʱ��Ƶ��
*/
extern uint32_t sys_clock_freq(void);

#endif
