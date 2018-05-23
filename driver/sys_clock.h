/**
 * STM8S-EK 驱动程序练习--时钟部分
 * clock.h
 * @author lisy
 * @date   20170506 2336
*/

#ifndef     CLOCK_H
#define     CLOCK_H
#include "stm8s.h"
/**
 *@waring 系统工作在24M-HES或者16M-HIS模式
 *        工作在24M下，要设置OPT.wait state位 为1.
*/
enum clock_type
{
    HSE=0,
    HSI
};

/**
 * @note 初始化时钟
*/
extern void sys_clock_init(enum clock_type clock);

/**
 * @brief 获取系统工作时钟频率
*/
extern uint32_t sys_clock_freq(void);

#endif
