/**
 * adc-sensor.h
*/

/**
 * adc sensor 练习。管理开发板上的两个模拟量，通过adc采集。
 * 1.可变电阻的阻值大小；2.光线传感器的阻值的大小。
*/

#ifndef     ADC_SENSORS_H
#define     ADC_SENSORS_H

#include "lib/sensors.h"
#include "stm8s_adc2.h"
extern const struct sensors_sensor adc_sensor;

#define ADC_SENSOR  "adc-sensor"

#define ADC_TYPE_RW     ADC2_CHANNEL_9
#define ADC_TYPE_PHO    ADC2_CHANNEL_8

#endif