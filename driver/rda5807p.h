/**
 * STM8S-EK ����������ϰ--ʱ�Ӳ���
 * rda5807p.h
 * @author lisy
 * @date   20170513 1338
*/
#ifndef     RAD5807P_H
#define     RAD5807P_H
#include "stm8s.h"

/**
 * @brief rda5807p ��ʼ������
*/
extern void rda5807p_init(void);

/**
 * @brief change radio channel
 * @param freq -- ��̨Ƶ�� ��λKHz
*/
extern uint8_t rda5807p_set_channel(uint32_t freq);

/**
 * @brief ��������,0~31
 * @param volumeȡֵ0~31
*/
extern uint8_t rda5807p_volume(uint8_t volume);

/**
 * @brief radio������87~108MHzƵ�Σ�100KHz���������
*/
extern uint8_t rda5807p_seek(uint32_t *channel, uint16_t cnt);
#endif