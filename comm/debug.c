/**
 * STM8S-EK 驱动程序练习--debug打印信息部分
 * debug.c
 * @author lisy
 * @date   20170507 1413
*/
#include "stm8s.h"
#include <stdarg.h>
#include "debug.h"
/**
 *@brief 实现一个便于打印调试信息的函数。
 *支持打印：字符串、十进制和十六进制数
*/

/**
 * @brief 外部提供的，打印一个字符的函数
*/
extern char putchar(char ch);

/**
 * @brief 打印一个字符串
*/
static void print_s(char  *s)
{
    while (*s != '\0')
    {
        putchar(*s);
        s++;
    }
}

/**
 * @brief 打印一个十进制数
*/
static void print_dec(unsigned short num)
{
    uint8_t buff[5];
    uint8_t i;
    uint8_t j;
    if (num==0)
    {
        putchar('0');
    }
    for (i=0; i<5; i++)
    {
        buff[4-i] = num%10;
        num = num/10;
    }
    for (i=0; i<5; i++)
    {
        if (buff[i] != 0)
        {
            break;
        }
    }
    for (j=i; j<5; j++)
    {
        putchar('0'+buff[j]);
    }
}

#define CHAR2HEX(X)    (X)>9?((X)-10+'a'):((X)+'0')
/**
 * @brief 打印一个十六进制
*/
static void print_hex(uint8_t num)
{
    putchar('0');
    putchar('x');
    putchar(CHAR2HEX(num>>4));
    putchar(CHAR2HEX(num&0x0f));
}

/**
 * @brief 打印字符串，支持：%s、%d和%h
 * %c
*/
void print(char *s, ...)
{
    va_list var_arg;
    va_start(var_arg, s);
    while (*s != '\0')
    {
        if (*s != '%')
        {
            putchar(*s);
        }
        else
        {
            s++;
            switch (*s)
            {
                case 's':
                    print_s(va_arg(var_arg, char *));
                break;
                case 'd':
                    print_dec(va_arg(var_arg, short));
                break;
                case 'h':
                    print_hex(va_arg(var_arg, char));
                break;
                case 'c':
                    putchar(*(s+1));
                break;
                default:
                    va_end(var_arg);
                return;
            }
        }
        s++;
    }
    va_end(var_arg);
}