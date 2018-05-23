   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  46                     ; 12 void leds_arch_init(void)
  46                     ; 13 {
  48                     	switch	.text
  49  0000               _leds_arch_init:
  53                     ; 14     GPIO_Init(LED_GREEN_PORT, LED_GREEN_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
  55  0000 4be0          	push	#224
  56  0002 4b02          	push	#2
  57  0004 ae500a        	ldw	x,#20490
  58  0007 cd0000        	call	_GPIO_Init
  60  000a 85            	popw	x
  61                     ; 15     GPIO_WriteHigh(LED_GREEN_PORT, LED_GREEN_PIN);
  63  000b 4b02          	push	#2
  64  000d ae500a        	ldw	x,#20490
  65  0010 cd0000        	call	_GPIO_WriteHigh
  67  0013 84            	pop	a
  68                     ; 16     GPIO_Init(LED_RED_PORT, LED_RED_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
  70  0014 4be0          	push	#224
  71  0016 4b04          	push	#4
  72  0018 ae500a        	ldw	x,#20490
  73  001b cd0000        	call	_GPIO_Init
  75  001e 85            	popw	x
  76                     ; 17     GPIO_WriteHigh(LED_RED_PORT, LED_RED_PIN);
  78  001f 4b04          	push	#4
  79  0021 ae500a        	ldw	x,#20490
  80  0024 cd0000        	call	_GPIO_WriteHigh
  82  0027 84            	pop	a
  83                     ; 19     GPIO_WriteHigh(LED_GREEN_PORT, LED_GREEN_PIN);
  85  0028 4b02          	push	#2
  86  002a ae500a        	ldw	x,#20490
  87  002d cd0000        	call	_GPIO_WriteHigh
  89  0030 84            	pop	a
  90                     ; 20     GPIO_WriteHigh(LED_RED_PORT, LED_RED_PIN);
  92  0031 4b04          	push	#4
  93  0033 ae500a        	ldw	x,#20490
  94  0036 cd0000        	call	_GPIO_WriteHigh
  96  0039 84            	pop	a
  97                     ; 21 }
 100  003a 81            	ret
 140                     ; 22 unsigned char leds_arch_get(void)
 140                     ; 23 {
 141                     	switch	.text
 142  003b               _leds_arch_get:
 144  003b 89            	pushw	x
 145       00000002      OFST:	set	2
 148                     ; 25     uint8_t ret = 0x00;
 150  003c 0f02          	clr	(OFST+0,sp)
 152                     ; 26     tmp = GPIO_ReadInputData(LED_GREEN_PORT);
 154  003e ae500a        	ldw	x,#20490
 155  0041 cd0000        	call	_GPIO_ReadInputData
 157  0044 6b01          	ld	(OFST-1,sp),a
 159                     ; 27     if (!(tmp&LED_GREEN_PIN))
 161  0046 7b01          	ld	a,(OFST-1,sp)
 162  0048 a502          	bcp	a,#2
 163  004a 2606          	jrne	L73
 164                     ; 29         ret |= LEDS_GREEN;
 166  004c 7b02          	ld	a,(OFST+0,sp)
 167  004e aa01          	or	a,#1
 168  0050 6b02          	ld	(OFST+0,sp),a
 170  0052               L73:
 171                     ; 31     if (!(tmp&LED_RED_PIN))
 173  0052 7b01          	ld	a,(OFST-1,sp)
 174  0054 a504          	bcp	a,#4
 175  0056 2606          	jrne	L14
 176                     ; 33         ret |= LEDS_RED;
 178  0058 7b02          	ld	a,(OFST+0,sp)
 179  005a aa04          	or	a,#4
 180  005c 6b02          	ld	(OFST+0,sp),a
 182  005e               L14:
 183                     ; 35 }
 186  005e 85            	popw	x
 187  005f 81            	ret
 221                     ; 36 void leds_arch_set(unsigned char leds)
 221                     ; 37 {
 222                     	switch	.text
 223  0060               _leds_arch_set:
 225  0060 88            	push	a
 226       00000000      OFST:	set	0
 229                     ; 38     if(leds&LEDS_GREEN)
 231  0061 a501          	bcp	a,#1
 232  0063 270b          	jreq	L75
 233                     ; 40         GPIO_WriteLow(LED_GREEN_PORT, LED_GREEN_PIN);
 235  0065 4b02          	push	#2
 236  0067 ae500a        	ldw	x,#20490
 237  006a cd0000        	call	_GPIO_WriteLow
 239  006d 84            	pop	a
 241  006e 2009          	jra	L16
 242  0070               L75:
 243                     ; 44         GPIO_WriteHigh(LED_GREEN_PORT, LED_GREEN_PIN);
 245  0070 4b02          	push	#2
 246  0072 ae500a        	ldw	x,#20490
 247  0075 cd0000        	call	_GPIO_WriteHigh
 249  0078 84            	pop	a
 250  0079               L16:
 251                     ; 47     if(leds&LED_RED_PIN)
 253  0079 7b01          	ld	a,(OFST+1,sp)
 254  007b a504          	bcp	a,#4
 255  007d 270b          	jreq	L36
 256                     ; 49         GPIO_WriteLow(LED_RED_PORT, LED_RED_PIN);
 258  007f 4b04          	push	#4
 259  0081 ae500a        	ldw	x,#20490
 260  0084 cd0000        	call	_GPIO_WriteLow
 262  0087 84            	pop	a
 264  0088 2009          	jra	L56
 265  008a               L36:
 266                     ; 53         GPIO_WriteHigh(LED_RED_PORT, LED_RED_PIN);
 268  008a 4b04          	push	#4
 269  008c ae500a        	ldw	x,#20490
 270  008f cd0000        	call	_GPIO_WriteHigh
 272  0092 84            	pop	a
 273  0093               L56:
 274                     ; 55 }
 277  0093 84            	pop	a
 278  0094 81            	ret
 291                     	xdef	_leds_arch_set
 292                     	xdef	_leds_arch_get
 293                     	xdef	_leds_arch_init
 294                     	xref	_GPIO_ReadInputData
 295                     	xref	_GPIO_WriteLow
 296                     	xref	_GPIO_WriteHigh
 297                     	xref	_GPIO_Init
 316                     	end
