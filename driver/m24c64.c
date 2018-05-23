/**
 * STM8S-EK ����������ϰ--eeprom�洢����
 * m24c64.c
 * @author lisy
 * @date   20170508~12
*/
#include "stm8s.h"
#include "m24c64.h"
#include "minu_iic.h"
#include "delay.h"

#define     IIC_TYPE_SIMU          1
#define     IIC_TYPE_HARD          0//Ĭ��
#define     IIC_TYPE               IIC_TYPE_HARD


/**
 * @brief ʹ�����ַ�ʽ����ɺ�m24c64��ͨѶ��ģ��iic����Ӳ��
 * @NOTE  ���ģ�⺯��ʵ��
*/

/**
 * ����m24c64оƬ
*/
uint8_t simu_iic_test(uint8_t *dat)
{
    uint8_t addr;
    uint8_t flag = 0x01;
    uint8_t  i;
    
    simu_iic_gpio_init();
    
    simu_iic_start();
    addr = 0xA0|IIC_WRITE;
    if(IIC_NOACK==simu_iic_send(addr))
    {
        goto end;
    }
    addr = 0x00;
    if(IIC_NOACK==simu_iic_send(addr))
    {
        goto end;
    }
    addr = 0x00;
    if(IIC_NOACK==simu_iic_send(addr))
    {
        goto end;
    }
    addr = 0x73;
    if(IIC_NOACK==simu_iic_send(addr))
    {
        goto end;
    }
    simu_iic_stop();
    delay_nms(12);//delay more than 10ms
    simu_iic_start();
    addr = 0xA0|IIC_WRITE;
    if(IIC_NOACK==simu_iic_send(addr))
    {
        goto end;
    }
    addr = 0x00;
    if(IIC_NOACK==simu_iic_send(addr))
    {
        goto end;
    }
    addr = 0x00;
    if(IIC_NOACK==simu_iic_send(addr))
    {
        goto end;
    }
    simu_iic_start();
    
    addr = 0xA0|IIC_READ;
    if(IIC_ACK==simu_iic_send(addr))
    {
        *dat = simu_iic_receive(IIC_NOACK);
        flag = 0x00;
    }
    else
    {
        goto end;
    }
end:
    simu_iic_stop();
    return (flag);
}

/**
 * ��װm24c64
*/

/**
 * @brief ҳд�롣ָ��ҳ������ƫ�Ƶ�ַ�ͳ���
 * @param pageָ������ҳ��offset ָ��ҳ��ƫ������*buff ������ָ�룬len ���ݳ���
 * @return ����״̬ 0x00 �ɹ���0x01 ʧ��
*/
static uint8_t page_write(uint8_t page, uint8_t offset, uint8_t *buff, uint8_t len)
{
    uint16_t addr;
    uint8_t  device;
    uint8_t  ret=0x01;
    uint8_t  i;
    
    if ((offset+len)>32)
    {
        return (0x01);
    }
    addr = page;
    addr <<= 5;//page*32
    addr += offset;
    device = 0xa0|IIC_WRITE;
    simu_iic_start();                            //1. start iic
    if (IIC_NOACK==simu_iic_send(device))        //2. send device no
    {
        goto page_write_end;
    }
    if (IIC_NOACK==simu_iic_send(addr>>8))       //3. send 16bit address
    {
        goto page_write_end;
    }
    if (IIC_NOACK==simu_iic_send((uint8_t)addr))
    {
        goto page_write_end;
    }
    
    for (i=0; i<len; i++)
    {
        if(IIC_NOACK==simu_iic_send(buff[i]))    //4. send data
        {
            goto page_write_end;
        }
    }
    ret = 0x00;
page_write_end:
    simu_iic_stop();                             //5. stop
    return (ret);
}

/**
 * @brief ҳ��ȡ����ȡĳһҳ��һ�ε�ַ������
 * @param page��offsetָ������ҳ����ƫ�Ƶ�ַ
 *        buff��lenָ������ָ��ͳ���
 * @return ��ȡ״̬��0x00 �ɹ���0x01 ʧ��
*/
static uint8_t page_read(uint8_t page, uint8_t offset, uint8_t *buff, uint8_t len)
{
    uint16_t addr;
    uint8_t  device;
    uint8_t  ret=0x01;
    uint8_t  i;
    
    if ((offset+len)>32)
    {
        return (0x01);
    }
    addr = page;
    addr <<= 5;//page*32
    addr += offset;
    device = 0xa0|IIC_WRITE;
    simu_iic_start();                            //1. start iic
    if (IIC_NOACK==simu_iic_send(device))        //2. send device no
    {
        goto page_read_end;
    }
    if (IIC_NOACK==simu_iic_send(addr>>8))       //3. send 16bit address
    {
        goto page_read_end;
    }
    if (IIC_NOACK==simu_iic_send((uint8_t)addr))
    {
        goto page_read_end;
    }
    simu_iic_start();
    
    device = 0xA0|IIC_READ;
    if(IIC_NOACK==simu_iic_send(device))
    {
        goto page_read_end;
    }
    for (i=0; i<len-1; i++)
    {
        buff[i] = simu_iic_receive(IIC_ACK);
    }
    buff[i] = simu_iic_receive(IIC_NOACK);
    ret = 0x00;
page_read_end:
    simu_iic_stop();                             //5. stop
    return (ret);
}
/**
 * @brief m24c64�ṩ�Ĵ洢����
 * @note  m24c64�ṩ8K bytes�洢�ռ䣬�������Ϊ0~8K-1�ĵ�ַ��
 * @param addr ָ���洢��ַ��buff��lenָ��������ָ��ͳ���
 * @return ���ز���״̬ 0x00 �ɹ���0x01 �쳣
*/
uint8_t m24c64_save(uint16_t addr, uint8_t *buff, uint16_t len)
{
    uint8_t  page_cnt;
    uint8_t  page;
    uint8_t  offset;
    uint8_t  cnt;
    uint16_t index;
    
    if (!len)
    {
        return (0x00);
    }
    if ((addr+len)>1024u*8)
    {
        return (0x01);
    }
    
    page = addr>>5;
    offset = (uint8_t)(addr&0x001f);
    cnt = (len>(32-offset)?(32-offset):len);
    if (page_write(page, offset, buff, cnt))
    {
        return (0x01);
    }
    delay_nms(12);//more than 10ms
    index = cnt;
    if (index==len)
    {
        return (0x00);
    }
    
    page_cnt = (len-index)>>5;
    while (page_cnt)
    {
        page_cnt--;
        page++;
        if(page_write(page, 0, buff+index, 32))
        {
            return (0x01);
        }
        delay_nms(12);//more than 10ms
        index += 32;
    }
    cnt = len-index;
    page++;
    if (page_write(page, 0, buff+index, cnt))
    {
        return (0x01);
    }
    delay_nms(12);//more than 10ms
    return (0x00);
}

/**
 * @brief m24c64�ṩ�Ĵ洢����;��ȡ����
 * @param addr ָ���洢��ַ��buff��lenָ��������ָ��ͳ���
 * @return ���ز���״̬ 0x00 �ɹ���0x01 �쳣
*/
uint8_t m24c64_read(uint16_t addr, uint8_t *buff, uint16_t len)
{
    uint8_t  page_cnt;
    uint8_t  page;
    uint8_t  offset;
    uint8_t  cnt;
    uint16_t index;
    
    if (!len || (addr+len)>1024u*8)
    {
        return (0x01);
    }
    
    page = addr>>5;
    offset = (uint8_t)(addr&0x001f);
    cnt = (len>(32-offset)?(32-offset):len);
    if (page_read(page, offset, buff, cnt))
    {
        return (0x01);
    }
    index = cnt;
    if (index==len)
    {
        return (0x00);
    }
    
    page_cnt = (len-index)>>5;
    while (page_cnt)
    {
        page_cnt--;
        page++;
        if(page_read(page, 0, buff+index, 32))
        {
            return (0x01);
        }
        index += 32;
    }
    cnt = len-index;
    page++;
    if (page_read(page, 0, buff+index, cnt))
    {
        return (0x01);
    }
    
    return (0x00);
}

/**
 * @brief ����m24c64ʱ�ĳ�ʼ������
*/
void m24c64_init(void)
{
    simu_iic_gpio_init();
}