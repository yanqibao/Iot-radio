/**
 * STM8S-EK ����������ϰ--eeprom�洢����
 * m24c64.h
 * @author lisy
 * @date   20170508~12
*/
#ifndef     M24C64_H
#define     M24C64_H
#include "stm8s.h"

/**
 * @brief m24c64�ṩ�Ĵ洢����
 * @note  m24c64�ṩ8K bytes�洢�ռ䣬�������Ϊ0~8K-1�ĵ�ַ��
 * @param addr ָ���洢��ַ��buff��lenָ��������ָ��ͳ���
 * @return ���ز���״̬ 0x00 �ɹ���0x01 �쳣
*/
extern uint8_t m24c64_save(uint16_t addr, uint8_t *buff, uint16_t len);

/**
 * @brief m24c64�ṩ�Ĵ洢����;��ȡ����
 * @param addr ָ���洢��ַ��buff��lenָ��������ָ��ͳ���
 * @return ���ز���״̬ 0x00 �ɹ���0x01 �쳣
*/
extern uint8_t m24c64_read(uint16_t addr, uint8_t *buff, uint16_t len);

/**
 * @brief ����m24c64ʱ�ĳ�ʼ������
*/
extern void m24c64_init(void);
#endif
