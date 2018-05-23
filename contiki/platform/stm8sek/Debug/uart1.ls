   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  55                     ; 8 char putchar(char ch)
  55                     ; 9 {
  57                     	switch	.text
  58  0000               _putchar:
  60  0000 88            	push	a
  61       00000000      OFST:	set	0
  64                     ; 10     UART1_SendData8(ch);
  66  0001 cd0000        	call	_UART1_SendData8
  69  0004               L72:
  70                     ; 11     while (UART1_GetFlagStatus(UART1_FLAG_TC)==RESET);
  72  0004 ae0040        	ldw	x,#64
  73  0007 cd0000        	call	_UART1_GetFlagStatus
  75  000a 4d            	tnz	a
  76  000b 27f7          	jreq	L72
  77                     ; 13     return (ch);
  79  000d 7b01          	ld	a,(OFST+1,sp)
  82  000f 5b01          	addw	sp,#1
  83  0011 81            	ret
 109                     ; 16 void putchar_init(void)
 109                     ; 17 {
 110                     	switch	.text
 111  0012               _putchar_init:
 115                     ; 19     CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
 117  0012 4f            	clr	a
 118  0013 cd0000        	call	_CLK_HSIPrescalerConfig
 120                     ; 20     UART1_DeInit();
 122  0016 cd0000        	call	_UART1_DeInit
 124                     ; 30     UART1_Init((uint32_t)115200, UART1_WORDLENGTH_8D, UART1_STOPBITS_1, UART1_PARITY_NO,
 124                     ; 31               UART1_SYNCMODE_CLOCK_DISABLE, UART1_MODE_TXRX_ENABLE);
 126  0019 4b0c          	push	#12
 127  001b 4b80          	push	#128
 128  001d 4b00          	push	#0
 129  001f 4b00          	push	#0
 130  0021 4b00          	push	#0
 131  0023 aec200        	ldw	x,#49664
 132  0026 89            	pushw	x
 133  0027 ae0001        	ldw	x,#1
 134  002a 89            	pushw	x
 135  002b cd0000        	call	_UART1_Init
 137  002e 5b09          	addw	sp,#9
 138                     ; 32 }
 141  0030 81            	ret
 154                     	xdef	_putchar_init
 155                     	xdef	_putchar
 156                     	xref	_UART1_GetFlagStatus
 157                     	xref	_UART1_SendData8
 158                     	xref	_UART1_Init
 159                     	xref	_UART1_DeInit
 160                     	xref	_CLK_HSIPrescalerConfig
 179                     	end
