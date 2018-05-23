/**
 * STM8S-EK 驱动程序练习--模拟iic部分
 * minu_iic.h
 * @author lisy
 * @date   20170512
*/
#include "minu_iic.h"
#include "stm8s_gpio.h"
#include "delay.h"

#define     SIMU_IIC_CLK_PORT      GPIOE
#define     SIMU_IIC_CLK_PIN       GPIO_PIN_1
#define     SIMU_IIC_DATA_PORT     GPIOE
#define     SIMU_IIC_DATA_PIN      GPIO_PIN_2

#define     SIMU_IIC_DATA_IN()     do{GPIO_Init(SIMU_IIC_DATA_PORT, SIMU_IIC_DATA_PIN, GPIO_MODE_IN_PU_NO_IT);}while(0)
#define     SIMU_IIC_DATA_OUT()    do{GPIO_Init(SIMU_IIC_DATA_PORT, SIMU_IIC_DATA_PIN, GPIO_MODE_OUT_PP_HIGH_SLOW);}while(0)
#define     SIMU_IIC_CLK_L()       do{GPIO_WriteLow(SIMU_IIC_CLK_PORT, SIMU_IIC_CLK_PIN);}while(0)
#define     SIMU_IIC_CLK_H()       do{GPIO_WriteHigh(SIMU_IIC_CLK_PORT, SIMU_IIC_CLK_PIN);}while(0)
#define     SIMU_IIC_DATA_H()      do{GPIO_WriteHigh(SIMU_IIC_DATA_PORT, SIMU_IIC_DATA_PIN);}while(0)
#define     SIMU_IIC_DATA_L()      do{GPIO_WriteLow(SIMU_IIC_DATA_PORT, SIMU_IIC_DATA_PIN);}while(0)
#define     SIMU_IIC_DATA()        (GPIO_ReadInputPin(SIMU_IIC_DATA_PORT, SIMU_IIC_DATA_PIN)?IIC_NOACK:IIC_ACK)


//volatile uint8_t start_cnt;
//volatile uint8_t stop_cnt;
/**
 *
 * 延时0.6us 注意在24000000时钟下
*/
static void delay(uint32_t i)
{
    uint8_t cnt;
    while (i)
    {
        i--;
//        start_cnt = get_cnt();
        cnt = 0;
        while (cnt++ < 6);
//        stop_cnt = get_cnt();
    }
}
/**
 * 模拟iic使用引脚初始化
*/
void simu_iic_gpio_init(void)
{
    static uint8_t init=0;
    if (init)
    {
        return;
    }
    init = 1;
    GPIO_Init(SIMU_IIC_CLK_PORT, SIMU_IIC_CLK_PIN, GPIO_MODE_OUT_PP_HIGH_SLOW);//clk output
    SIMU_IIC_CLK_H();
    SIMU_IIC_DATA_IN();
}

//volatile uint32_t start;
//volatile uint32_t stop;

/**
 * @brief 产生开始信号
*/
void simu_iic_start(void)
{
    //test
//    start = get_clock();
//    delay(1000u);
//    stop =  get_clock();
    SIMU_IIC_CLK_H();
    delay(1);
    SIMU_IIC_DATA_OUT();
    SIMU_IIC_DATA_L();
    delay(1);
    SIMU_IIC_CLK_L();
    delay(1);
    SIMU_IIC_DATA_IN();
}

/**
 * @brief 产生一个结束信号
*/
void simu_iic_stop(void)
{
    SIMU_IIC_DATA_OUT();
    SIMU_IIC_DATA_L();
    delay(1);
    SIMU_IIC_CLK_H();
    delay(1);
    SIMU_IIC_DATA_IN();
    delay(1);
}

/**
 * @brief 在总线上传输一个字节，并返回接收方的响应。
 * @param 传输数据
 * @return 
*/
uint8_t simu_iic_send(uint8_t dat)
{
    volatile uint8_t i;
    volatile uint8_t flag=0x01;
    SIMU_IIC_DATA_OUT();
    for (i=0; i<8; i++)
    {
        SIMU_IIC_CLK_L();
        delay(1);
        if (dat&0x80)
        {
            SIMU_IIC_DATA_H();
        }
        else
        {
            SIMU_IIC_DATA_L();
        }
        delay(1);
        SIMU_IIC_CLK_H();
        dat<<=1;
        delay(1);
    }
    SIMU_IIC_CLK_L();
    SIMU_IIC_DATA_IN();//释放总线
    delay(1);
    SIMU_IIC_CLK_H();
    flag = SIMU_IIC_DATA();
    SIMU_IIC_CLK_L();
    delay(1);
    return (flag);
}

/**
 * @brief 在总线上接收一个字节。
 * @param 是否发送ack响应
 * @return 返回接收到的数据
*/
uint8_t simu_iic_receive(uint8_t ack)
{
    uint8_t dat=0x00;
    uint8_t i;
    for (i=0; i<8; i++)
    {
        dat <<= 1;
        SIMU_IIC_CLK_L();
        delay(1);
        SIMU_IIC_CLK_H();
        if(SIMU_IIC_DATA())
        {
            dat|=0x01;
        }
        delay(1);
    }
    SIMU_IIC_CLK_L();
    delay(1);
    SIMU_IIC_DATA_OUT();
    if (ack==IIC_ACK)
    {
        SIMU_IIC_DATA_L();
    }
    else
    {
        SIMU_IIC_DATA_H();
    }
    delay(1);
    SIMU_IIC_CLK_H();
    delay(1);
    SIMU_IIC_CLK_L();
    SIMU_IIC_DATA_IN();  //释放总线
    return (dat);
}