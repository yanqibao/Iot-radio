/**
 * STM8S-EK ����������ϰ--led����
 * delay.h
 * @author lisy
 * @date   20170506 2330
*/
#include "stm8s.h"
#include "stm8s_tim4.h"

/*
 * ʹ�ö�ʱ��4�ṩ��ȷ��ʱ,��ʱ��24M��ʹ��128Ԥ��Ƶ��5.3us����
 * ���¼��ؼĴ���ֵ����Ϊ187�� ����1002.67Hz���ж�
*/
#define  RELOAD    187u
volatile uint32_t g_clock;

/**
 * @brief ��ʼ����ʱ��
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
 * @brief ��ȡϵͳʱ���׼
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
 * @note ��ʱ n ms
 * @parame cycles ָ��ѭ������
*/
void delay_nms(uint32_t interval)
{
    uint32_t start;
    start = get_clock();
    while (get_clock()-start < interval);
}

/**
 * @note ��ȡ��ʱ��cntֵ����λ��5.3us
 * @warning ʹ���������������ʱʱ ע�ⲻ�ܳ��� RELOAD
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
 * @brief ��5usΪ��λ
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