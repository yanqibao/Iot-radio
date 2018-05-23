/**
 * adc-sensor.h
*/

/**
 * adc sensor ��ϰ�����������ϵ�����ģ������ͨ��adc�ɼ���
 * 1.�ɱ�������ֵ��С��2.���ߴ���������ֵ�Ĵ�С��
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