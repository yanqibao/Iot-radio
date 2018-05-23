/**
 * STM8S-EK 驱动程序练习--debug打印信息部分
 * debug.h
 * @author lisy
 * @date   20170507 1413
*/
#ifndef     DEBUG_H
#define     DEBUG_H


/**
 * @brief 打印字符串，支持：%s、%d和%h
 * %c
*/
void print(char *s, ...);

#endif