/**
 * STM8S-EK 驱动程序练习--按键部分，包含一个普通按键和一个Joystick
 * key.c
 * @author lisy
 * @date   20170507 1207
*/
#include "key.h"
#include "stm8s_gpio.h"

#define     KEY_PORT              GPIOD
#define     KEY_PIN               GPIO_PIN_3

#define     JOYSTICK_PORT          GPIOB
#define     JOYSTICK_UP_PIN        GPIO_PIN_6
#define     JOYSTICK_DOWN_PIN      GPIO_PIN_7
#define     JOYSTICK_LEFT_PIN      GPIO_PIN_4
#define     JOYSTICK_ENTER_PIN     GPIO_PIN_5

#define     JOYSTICK_RIGHT_PORT    GPIOD
#define     JOYSTICK_RIGHT_PIN     GPIO_PIN_7

/**
 *@brief init the kay and joystick
*/
void key_init(void)
{
    GPIO_Init(KEY_PORT, KEY_PIN, GPIO_MODE_IN_PU_NO_IT);
    GPIO_Init(JOYSTICK_PORT, JOYSTICK_UP_PIN|JOYSTICK_DOWN_PIN|JOYSTICK_LEFT_PIN|JOYSTICK_ENTER_PIN, GPIO_MODE_IN_PU_NO_IT);
    GPIO_Init(JOYSTICK_RIGHT_PORT, JOYSTICK_RIGHT_PIN, GPIO_MODE_IN_PU_NO_IT);
}

/**
 *@brief 获取key和joystick状态
 *@return bit0  key;
 *        bit1  joystick_right
 *        bit4  joystick_left
 *        bit5  joystick_enter
 *        bit6  joystick_up
 *        bit7  joystick_down
*/
uint8_t get_key_state(void)
{
    uint8_t sta;
    sta =  GPIO_ReadInputData(JOYSTICK_PORT);
    sta &= 0xf0;
    if (GPIO_ReadInputPin(JOYSTICK_RIGHT_PORT, JOYSTICK_RIGHT_PIN))
    {
        sta |= (0x01<<1);
    }
    if (GPIO_ReadInputPin(KEY_PORT, KEY_PIN))
    {
        sta |= (0x01<<0);
    }
    return (sta);
}
