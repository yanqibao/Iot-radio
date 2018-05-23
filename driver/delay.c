/**
 * STM8S-EK 驱动程序练习--led部分
 * delay.h
 * @author lisy
 * @date   20170506 2330
*/
#include "stm8s.h"
#include "stm8s_tim4.h"

/*
 * 使用定时器4提供精确延时,主时钟24M、使用128预分频（5.3us）；
 * 重新加载寄存器值设置为187， 产生1002.67Hz的中断
*/
#define  RELOAD    187u
volatile uint32_t g_clock;

/**
 * @brief 初始化定时器
*/
void delay_init(void)
{
    static uint8_t init=0;
    if (init)
    {
        return;
    }
    init = 1;
    TIM4_DeInit();
    //@24000000Hz/128/187 ~== 1000Hz
    TIM4_TimeBaseInit(TIM4_PRESCALER_128, RELOAD);
    /* Clear TIM4 update flag */
    TIM4_ClearFlag(TIM4_FLAG_UPDATE);
    /* Enable update interrupt */
    TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
    /* Enable TIM4 */
    TIM4_Cmd(ENABLE);
}

/**
 * @brief 获取系统时间基准
 *
*/
uint32_t get_clock(void)
{
    uint32_t clock;
    do
    {
        clock = g_clock;
    }
    while (clock != g_clock);
    
    return (clock);
}



/**
 * @note 延时 n ms
 * @parame cycles 指定循环次数
*/
void delay_nms(uint32_t interval)
{
    uint32_t start;
    start = get_clock();
    while (get_clock()-start < interval);
}

/**
 * @note 获取计时器cnt值。单位：5.3us
 * @warning 使用这个函数计算延时时 注意不能超过 RELOAD
*/
uint8_t get_cnt(void)
{
    uint8_t cnt;
    do
    {
        cnt = TIM4_GetCounter();
    }
    while (cnt!=TIM4_GetCounter());
    
    return (cnt);
}
/**
 * @brief 以5us为单位
*/
void delay_5us(uint8_t interval)
{
    uint8_t start;
    uint16_t cnt;
    if (interval > RELOAD)
    {
        interval -= RELOAD;
        delay_nms(1);
    }
    start = get_cnt();
    //while (get_cnt()-start >= interval);
    do
    {
        cnt = get_cnt();
    }
    while ((cnt>start?cnt-start:(cnt+RELOAD)-start) < interval);
}

/**
 *
 *
*/
@interrupt void tim4_isr(void)
{
    g_clock++;
    /* Cleat Interrupt Pending bit */
    TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
}