/**
 * adc-sensor.h
*/

/**
 * adc sensor 练习。管理开发板上的两个模拟量，通过adc采集。
 * 1.可变电阻的阻值大小；2.光线传感器的阻值的大小。
*/
#include "sensors.h"
#include "stm8s_adc2.h"
#include "adc-sensor.h"
#include "stm8s_gpio.h"

/**
 * 其它函数,计算电阻值，单位 欧姆
 *
*/
int get_resistance(int type, int adc)
{
    long int r=0;
    if (type==ADC_TYPE_RW)
    {//
        r = 10000ul*adc/1024;
    }
    else if (type==ADC_TYPE_PHO)
    {
        r = 5000ul*adc/(1024-adc);
    }
    return (r);
}

static unsigned int state=0xff;

int value(int type)
{
    int ret = 0;
    
    if ((state==0xff)||(state==0x80)||(state==0x00))
    {
        return (0x00);
    }
    if ((type==ADC_TYPE_RW)||(type==ADC_TYPE_PHO))
    {
        ADC2_ConversionConfig(ADC2_CONVERSIONMODE_SINGLE, type, ADC2_CR2_ALIGN);
        ADC2_StartConversion();
        while (!ADC2_GetFlagStatus());
        ADC2_ClearFlag();
        ret = get_resistance(type, ADC2_GetConversionValue());
    }
    return (ret);
}

int configure(int type, int value)
{
    int ret = 0;
    switch (type)
    {
        case SENSORS_HW_INIT://初始化adc
            state = 0x80;
            GPIO_Init(GPIOE, GPIO_PIN_7, GPIO_MODE_IN_FL_NO_IT);
            GPIO_Init(GPIOE, GPIO_PIN_6, GPIO_MODE_IN_FL_NO_IT);
            ADC2_Init(ADC2_CONVERSIONMODE_SINGLE, ADC2_CHANNEL_9, ADC2_PRESSEL_FCPU_D18,
            0x00, DISABLE, ADC2_CR2_ALIGN, ADC2_CHANNEL_8, DISABLE);
        break;
        case SENSORS_ACTIVE://有效
            state = value;
            if (state)
            {
                ADC2_Cmd(ENABLE);
            }
            else
            {
                ADC2_Cmd(DISABLE);
            }
        break;
    }
    return (ret);
}

int status(int type)
{
    if (type==SENSORS_HW_INIT)
    {
        return (state==0x80);
    }
    else if (type==SENSORS_ACTIVE)
    {
        return (state);
    }
    return (0);
}

SENSORS_SENSOR(adc_sensor, ADC_SENSOR, value, configure, status);