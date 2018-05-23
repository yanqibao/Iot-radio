/**
 * STM8S-EK 驱动程序练习--led部分
 * led.h
 * @author lisy
 * @date   20170506 2313
*/
#include "stm8s.h"
#include "led.h"
#include "stm8s_gpio.h"

#define    LED1_PORT    GPIOC
#define    LED1_PIN     GPIO_PIN_1
#define    LED2_PORT    GPIOC
#define    LED2_PIN     GPIO_PIN_2

/**
 * @note led灯初始化，熄灭所有led灯
*/
void led_init(void)
{
    GPIO_Init(LED1_PORT, LED1_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
    GPIO_WriteHigh(LED1_PORT, LED1_PIN);
    GPIO_Init(LED2_PORT, LED2_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
    GPIO_WriteHigh(LED2_PORT, LED2_PIN);
}

/**
 * @note 点亮led灯，num指定led编号
 * @param num--LED1~LED2
*/
void led_on(uint8_t num)
{
    if (num==LED1)
    {
        GPIO_WriteLow(LED1_PORT, LED1_PIN);
    }
    else if (num==LED2)
    {
        GPIO_WriteLow(LED2_PORT, LED2_PIN);
    }
}

/**
 * @note 熄灭led灯，num指定led编号
 * @param num--LED1~LED2
*/
void led_off(uint8_t num)
{
    if (num==LED1)
    {
        GPIO_WriteHigh(LED1_PORT, LED1_PIN);
    }
    else if (num==LED2)
    {
        GPIO_WriteHigh(LED2_PORT, LED2_PIN);
    }
}

/**
 * @note 闪烁led灯，num指定led编号
 * @param num--LED1~LED2
*/
void led_flash(uint8_t num)
{
    if (num==LED1)
    {
        GPIO_WriteReverse(LED1_PORT, LED1_PIN);
    }
    else if (num==LED2)
    {
        GPIO_WriteReverse(LED2_PORT, LED2_PIN);
    }
}
