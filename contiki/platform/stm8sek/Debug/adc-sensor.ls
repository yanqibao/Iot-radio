   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  67                     ; 18 int get_resistance(int type, int adc)
  67                     ; 19 {
  69                     	switch	.text
  70  0000               _get_resistance:
  72  0000 89            	pushw	x
  73  0001 5208          	subw	sp,#8
  74       00000008      OFST:	set	8
  77                     ; 20     long int r=0;
  79  0003 ae0000        	ldw	x,#0
  80  0006 1f07          	ldw	(OFST-1,sp),x
  81  0008 ae0000        	ldw	x,#0
  82  000b 1f05          	ldw	(OFST-3,sp),x
  84                     ; 21     if (type==ADC_TYPE_RW)
  86  000d 1e09          	ldw	x,(OFST+1,sp)
  87  000f a30009        	cpw	x,#9
  88  0012 2617          	jrne	L13
  89                     ; 23         r = 10000ul*adc/1024;
  91  0014 1e0d          	ldw	x,(OFST+5,sp)
  92  0016 90ae2710      	ldw	y,#10000
  93  001a cd0000        	call	c_vmul
  95  001d a60a          	ld	a,#10
  96  001f cd0000        	call	c_lursh
  98  0022 96            	ldw	x,sp
  99  0023 1c0005        	addw	x,#OFST-3
 100  0026 cd0000        	call	c_rtol
 104  0029 202e          	jra	L33
 105  002b               L13:
 106                     ; 25     else if (type==ADC_TYPE_PHO)
 108  002b 1e09          	ldw	x,(OFST+1,sp)
 109  002d a30008        	cpw	x,#8
 110  0030 2627          	jrne	L33
 111                     ; 27         r = 5000ul*adc/(1024-adc);
 113  0032 ae0400        	ldw	x,#1024
 114  0035 72f00d        	subw	x,(OFST+5,sp)
 115  0038 cd0000        	call	c_itolx
 117  003b 96            	ldw	x,sp
 118  003c 1c0001        	addw	x,#OFST-7
 119  003f cd0000        	call	c_rtol
 122  0042 1e0d          	ldw	x,(OFST+5,sp)
 123  0044 90ae1388      	ldw	y,#5000
 124  0048 cd0000        	call	c_vmul
 126  004b 96            	ldw	x,sp
 127  004c 1c0001        	addw	x,#OFST-7
 128  004f cd0000        	call	c_ludv
 130  0052 96            	ldw	x,sp
 131  0053 1c0005        	addw	x,#OFST-3
 132  0056 cd0000        	call	c_rtol
 135  0059               L33:
 136                     ; 29     return (r);
 138  0059 1e07          	ldw	x,(OFST-1,sp)
 141  005b 5b0a          	addw	sp,#10
 142  005d 81            	ret
 145                     	switch	.data
 146  0000               L73_state:
 147  0000 00ff          	dc.w	255
 191                     ; 34 int value(int type)
 191                     ; 35 {
 192                     	switch	.text
 193  005e               _value:
 195  005e 89            	pushw	x
 196  005f 89            	pushw	x
 197       00000002      OFST:	set	2
 200                     ; 36     int ret = 0;
 202  0060 5f            	clrw	x
 203  0061 1f01          	ldw	(OFST-1,sp),x
 205                     ; 38     if ((state==0xff)||(state==0x80)||(state==0x00))
 207  0063 ce0000        	ldw	x,L73_state
 208  0066 a300ff        	cpw	x,#255
 209  0069 270d          	jreq	L16
 211  006b ce0000        	ldw	x,L73_state
 212  006e a30080        	cpw	x,#128
 213  0071 2705          	jreq	L16
 215  0073 ce0000        	ldw	x,L73_state
 216  0076 2603          	jrne	L75
 217  0078               L16:
 218                     ; 40         return (0x00);
 220  0078 5f            	clrw	x
 222  0079 2033          	jra	L01
 223  007b               L75:
 224                     ; 42     if ((type==ADC_TYPE_RW)||(type==ADC_TYPE_PHO))
 226  007b 1e03          	ldw	x,(OFST+1,sp)
 227  007d a30009        	cpw	x,#9
 228  0080 2707          	jreq	L76
 230  0082 1e03          	ldw	x,(OFST+1,sp)
 231  0084 a30008        	cpw	x,#8
 232  0087 2623          	jrne	L56
 233  0089               L76:
 234                     ; 44         ADC2_ConversionConfig(ADC2_CONVERSIONMODE_SINGLE, type, ADC2_CR2_ALIGN);
 236  0089 4b08          	push	#8
 237  008b 7b05          	ld	a,(OFST+3,sp)
 238  008d 5f            	clrw	x
 239  008e 97            	ld	xl,a
 240  008f cd0000        	call	_ADC2_ConversionConfig
 242  0092 84            	pop	a
 243                     ; 45         ADC2_StartConversion();
 245  0093 cd0000        	call	_ADC2_StartConversion
 248  0096               L37:
 249                     ; 46         while (!ADC2_GetFlagStatus());
 251  0096 cd0000        	call	_ADC2_GetFlagStatus
 253  0099 4d            	tnz	a
 254  009a 27fa          	jreq	L37
 255                     ; 47         ADC2_ClearFlag();
 257  009c cd0000        	call	_ADC2_ClearFlag
 259                     ; 48         ret = get_resistance(type, ADC2_GetConversionValue());
 261  009f cd0000        	call	_ADC2_GetConversionValue
 263  00a2 89            	pushw	x
 264  00a3 1e05          	ldw	x,(OFST+3,sp)
 265  00a5 cd0000        	call	_get_resistance
 267  00a8 5b02          	addw	sp,#2
 268  00aa 1f01          	ldw	(OFST-1,sp),x
 270  00ac               L56:
 271                     ; 50     return (ret);
 273  00ac 1e01          	ldw	x,(OFST-1,sp)
 275  00ae               L01:
 277  00ae 5b04          	addw	sp,#4
 278  00b0 81            	ret
 328                     ; 53 int configure(int type, int value)
 328                     ; 54 {
 329                     	switch	.text
 330  00b1               _configure:
 332  00b1 89            	pushw	x
 333  00b2 89            	pushw	x
 334       00000002      OFST:	set	2
 337                     ; 55     int ret = 0;
 339  00b3 5f            	clrw	x
 340  00b4 1f01          	ldw	(OFST-1,sp),x
 342                     ; 56     switch (type)
 344  00b6 1e03          	ldw	x,(OFST+1,sp)
 346                     ; 75         break;
 347  00b8 1d0080        	subw	x,#128
 348  00bb 2705          	jreq	L77
 349  00bd 5a            	decw	x
 350  00be 2734          	jreq	L101
 351  00c0 2047          	jra	L521
 352  00c2               L77:
 353                     ; 58         case SENSORS_HW_INIT://初始化adc
 353                     ; 59             state = 0x80;
 355  00c2 ae0080        	ldw	x,#128
 356  00c5 cf0000        	ldw	L73_state,x
 357                     ; 60             GPIO_Init(GPIOE, GPIO_PIN_7, GPIO_MODE_IN_FL_NO_IT);
 359  00c8 4b00          	push	#0
 360  00ca 4b80          	push	#128
 361  00cc ae5014        	ldw	x,#20500
 362  00cf cd0000        	call	_GPIO_Init
 364  00d2 85            	popw	x
 365                     ; 61             GPIO_Init(GPIOE, GPIO_PIN_6, GPIO_MODE_IN_FL_NO_IT);
 367  00d3 4b00          	push	#0
 368  00d5 4b40          	push	#64
 369  00d7 ae5014        	ldw	x,#20500
 370  00da cd0000        	call	_GPIO_Init
 372  00dd 85            	popw	x
 373                     ; 62             ADC2_Init(ADC2_CONVERSIONMODE_SINGLE, ADC2_CHANNEL_9, ADC2_PRESSEL_FCPU_D18,
 373                     ; 63             0x00, DISABLE, ADC2_CR2_ALIGN, ADC2_CHANNEL_8, DISABLE);
 375  00de 4b00          	push	#0
 376  00e0 4b08          	push	#8
 377  00e2 4b08          	push	#8
 378  00e4 4b00          	push	#0
 379  00e6 4b00          	push	#0
 380  00e8 4b70          	push	#112
 381  00ea ae0009        	ldw	x,#9
 382  00ed cd0000        	call	_ADC2_Init
 384  00f0 5b06          	addw	sp,#6
 385                     ; 64         break;
 387  00f2 2015          	jra	L521
 388  00f4               L101:
 389                     ; 65         case SENSORS_ACTIVE://有效
 389                     ; 66             state = value;
 391  00f4 1e07          	ldw	x,(OFST+5,sp)
 392  00f6 cf0000        	ldw	L73_state,x
 393                     ; 67             if (state)
 395  00f9 ce0000        	ldw	x,L73_state
 396  00fc 2707          	jreq	L721
 397                     ; 69                 ADC2_Cmd(ENABLE);
 399  00fe a601          	ld	a,#1
 400  0100 cd0000        	call	_ADC2_Cmd
 403  0103 2004          	jra	L521
 404  0105               L721:
 405                     ; 73                 ADC2_Cmd(DISABLE);
 407  0105 4f            	clr	a
 408  0106 cd0000        	call	_ADC2_Cmd
 410  0109               L521:
 411                     ; 77     return (ret);
 413  0109 1e01          	ldw	x,(OFST-1,sp)
 416  010b 5b04          	addw	sp,#4
 417  010d 81            	ret
 450                     ; 80 int status(int type)
 450                     ; 81 {
 451                     	switch	.text
 452  010e               _status:
 454  010e 89            	pushw	x
 455       00000000      OFST:	set	0
 458                     ; 82     if (type==SENSORS_HW_INIT)
 460  010f a30080        	cpw	x,#128
 461  0112 2610          	jrne	L741
 462                     ; 84         return (state==0x80);
 464  0114 ce0000        	ldw	x,L73_state
 465  0117 a30080        	cpw	x,#128
 466  011a 2605          	jrne	L61
 467  011c ae0001        	ldw	x,#1
 468  011f 2001          	jra	L02
 469  0121               L61:
 470  0121 5f            	clrw	x
 471  0122               L02:
 473  0122 200a          	jra	L22
 474  0124               L741:
 475                     ; 86     else if (type==SENSORS_ACTIVE)
 477  0124 1e01          	ldw	x,(OFST+1,sp)
 478  0126 a30081        	cpw	x,#129
 479  0129 2606          	jrne	L151
 480                     ; 88         return (state);
 482  012b ce0000        	ldw	x,L73_state
 484  012e               L22:
 486  012e 5b02          	addw	sp,#2
 487  0130 81            	ret
 488  0131               L151:
 489                     ; 90     return (0);
 491  0131 5f            	clrw	x
 493  0132 20fa          	jra	L22
 496                     .const:	section	.text
 497  0000               _adc_sensor:
 498  0000 0008          	dc.w	L551
 500  0002 005e          	dc.w	_value
 502  0004 00b1          	dc.w	_configure
 504  0006 010e          	dc.w	_status
 584                     	xdef	_status
 585                     	xdef	_configure
 586                     	xdef	_value
 587                     	xdef	_get_resistance
 588                     	xdef	_adc_sensor
 589                     	xref	_GPIO_Init
 590                     	xref	_ADC2_ClearFlag
 591                     	xref	_ADC2_GetFlagStatus
 592                     	xref	_ADC2_GetConversionValue
 593                     	xref	_ADC2_StartConversion
 594                     	xref	_ADC2_ConversionConfig
 595                     	xref	_ADC2_Cmd
 596                     	xref	_ADC2_Init
 597                     	switch	.const
 598  0008               L551:
 599  0008 6164632d7365  	dc.b	"adc-sensor",0
 600                     	xref.b	c_x
 601                     	xref.b	c_y
 621                     	xref	c_ludv
 622                     	xref	c_itolx
 623                     	xref	c_rtol
 624                     	xref	c_lursh
 625                     	xref	c_vmul
 626                     	end
