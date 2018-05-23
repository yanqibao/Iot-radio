   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  48                     ; 16 void main(void)
  48                     ; 17 {
  50                     	switch	.text
  51  0000               _main:
  55                     ; 19     board_init();
  57  0000 ad0e          	call	_board_init
  59                     ; 20     contiki_init();
  61  0002 ad1a          	call	_contiki_init
  63                     ; 22     enableInterrupts();
  66  0004 9a            rim
  68  0005               L72:
  69                     ; 30         while(process_run() > 0);
  71  0005 9c            	rvf
  72  0006 cd0000        	call	_process_run
  74  0009 a30000        	cpw	x,#0
  75  000c 2cf7          	jrsgt	L72
  77  000e 20f5          	jra	L72
 104                     ; 38 void board_init(void)
 104                     ; 39 {
 105                     	switch	.text
 106  0010               _board_init:
 110                     ; 41     sys_clock_init(HSE);//24000000Hz系统时钟
 112  0010 4f            	clr	a
 113  0011 cd0000        	call	_sys_clock_init
 115                     ; 42     putchar_init();     //printf 通过uart1输出
 117  0014 cd0000        	call	_putchar_init
 119                     ; 43     clock_init();       //时间基准
 121  0017 cd0000        	call	_clock_init
 123                     ; 45     leds_init();
 125  001a cd0000        	call	_leds_init
 127                     ; 48 }
 130  001d 81            	ret
 162                     ; 52 void contiki_init(void)
 162                     ; 53 {
 163                     	switch	.text
 164  001e               _contiki_init:
 168                     ; 54     clock_init();
 170  001e cd0000        	call	_clock_init
 172                     ; 55     process_init();
 174  0021 cd0000        	call	_process_init
 176                     ; 56     process_start(&etimer_process, NULL);//启动etimer_process
 178  0024 5f            	clrw	x
 179  0025 89            	pushw	x
 180  0026 ae0000        	ldw	x,#_etimer_process
 181  0029 cd0000        	call	_process_start
 183  002c 85            	popw	x
 184                     ; 57     process_start(&sensors_process, NULL);
 186  002d 5f            	clrw	x
 187  002e 89            	pushw	x
 188  002f ae0000        	ldw	x,#_sensors_process
 189  0032 cd0000        	call	_process_start
 191  0035 85            	popw	x
 192                     ; 58     ctimer_init();                       //定时任务ctimer初始化
 194  0036 cd0000        	call	_ctimer_init
 196                     ; 59     autostart_start(autostart_processes);
 198  0039 ae0000        	ldw	x,#_autostart_processes
 199  003c cd0000        	call	_autostart_start
 201                     ; 60     printf("Processes running\n");
 203  003f ae0000        	ldw	x,#L35
 204  0042 cd0000        	call	_printf
 206                     ; 61 }
 209  0045 81            	ret
 222                     	xdef	_main
 223                     	xdef	_contiki_init
 224                     	xdef	_board_init
 225                     	xref	_sensors_process
 226                     	xref	_putchar_init
 227                     	xref	_leds_init
 228                     	xref	_printf
 229                     	xref	_ctimer_init
 230                     	xref	_etimer_process
 231                     	xref	_clock_init
 232                     	xref	_autostart_start
 233                     	xref	_autostart_processes
 234                     	xref	_process_run
 235                     	xref	_process_init
 236                     	xref	_process_start
 237                     	xref	_sys_clock_init
 238                     .const:	section	.text
 239  0000               L35:
 240  0000 50726f636573  	dc.b	"Processes running",10,0
 260                     	end
