   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  16                     	switch	.data
  17  0000               L3_clock_frequency:
  18  0000 001e8480      	dc.l	2000000
  96                     ; 16 void sys_clock_init(enum clock_type clock)
  96                     ; 17 {
  98                     	switch	.text
  99  0000               _sys_clock_init:
 101  0000 88            	push	a
 102  0001 89            	pushw	x
 103       00000002      OFST:	set	2
 106                     ; 18     if (clock==HSE)
 108  0002 4d            	tnz	a
 109  0003 265c          	jrne	L34
 110                     ; 22         CLK_DeInit();
 112  0005 cd0000        	call	_CLK_DeInit
 114                     ; 25         if (FLASH_OPTIONBYTE_ERROR==(value=FLASH_ReadOptionByte(OPT7_ADDR)))//
 116  0008 ae480d        	ldw	x,#18445
 117  000b cd0000        	call	_FLASH_ReadOptionByte
 119  000e 1f01          	ldw	(OFST-1,sp),x
 121  0010 1e01          	ldw	x,(OFST-1,sp)
 122  0012 a35555        	cpw	x,#21845
 123  0015 2602          	jrne	L54
 124  0017               L74:
 125                     ; 27             while (1);
 127  0017 20fe          	jra	L74
 128  0019               L54:
 129                     ; 29         value >>= 8;
 131  0019 7b01          	ld	a,(OFST-1,sp)
 132  001b 6b02          	ld	(OFST+0,sp),a
 133  001d 0f01          	clr	(OFST-1,sp)
 135                     ; 30         if (!(value&0x01))//wait state bit0
 137  001f 7b02          	ld	a,(OFST+0,sp)
 138  0021 a501          	bcp	a,#1
 139  0023 261a          	jrne	L35
 140                     ; 32             value |= 0x01;
 142  0025 7b02          	ld	a,(OFST+0,sp)
 143  0027 aa01          	or	a,#1
 144  0029 6b02          	ld	(OFST+0,sp),a
 146                     ; 33             FLASH_Unlock(FLASH_MEMTYPE_DATA);
 148  002b a6f7          	ld	a,#247
 149  002d cd0000        	call	_FLASH_Unlock
 151                     ; 34             FLASH_ProgramOptionByte(OPT7_ADDR, value);//enable the wait state
 153  0030 7b02          	ld	a,(OFST+0,sp)
 154  0032 88            	push	a
 155  0033 ae480d        	ldw	x,#18445
 156  0036 cd0000        	call	_FLASH_ProgramOptionByte
 158  0039 84            	pop	a
 159                     ; 35             FLASH_Lock(FLASH_MEMTYPE_DATA);
 161  003a a6f7          	ld	a,#247
 162  003c cd0000        	call	_FLASH_Lock
 164  003f               L35:
 165                     ; 38         CLK_HSECmd(ENABLE);
 167  003f a601          	ld	a,#1
 168  0041 cd0000        	call	_CLK_HSECmd
 170                     ; 41         CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSE, DISABLE, CLK_CURRENTCLOCKSTATE_DISABLE);
 172  0044 4b00          	push	#0
 173  0046 4b00          	push	#0
 174  0048 ae01b4        	ldw	x,#436
 175  004b cd0000        	call	_CLK_ClockSwitchConfig
 177  004e 85            	popw	x
 178                     ; 42         CLK_SYSCLKConfig(CLK_PRESCALER_HSIDIV1);
 180  004f 4f            	clr	a
 181  0050 cd0000        	call	_CLK_SYSCLKConfig
 183                     ; 43         clock_frequency = 24000000ul;
 185  0053 ae3600        	ldw	x,#13824
 186  0056 cf0002        	ldw	L3_clock_frequency+2,x
 187  0059 ae016e        	ldw	x,#366
 188  005c cf0000        	ldw	L3_clock_frequency,x
 190  005f 2028          	jra	L55
 191  0061               L34:
 192                     ; 45     else if (clock==HSI)
 194  0061 7b03          	ld	a,(OFST+1,sp)
 195  0063 a101          	cp	a,#1
 196  0065 2622          	jrne	L55
 197                     ; 47         CLK_DeInit();
 199  0067 cd0000        	call	_CLK_DeInit
 201                     ; 49         CLK_SYSCLKConfig(CLK_PRESCALER_HSIDIV1);
 203  006a 4f            	clr	a
 204  006b cd0000        	call	_CLK_SYSCLKConfig
 206                     ; 51         CLK_ClockSwitchConfig(CLK_SWITCHMODE_MANUAL, CLK_SOURCE_HSI, DISABLE, CLK_CURRENTCLOCKSTATE_DISABLE);
 208  006e 4b00          	push	#0
 209  0070 4b00          	push	#0
 210  0072 ae00e1        	ldw	x,#225
 211  0075 cd0000        	call	_CLK_ClockSwitchConfig
 213  0078 85            	popw	x
 214                     ; 52         CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
 216  0079 4f            	clr	a
 217  007a cd0000        	call	_CLK_HSIPrescalerConfig
 219                     ; 53         clock_frequency = 16000000ul;
 221  007d ae2400        	ldw	x,#9216
 222  0080 cf0002        	ldw	L3_clock_frequency+2,x
 223  0083 ae00f4        	ldw	x,#244
 224  0086 cf0000        	ldw	L3_clock_frequency,x
 225  0089               L55:
 226                     ; 55 }
 229  0089 5b03          	addw	sp,#3
 230  008b 81            	ret
 254                     ; 60 uint32_t sys_clock_freq(void)
 254                     ; 61 {
 255                     	switch	.text
 256  008c               _sys_clock_freq:
 260                     ; 62     return (clock_frequency);
 262  008c ae0000        	ldw	x,#L3_clock_frequency
 263  008f cd0000        	call	c_ltor
 267  0092 81            	ret
 289                     	xdef	_sys_clock_freq
 290                     	xdef	_sys_clock_init
 291                     	xref	_FLASH_ProgramOptionByte
 292                     	xref	_FLASH_ReadOptionByte
 293                     	xref	_FLASH_Lock
 294                     	xref	_FLASH_Unlock
 295                     	xref	_CLK_SYSCLKConfig
 296                     	xref	_CLK_HSIPrescalerConfig
 297                     	xref	_CLK_ClockSwitchConfig
 298                     	xref	_CLK_HSECmd
 299                     	xref	_CLK_DeInit
 318                     	xref	c_ltor
 319                     	end
