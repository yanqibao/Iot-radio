/**
 * STM8S-EK ����������ϰ--debug��ӡ��Ϣ����
 * debug.c
 * @author lisy
 * @date   20170507 1413
*/
#include "stm8s.h"
#include <stdarg.h>
#include "debug.h"
/**
 *@brief ʵ��һ�����ڴ�ӡ������Ϣ�ĺ�����
 *֧�ִ�ӡ���ַ�����ʮ���ƺ�ʮ��������
*/

/**
 * @brief �ⲿ�ṩ�ģ���ӡһ���ַ��ĺ���
*/
extern char putchar(char ch);

/**
 * @brief ��ӡһ���ַ���
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
 * @brief ��ӡһ��ʮ������
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
 * @brief ��ӡһ��ʮ������
*/
static void print_hex(uint8_t num)
{
    putchar('0');
    putchar('x');
    putchar(CHAR2HEX(num>>4));
    putchar(CHAR2HEX(num&0x0f));
}

/**
 * @brief ��ӡ�ַ�����֧�֣�%s��%d��%h
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