/**
 *@brief clock.c contiki练习代码
 *@author 
 *@date  20170617 0049
*/
#include "stm8s_tim4.h"
#include "clock.h"
#include "etimer.h"

static volatile clock_time_t s_clock;
static volatile unsigned long s_sec;
#define  RELOAD    24000000ul/128/CLOCK_SECOND
/**
 *@brief 使用TIM4作为驱动源，其它地方勿使用
*/
void clock_init(void)
{
    TIM4_DeInit();
    //@24000000Hz/128/187 ~== 1000Hz
    TIM4_TimeBaseInit(TIM4_PRESCALER_128, RELOAD);
    /* Clear TIM4 update flag */
    TIM4_ClearFlag(TIM4_FLAG_UPDATE);
    /* Enable update interrupt */
    TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
    /* Enable TIM4 */
    TIM4_Cmd(ENABLE);
    
    s_clock = 0;
}

/**
*返回系统滴答时间基准
*/
CCIF clock_time_t clock_time(void)
{
    clock_time_t clock;
    do
    {
        clock = s_clock;
    }
    while (clock!=s_clock);
    
    return (clock);
}

/**
*返回系统秒数
*/
CCIF unsigned long clock_seconds(void)
{
    unsigned long s;
    do
    {
        s = s_sec;
    }
    while (s!=s_sec);
    
    return (s);
}

/**
 * Set the value of the platform seconds.
 * \param sec   The value to set.
 *
 */
void clock_set_seconds(unsigned long sec)
{
    do
    {
        s_sec = sec;
    }
    while (sec!=s_sec);
}

void clock_wait(clock_time_t t)
{
    clock_time_t stop = clock_time()+t;
    while (stop-clock_time());
}

void clock_delay_usec(uint16_t dt)
{
    clock_wait(dt);
}


void clock_delay(unsigned int delay)
{
    clock_wait(delay);
}

/**
 *
 *
*/
@interrupt void tim4_isr(void)
{
    static uint16_t reg;
    s_clock++;
    reg++;
    if (reg>=1002ul)
    {
        reg = 0;
        s_sec++;
    }
    etimer_request_poll();
    /* Cleat Interrupt Pending bit */
    TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
}