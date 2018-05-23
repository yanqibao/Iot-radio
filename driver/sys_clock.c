/**
 * STM8S-EK 驱动程序练习--时钟部分
 * clock.c
 * @author lisy
 * @date   20170507 0000
*/

#include "sys_clock.h"
#include "stm8s.h"
#include "stm8s_flash.h"

static uint32_t clock_frequency=2000000ul;
/**
 * @note 初始化时钟使用外部24M或者内部16M作为系统时钟源
*/
void sys_clock_init(enum clock_type clock)
{
    if (clock==HSE)
    {
        uint8_t opt7;
        uint16_t value;
        CLK_DeInit();
        //1. 检查选项字是否设置正确
        #define OPT7_ADDR    0x480D
        if (FLASH_OPTIONBYTE_ERROR==(value=FLASH_ReadOptionByte(OPT7_ADDR)))//
        {
            while (1);
        }
        value >>= 8;
        if (!(value&0x01))//wait state bit0
        {
            value |= 0x01;
            FLASH_Unlock(FLASH_MEMTYPE_DATA);
            FLASH_ProgramOptionByte(OPT7_ADDR, value);//enable the wait state
            FLASH_Lock(FLASH_MEMTYPE_DATA);
        }
        //2. 设置外外部24M时钟源
        CLK_HSECmd(ENABLE);
        //以较慢的时钟初始化
        //CLK_ClockSwitchCmd(ENABLE);????
        CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSE, DISABLE, CLK_CURRENTCLOCKSTATE_DISABLE);
        CLK_SYSCLKConfig(CLK_PRESCALER_HSIDIV1);
        clock_frequency = 24000000ul;
    }
    else if (clock==HSI)
    {
        CLK_DeInit();
        /* Configure the HSI prescaler to the optimal value */
        CLK_SYSCLKConfig(CLK_PRESCALER_HSIDIV1);
        /* Configure the system clock to use HSI clock source and to run at 16Mhz */
        CLK_ClockSwitchConfig(CLK_SWITCHMODE_MANUAL, CLK_SOURCE_HSI, DISABLE, CLK_CURRENTCLOCKSTATE_DISABLE);
        CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
        clock_frequency = 16000000ul;
    }
}

/**
 * @brief 获取系统工作时钟频率
*/
uint32_t sys_clock_freq(void)
{
    return (clock_frequency);
}