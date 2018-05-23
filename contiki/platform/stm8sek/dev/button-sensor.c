/**
*
*/
#include "contiki.h"
#include "sensors.h"
#include "button-sensor.h"
#include "stm8s_gpio.h"
#include "stm8s_exti.h"

volatile char sta = 0;
volatile struct timer wait;

static int value(int type)
{
    return (1);
}
static int configure(int type, int value)
{
    switch (type)
    {
        case SENSORS_HW_INIT:
        //初始化 PD3初始化为中断
            sta = 1;
            timer_set(&wait, 0);
            EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOD, EXTI_SENSITIVITY_RISE_FALL);
        break;
        case SENSORS_ACTIVE:
            if (value)
            {//使能
                GPIO_Init(GPIOD, GPIO_PIN_3, GPIO_MODE_IN_PU_IT);
                sta = 2;
            }
            else
            {//关闭
                GPIO_Init(GPIOD, GPIO_PIN_3, GPIO_MODE_IN_PU_NO_IT);
                sta = 0;
            }
        break;
    }
}
static int status(int type)
{
    return 1;
}
//外部中断，下降沿触发
@interrupt void PortD_isr(void)
{
    if (!GPIO_ReadInputPin(GPIOD, GPIO_PIN_3))
    {
        if (timer_expired(&wait))
        {
            timer_set(&wait, 200);//100ms内只响应一次中断
            sensors_changed(&button_sensor);
        }
    }
    else if (GPIO_ReadInputPin(GPIOD, GPIO_PIN_3))
    {
        if (timer_expired(&wait))
        {
            timer_set(&wait, 200);
        }
    }
}

SENSORS_SENSOR(button_sensor, BUTTON_SENSOR, value, configure, status);
