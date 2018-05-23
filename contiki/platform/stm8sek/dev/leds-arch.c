/**
 *leds-arch.c
*/
#include "stm8s_gpio.h"
#include "leds.h"

#define    LED_GREEN_PORT    GPIOC
#define    LED_GREEN_PIN     GPIO_PIN_1
#define    LED_RED_PORT      GPIOC
#define    LED_RED_PIN       GPIO_PIN_2

void leds_arch_init(void)
{
    GPIO_Init(LED_GREEN_PORT, LED_GREEN_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
    GPIO_WriteHigh(LED_GREEN_PORT, LED_GREEN_PIN);
    GPIO_Init(LED_RED_PORT, LED_RED_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
    GPIO_WriteHigh(LED_RED_PORT, LED_RED_PIN);
    
    GPIO_WriteHigh(LED_GREEN_PORT, LED_GREEN_PIN);
    GPIO_WriteHigh(LED_RED_PORT, LED_RED_PIN);
}
unsigned char leds_arch_get(void)
{
    uint8_t tmp;
    uint8_t ret = 0x00;
    tmp = GPIO_ReadInputData(LED_GREEN_PORT);
    if (!(tmp&LED_GREEN_PIN))
    {
        ret |= LEDS_GREEN;
    }
    if (!(tmp&LED_RED_PIN))
    {
        ret |= LEDS_RED;
    }
}
void leds_arch_set(unsigned char leds)
{
    if(leds&LEDS_GREEN)
    {
        GPIO_WriteLow(LED_GREEN_PORT, LED_GREEN_PIN);
    }
    else
    {
        GPIO_WriteHigh(LED_GREEN_PORT, LED_GREEN_PIN);
    }
    
    if(leds&LED_RED_PIN)
    {
        GPIO_WriteLow(LED_RED_PORT, LED_RED_PIN);
    }
    else
    {
        GPIO_WriteHigh(LED_RED_PORT, LED_RED_PIN);
    }
}