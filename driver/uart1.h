/**
 * STM8S-EK 驱动程序练习--串口部分
 * uart.h
 * @author lisy
 * @date   20170507 1720
*/
/**
 * uart1作为打印信息输出口。
*/
#ifndef     UART1_H
#define     UART1_H

/**
 *  重定义了putchar函数，putchar_init初始化参数
 *  串口工作在115200bps、8N1格式。
*/
extern void putchar_init(void);

#endif