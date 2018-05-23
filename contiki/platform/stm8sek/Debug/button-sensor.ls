   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  16                     	switch	.data
  17  0000               _sta:
  18  0000 00            	dc.b	0
  56                     ; 13 static int value(int type)
  56                     ; 14 {
  58                     	switch	.text
  59  0000               L3_value:
  63                     ; 15     return (1);
  65  0000 ae0001        	ldw	x,#1
  68  0003 81            	ret
 112                     ; 17 static int configure(int type, int value)
 112                     ; 18 {
 113                     	switch	.text
 114  0004               L72_configure:
 116  0004 89            	pushw	x
 117       00000000      OFST:	set	0
 120                     ; 19     switch (type)
 123                     ; 38         break;
 124  0005 1d0080        	subw	x,#128
 125  0008 2705          	jreq	L13
 126  000a 5a            	decw	x
 127  000b 2717          	jreq	L33
 128  000d 2039          	jra	L55
 129  000f               L13:
 130                     ; 21         case SENSORS_HW_INIT:
 130                     ; 22         //初始化 PD3初始化为中断
 130                     ; 23             sta = 1;
 132  000f 35010000      	mov	_sta,#1
 133                     ; 24             timer_set(&wait, 0);
 135  0013 5f            	clrw	x
 136  0014 89            	pushw	x
 137  0015 ae0000        	ldw	x,#_wait
 138  0018 cd0000        	call	_timer_set
 140  001b 85            	popw	x
 141                     ; 25             EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOD, EXTI_SENSITIVITY_RISE_FALL);
 143  001c ae0303        	ldw	x,#771
 144  001f cd0000        	call	_EXTI_SetExtIntSensitivity
 146                     ; 26         break;
 148  0022 2024          	jra	L55
 149  0024               L33:
 150                     ; 27         case SENSORS_ACTIVE:
 150                     ; 28             if (value)
 152  0024 1e05          	ldw	x,(OFST+5,sp)
 153  0026 2711          	jreq	L75
 154                     ; 30                 GPIO_Init(GPIOD, GPIO_PIN_3, GPIO_MODE_IN_PU_IT);
 156  0028 4b60          	push	#96
 157  002a 4b08          	push	#8
 158  002c ae500f        	ldw	x,#20495
 159  002f cd0000        	call	_GPIO_Init
 161  0032 85            	popw	x
 162                     ; 31                 sta = 2;
 164  0033 35020000      	mov	_sta,#2
 166  0037 200f          	jra	L55
 167  0039               L75:
 168                     ; 35                 GPIO_Init(GPIOD, GPIO_PIN_3, GPIO_MODE_IN_PU_NO_IT);
 170  0039 4b40          	push	#64
 171  003b 4b08          	push	#8
 172  003d ae500f        	ldw	x,#20495
 173  0040 cd0000        	call	_GPIO_Init
 175  0043 85            	popw	x
 176                     ; 36                 sta = 0;
 178  0044 725f0000      	clr	_sta
 179  0048               L55:
 180                     ; 40 }
 183  0048 85            	popw	x
 184  0049 81            	ret
 216                     ; 41 static int status(int type)
 216                     ; 42 {
 217                     	switch	.text
 218  004a               L36_status:
 222                     ; 43     return 1;
 224  004a ae0001        	ldw	x,#1
 227  004d 81            	ret
 256                     ; 46 @interrupt void PortD_isr(void)
 256                     ; 47 {
 257                     	switch	.text
 258  004e               _PortD_isr:
 260  004e 8a            	push	cc
 261  004f 84            	pop	a
 262  0050 a4bf          	and	a,#191
 263  0052 88            	push	a
 264  0053 86            	pop	cc
 265  0054 3b0002        	push	c_x+2
 266  0057 be00          	ldw	x,c_x
 267  0059 89            	pushw	x
 268  005a 3b0002        	push	c_y+2
 269  005d be00          	ldw	x,c_y
 270  005f 89            	pushw	x
 273                     ; 48     if (!GPIO_ReadInputPin(GPIOD, GPIO_PIN_3))
 275  0060 4b08          	push	#8
 276  0062 ae500f        	ldw	x,#20495
 277  0065 cd0000        	call	_GPIO_ReadInputPin
 279  0068 5b01          	addw	sp,#1
 280  006a 4d            	tnz	a
 281  006b 261e          	jrne	L111
 282                     ; 50         if (timer_expired(&wait))
 284  006d ae0000        	ldw	x,#_wait
 285  0070 cd0000        	call	_timer_expired
 287  0073 a30000        	cpw	x,#0
 288  0076 2736          	jreq	L511
 289                     ; 52             timer_set(&wait, 200);//100ms内只响应一次中断
 291  0078 ae00c8        	ldw	x,#200
 292  007b 89            	pushw	x
 293  007c ae0000        	ldw	x,#_wait
 294  007f cd0000        	call	_timer_set
 296  0082 85            	popw	x
 297                     ; 53             sensors_changed(&button_sensor);
 299  0083 ae0000        	ldw	x,#_button_sensor
 300  0086 cd0000        	call	_sensors_changed
 302  0089 2023          	jra	L511
 303  008b               L111:
 304                     ; 56     else if (GPIO_ReadInputPin(GPIOD, GPIO_PIN_3))
 306  008b 4b08          	push	#8
 307  008d ae500f        	ldw	x,#20495
 308  0090 cd0000        	call	_GPIO_ReadInputPin
 310  0093 5b01          	addw	sp,#1
 311  0095 4d            	tnz	a
 312  0096 2716          	jreq	L511
 313                     ; 58         if (timer_expired(&wait))
 315  0098 ae0000        	ldw	x,#_wait
 316  009b cd0000        	call	_timer_expired
 318  009e a30000        	cpw	x,#0
 319  00a1 270b          	jreq	L511
 320                     ; 60             timer_set(&wait, 200);
 322  00a3 ae00c8        	ldw	x,#200
 323  00a6 89            	pushw	x
 324  00a7 ae0000        	ldw	x,#_wait
 325  00aa cd0000        	call	_timer_set
 327  00ad 85            	popw	x
 328  00ae               L511:
 329                     ; 63 }
 332  00ae 85            	popw	x
 333  00af bf00          	ldw	c_y,x
 334  00b1 320002        	pop	c_y+2
 335  00b4 85            	popw	x
 336  00b5 bf00          	ldw	c_x,x
 337  00b7 320002        	pop	c_x+2
 338  00ba 80            	iret
 341                     .const:	section	.text
 342  0000               _button_sensor:
 343  0000 0008          	dc.w	L321
 345  0002 0000          	dc.w	L3_value
 347  0004 0004          	dc.w	L72_configure
 349  0006 004a          	dc.w	L36_status
 462                     	xdef	_PortD_isr
 463                     	switch	.bss
 464  0000               _wait:
 465  0000 00000000      	ds.b	4
 466                     	xdef	_wait
 467                     	xdef	_sta
 468                     	xdef	_button_sensor
 469                     	xref	_sensors_changed
 470                     	xref	_timer_expired
 471                     	xref	_timer_set
 472                     	xref	_GPIO_ReadInputPin
 473                     	xref	_GPIO_Init
 474                     	xref	_EXTI_SetExtIntSensitivity
 475                     	switch	.const
 476  0008               L321:
 477  0008 427574746f6e  	dc.b	"Button",0
 478                     	xref.b	c_x
 479                     	xref.b	c_y
 499                     	end
