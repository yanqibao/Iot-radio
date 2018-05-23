/**
 * STM8S-EK ����������ϰ--ģ��iic����
 * minu_iic.h
 * @author lisy
 * @date   20170512
*/
#ifndef     MINU_IIC_H
#define     MINU_IIC_H
#include "stm8s.h"
#define         IIC_READ    0x01
#define         IIC_WRITE   0x00

#define         IIC_ACK            0
#define         IIC_NOACK          1

/**
 * ģ��iicʹ�����ų�ʼ��
*/
extern void simu_iic_gpio_init(void);

/**
 * @brief ������ʼ�ź�
*/
extern void simu_iic_start(void);

/**
 * @brief ����һ�������ź�
*/
extern void simu_iic_stop(void);

/**
 * @brief �������ϴ���һ���ֽڣ������ؽ��շ�����Ӧ��
 * @param ��������
 * @return 
*/
extern uint8_t simu_iic_send(uint8_t dat);

/**
 * @brief �������Ͻ���һ���ֽڡ�
 * @param �Ƿ���ack��Ӧ
 * @return ���ؽ��յ�������
*/
extern uint8_t simu_iic_receive(uint8_t ack);

#endif