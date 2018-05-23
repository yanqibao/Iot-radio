/**
 * STM8S-EK 驱动程序练习--时钟部分
 * rda5807p.c
 * @author lisy
 * @date   20170513 1338
*/

#include "stm8s.h"
#include "minu_iic.h"
#include "delay.h"
#include "debug.h"
#include <string.h>

union rda5807p_config_reg
{
    struct
    {
        struct
        {
            uint16_t ENABLE:1;
            uint16_t SOFT_RESET:1;
            uint16_t RESERVED0:2;
            uint16_t CLK_MODE:3;
            uint16_t SKMODE:1;
            uint16_t SEEK:1;
            uint16_t SEEKUP:1;
            uint16_t RESERVED1:2;
            uint16_t BASS:1;
            uint16_t MONO:1;
            uint16_t DMUTE:1;
            uint16_t DHIZ:1;
        }_02H;
        struct
        {
            uint16_t SPACE:2;
            uint16_t BAND:2;
            uint16_t TUNE:1;
            uint16_t RESERVED0:1;
            uint16_t CHAN:10;
        }_03H;
        struct
        {
            uint16_t GPIO1:2;
            uint16_t GPIO2:2;
            uint16_t GPIO3:2;
            uint16_t I2S_ENABLED:1;
            uint16_t RESERVED0:3;
            uint16_t RESERVED1:1;
            uint16_t DE:1;
            uint16_t RESERVED2:2;
            uint16_t STCIEN:1;
            uint16_t RESERVED3:1;
        }_04H;
        struct
        {
            uint16_t VOLUME:4;
            uint16_t LNA_ICSEL_BIT:2;
            uint16_t LNA_PORT_SEL:2;
            uint16_t SEEKTH:7;
            uint16_t INT_MODE:1;
        }_05H;
    };
    uint16_t reg[4];
};

union rda5807p_state_reg
{
    struct
    {
        struct
        {
            uint16_t READCHAN:10;
            uint16_t ST:1;
            uint16_t RESERVED0:2;
            uint16_t SF:1;
            uint16_t STC:1;
            uint16_t RESERVED:1;
        }_0AH;
        struct
        {
            uint16_t RESERVED0:7;
            uint16_t FM_READY:1;
            uint16_t FM_TRUE:1;
            uint16_t RSSI:7;
        }_0BH;
    };
    uint16_t reg[2];
};

//全局的rda5807p配置寄存器值与配置寄存器
union rda5807p_config_reg radio_config;
union rda5807p_state_reg  radio_sta;

/**
 * 刷新rda寄存器
 *
*/
uint8_t rda5807p_update_reg(uint8_t stop)
{
    uint8_t device;
    uint8_t addr;
    uint8_t i;
    uint8_t flag=0x01;
    
    stop = stop>4?4:stop;
    
    device = 0x20|IIC_WRITE;
    simu_iic_start();
    if (IIC_NOACK==simu_iic_send(device))
    {
        goto update_reg_end;
    }
    for (i=0; i<stop; i++)
    {
        if (IIC_NOACK==simu_iic_send((uint8_t)(radio_config.reg[i]>>8)))
        {
            goto update_reg_end;
        }
        if (IIC_NOACK==simu_iic_send((uint8_t)radio_config.reg[i]))
        {
            goto update_reg_end;
        }
    }
    flag = 0x00;
update_reg_end:
    simu_iic_stop();
    return (flag);
}

/**
 * 获取rda5807p状态
*/
uint8_t rda5807p_update_state(void)
{
    uint8_t device;
    uint8_t tmp[4];
    uint8_t i;
    uint8_t flag=0x01;
    
    device = 0x20|IIC_READ;
    simu_iic_start();
    if (IIC_NOACK==simu_iic_send(device))
    {
        goto update_state_end;
    }
    for (i=0; i<3; i++)
    {
        tmp[i]=simu_iic_receive(IIC_ACK);
    }
    tmp[i]=simu_iic_receive(IIC_NOACK);
    
    radio_sta.reg[0] = (uint16_t)tmp[0];
    radio_sta.reg[0] <<= 8;
    radio_sta.reg[0] += (uint16_t)tmp[1];
    radio_sta.reg[1] = (uint16_t)tmp[2];
    radio_sta.reg[1] <<= 8;
    radio_sta.reg[1] += (uint16_t)tmp[3];
    
    flag = 0x00;
update_state_end:
    simu_iic_stop();
    return (flag);
}

/**
 * @brief rda5807p 初始化函数
*/
void rda5807p_init(void)
{
    memset(&radio_config, 0, sizeof(radio_config));
    radio_config._02H.ENABLE = 1;
    radio_config._02H.SOFT_RESET = 0;
    radio_config._02H.RESERVED0=0;
    radio_config._02H.CLK_MODE = 0;
    radio_config._02H.SKMODE = 1;//stop seeking at the upper or lower band limit
    radio_config._02H.SEEK = 0;
    radio_config._02H.SEEKUP = 1;
    radio_config._02H.RESERVED1 = 0;
    radio_config._02H.BASS = 1;
    radio_config._02H.MONO = 0;
    radio_config._02H.DMUTE = 1;
    radio_config._02H.DHIZ = 1;
    
    radio_config._03H.SPACE = 0x00;//100KHz
    radio_config._03H.BAND = 0x00;//87~108MHz
    radio_config._03H.TUNE = 0;
    radio_config._03H.RESERVED0 = 0;
    radio_config._03H.CHAN = 0x00c0;
    
    radio_config._04H.GPIO1 = 0;
    radio_config._04H.GPIO2 = 0;
    radio_config._04H.GPIO3 = 0;
    radio_config._04H.I2S_ENABLED = 0;
    radio_config._04H.RESERVED0 = 0;
    radio_config._04H.RESERVED1 = 1;
    radio_config._04H.DE = 0;
    radio_config._04H.RESERVED2 = 0;
    radio_config._04H.STCIEN = 0;
    radio_config._04H.RESERVED3 = 1;
    
    radio_config._05H.VOLUME = 0x03;
    radio_config._05H.LNA_ICSEL_BIT = 0x2;
    radio_config._05H.LNA_PORT_SEL = 0x02;
    radio_config._05H.SEEKTH = 0x08;
    radio_config._05H.INT_MODE = 0x00;
    
    simu_iic_gpio_init();
    
    rda5807p_update_reg(4);
    
    delay_nms(500);
    
    radio_config._03H.TUNE = 1;
    rda5807p_update_reg(2);
    delay_nms(30);
    rda5807p_update_state();
}

/**
 * @brief change radio channel
 * @param freq -- 电台频率 单位KHz
*/
uint8_t rda5807p_set_channel(uint32_t freq)
{
    uint16_t channel;
    channel = (freq-87000ul)/100;
    radio_config._03H.CHAN = channel;
    radio_config._03H.TUNE = 1;
    rda5807p_update_reg(2);
    do
    {
        delay_nms(2);//2ms
        rda5807p_update_state();
    }
    while (radio_sta._0AH.STC==0);
    
    if (radio_sta._0AH.READCHAN==channel)
    {
        return (0x00);
    }
    
    return (0x01);
}

/**
 * @brief 调整音量,0~31
 * @param volume取值0~31
*/
uint8_t rda5807p_volume(uint8_t volume)
{
    radio_config._05H.VOLUME = volume;
    rda5807p_update_reg(4);
    return (0x00);
}

/**
 * @brief radio工作在87~108MHz频段，100KHz工作间隔。
*/
uint16_t rda5807p_seek(uint32_t *channel, uint16_t cnt)
{
    uint16_t index=0;
    uint32_t freq;
    
    rda5807p_set_channel(87100ul);//87100KHz=87.1M
    delay_nms(5);//5ms wait for the STC clear
    do
    {
        radio_config._02H.SEEK = 1;
        delay_nms(5);//5ms wait for the STC clear
        rda5807p_update_reg(1);
        do
        {
            delay_nms(2);//2ms
            rda5807p_update_state();
        }
        while (radio_sta._0AH.STC==0);
        if (radio_sta._0AH.SF)
        {
            break;
        }
        if (radio_sta._0BH.FM_TRUE)
        {
            print("seek the radio station.channel is %d, rssi is %d\r\n", (short)radio_sta._0AH.READCHAN, (short)radio_sta._0BH.RSSI);
            freq = radio_sta._0AH.READCHAN;
            freq *= 100;
            freq += 87000ul;//单位1KHz
            channel[index] = freq;
            index++;
        }
        print("seek the %d channel\r\n", (short)radio_sta._0AH.READCHAN);
        
    }
    while (index<cnt);
    
    return (index);
}


