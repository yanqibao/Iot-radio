   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  16                     	switch	.data
  17  0000               _sensors_process:
  18  0000 0000          	dc.w	0
  19  0002 0000          	dc.w	L7
  21  0004 0094          	dc.w	L5_process_thread_sensors_process
  22  0006 00000000      	ds.b	4
 124                     ; 54 get_sensor_index(const struct sensors_sensor *s)
 124                     ; 55 {
 126                     	switch	.text
 127  0000               L11_get_sensor_index:
 129  0000 89            	pushw	x
 130  0001 89            	pushw	x
 131       00000002      OFST:	set	2
 134                     ; 57   for(i = 0; i < num_sensors; ++i) {
 136  0002 5f            	clrw	x
 137  0003 1f01          	ldw	(OFST-1,sp),x
 140  0005 2019          	jra	L37
 141  0007               L76:
 142                     ; 58     if(sensors[i] == s) {
 144  0007 1e01          	ldw	x,(OFST-1,sp)
 145  0009 58            	sllw	x
 146  000a 9093          	ldw	y,x
 147  000c 51            	exgw	x,y
 148  000d de0000        	ldw	x,(_sensors,x)
 149  0010 1303          	cpw	x,(OFST+1,sp)
 150  0012 51            	exgw	x,y
 151  0013 2604          	jrne	L77
 152                     ; 59       return i;
 154  0015 1e01          	ldw	x,(OFST-1,sp)
 156  0017 2017          	jra	L6
 157  0019               L77:
 158                     ; 57   for(i = 0; i < num_sensors; ++i) {
 160  0019 1e01          	ldw	x,(OFST-1,sp)
 161  001b 1c0001        	addw	x,#1
 162  001e 1f01          	ldw	(OFST-1,sp),x
 164  0020               L37:
 167  0020 9c            	rvf
 168  0021 c60004        	ld	a,L3_num_sensors
 169  0024 5f            	clrw	x
 170  0025 97            	ld	xl,a
 171  0026 bf00          	ldw	c_x,x
 172  0028 1e01          	ldw	x,(OFST-1,sp)
 173  002a b300          	cpw	x,c_x
 174  002c 2fd9          	jrslt	L76
 175                     ; 62   return i;
 177  002e 1e01          	ldw	x,(OFST-1,sp)
 179  0030               L6:
 181  0030 5b04          	addw	sp,#4
 182  0032 81            	ret
 209                     ; 65 const struct sensors_sensor *
 209                     ; 66 sensors_first(void)
 209                     ; 67 {
 210                     	switch	.text
 211  0033               _sensors_first:
 215                     ; 68   return sensors[0];
 217  0033 ce0000        	ldw	x,_sensors
 220  0036 81            	ret
 262                     ; 71 const struct sensors_sensor *
 262                     ; 72 sensors_next(const struct sensors_sensor *s)
 262                     ; 73 {
 263                     	switch	.text
 264  0037               _sensors_next:
 268                     ; 74   return sensors[get_sensor_index(s) + 1];
 270  0037 adc7          	call	L11_get_sensor_index
 272  0039 58            	sllw	x
 273  003a de0002        	ldw	x,(_sensors+2,x)
 276  003d 81            	ret
 317                     ; 78 sensors_changed(const struct sensors_sensor *s)
 317                     ; 79 {
 318                     	switch	.text
 319  003e               _sensors_changed:
 323                     ; 80   sensors_flags[get_sensor_index(s)] |= FLAG_CHANGED;
 325  003e adc0          	call	L11_get_sensor_index
 327  0040 d60000        	ld	a,(_sensors_flags,x)
 328  0043 aa80          	or	a,#128
 329  0045 d70000        	ld	(_sensors_flags,x),a
 330                     ; 81   process_poll(&sensors_process);
 332  0048 ae0000        	ldw	x,#_sensors_process
 333  004b cd0000        	call	_process_poll
 335                     ; 82 }
 338  004e 81            	ret
 394                     ; 84 const struct sensors_sensor *
 394                     ; 85 sensors_find(const char *prefix)
 394                     ; 86 {
 395                     	switch	.text
 396  004f               _sensors_find:
 398  004f 89            	pushw	x
 399  0050 5204          	subw	sp,#4
 400       00000004      OFST:	set	4
 403                     ; 92   len = strlen(prefix);
 405  0052 cd0000        	call	_strlen
 407  0055 1f01          	ldw	(OFST-3,sp),x
 409                     ; 94   for(i = 0; i < num_sensors; ++i) {
 411  0057 5f            	clrw	x
 412  0058 1f03          	ldw	(OFST-1,sp),x
 415  005a 2026          	jra	L502
 416  005c               L102:
 417                     ; 95     if(strncmp(prefix, sensors[i]->type, len) == 0) {
 419  005c 1e01          	ldw	x,(OFST-3,sp)
 420  005e 89            	pushw	x
 421  005f 1e05          	ldw	x,(OFST+1,sp)
 422  0061 58            	sllw	x
 423  0062 de0000        	ldw	x,(_sensors,x)
 424  0065 fe            	ldw	x,(x)
 425  0066 89            	pushw	x
 426  0067 1e09          	ldw	x,(OFST+5,sp)
 427  0069 cd0000        	call	_strncmp
 429  006c 5b04          	addw	sp,#4
 430  006e a30000        	cpw	x,#0
 431  0071 2608          	jrne	L112
 432                     ; 96       return sensors[i];
 434  0073 1e03          	ldw	x,(OFST-1,sp)
 435  0075 58            	sllw	x
 436  0076 de0000        	ldw	x,(_sensors,x)
 438  0079 2016          	jra	L02
 439  007b               L112:
 440                     ; 94   for(i = 0; i < num_sensors; ++i) {
 442  007b 1e03          	ldw	x,(OFST-1,sp)
 443  007d 1c0001        	addw	x,#1
 444  0080 1f03          	ldw	(OFST-1,sp),x
 446  0082               L502:
 449  0082 9c            	rvf
 450  0083 c60004        	ld	a,L3_num_sensors
 451  0086 5f            	clrw	x
 452  0087 97            	ld	xl,a
 453  0088 bf00          	ldw	c_x,x
 454  008a 1e03          	ldw	x,(OFST-1,sp)
 455  008c b300          	cpw	x,c_x
 456  008e 2fcc          	jrslt	L102
 457                     ; 99   return NULL;
 459  0090 5f            	clrw	x
 461  0091               L02:
 463  0091 5b06          	addw	sp,#6
 464  0093 81            	ret
 467                     	switch	.bss
 468  0000               L312_i:
 469  0000 0000          	ds.b	2
 470  0002               L512_events:
 471  0002 0000          	ds.b	2
 555                     ; 102 PROCESS_THREAD(sensors_process, ev, data)
 555                     ; 103 {
 556                     	switch	.text
 557  0094               L5_process_thread_sensors_process:
 559  0094 89            	pushw	x
 560  0095 88            	push	a
 561       00000001      OFST:	set	1
 564                     ; 107   PROCESS_BEGIN();
 566  0096 a601          	ld	a,#1
 567  0098 6b01          	ld	(OFST+0,sp),a
 572  009a fe            	ldw	x,(x)
 574                     ; 132     } while(events);
 575  009b 5d            	tnzw	x
 576  009c 2711          	jreq	L712
 577  009e 1d0077        	subw	x,#119
 578  00a1 2757          	jreq	L122
 579  00a3 1d0007        	subw	x,#7
 580  00a6 2603cc0135    	jreq	L322
 581  00ab ac790179      	jpf	L562
 582  00af               L712:
 583                     ; 109   sensors_event = process_alloc_event();
 586  00af cd0000        	call	_process_alloc_event
 588  00b2 c70005        	ld	_sensors_event,a
 589                     ; 111   for(i = 0; sensors[i] != NULL; ++i) {
 591  00b5 5f            	clrw	x
 592  00b6 cf0000        	ldw	L312_i,x
 594  00b9 2025          	jra	L372
 595  00bb               L762:
 596                     ; 112     sensors_flags[i] = 0;
 598  00bb ce0000        	ldw	x,L312_i
 599  00be 724f0000      	clr	(_sensors_flags,x)
 600                     ; 113     sensors[i]->configure(SENSORS_HW_INIT, 0);
 602  00c2 5f            	clrw	x
 603  00c3 89            	pushw	x
 604  00c4 ae0080        	ldw	x,#128
 605  00c7 90ce0000      	ldw	y,L312_i
 606  00cb 9058          	sllw	y
 607  00cd 90de0000      	ldw	y,(_sensors,y)
 608  00d1 90ee04        	ldw	y,(4,y)
 609  00d4 90fd          	call	(y)
 611  00d6 85            	popw	x
 612                     ; 111   for(i = 0; sensors[i] != NULL; ++i) {
 614  00d7 ce0000        	ldw	x,L312_i
 615  00da 1c0001        	addw	x,#1
 616  00dd cf0000        	ldw	L312_i,x
 617  00e0               L372:
 620  00e0 ce0000        	ldw	x,L312_i
 621  00e3 58            	sllw	x
 622  00e4 d60001        	ld	a,(_sensors+1,x)
 623  00e7 da0000        	or	a,(_sensors,x)
 624  00ea 26cf          	jrne	L762
 625                     ; 115   num_sensors = i;
 627  00ec 5500010004    	mov	L3_num_sensors,L312_i+1
 628  00f1               L303:
 629                     ; 119     PROCESS_WAIT_EVENT();
 631  00f1 0f01          	clr	(OFST+0,sp)
 635  00f3 1e02          	ldw	x,(OFST+1,sp)
 636  00f5 90ae0077      	ldw	y,#119
 637  00f9 ff            	ldw	(x),y
 638  00fa               L122:
 642  00fa 0d01          	tnz	(OFST+0,sp)
 643  00fc 2604          	jrne	L113
 646  00fe a601          	ld	a,#1
 648  0100 2040          	jra	L42
 649  0102               L113:
 650                     ; 122       events = 0;
 652  0102 5f            	clrw	x
 653  0103 cf0002        	ldw	L512_events,x
 654                     ; 123       for(i = 0; i < num_sensors; ++i) {
 656  0106 5f            	clrw	x
 657  0107 cf0000        	ldw	L312_i,x
 659  010a 2056          	jra	L323
 660  010c               L713:
 661                     ; 124 	if(sensors_flags[i] & FLAG_CHANGED) {
 663  010c ce0000        	ldw	x,L312_i
 664  010f d60000        	ld	a,(_sensors_flags,x)
 665  0112 a580          	bcp	a,#128
 666  0114 2743          	jreq	L723
 667                     ; 125 	  if(process_post(PROCESS_BROADCAST, sensors_event, (void *)sensors[i]) == PROCESS_ERR_OK) {
 669  0116 ce0000        	ldw	x,L312_i
 670  0119 58            	sllw	x
 671  011a de0000        	ldw	x,(_sensors,x)
 672  011d 89            	pushw	x
 673  011e 3b0005        	push	_sensors_event
 674  0121 5f            	clrw	x
 675  0122 cd0000        	call	_process_post
 677  0125 5b03          	addw	sp,#3
 678  0127 a30000        	cpw	x,#0
 679  012a 2619          	jrne	L133
 680                     ; 126 	    PROCESS_WAIT_EVENT_UNTIL(ev == sensors_event);
 682  012c 0f01          	clr	(OFST+0,sp)
 686  012e 1e02          	ldw	x,(OFST+1,sp)
 687  0130 90ae007e      	ldw	y,#126
 688  0134 ff            	ldw	(x),y
 689  0135               L322:
 693  0135 0d01          	tnz	(OFST+0,sp)
 694  0137 2707          	jreq	L143
 696  0139 7b06          	ld	a,(OFST+5,sp)
 697  013b c10005        	cp	a,_sensors_event
 698  013e 2705          	jreq	L133
 699  0140               L143:
 702  0140 a601          	ld	a,#1
 704  0142               L42:
 706  0142 5b03          	addw	sp,#3
 707  0144 81            	ret
 708  0145               L133:
 709                     ; 128 	  sensors_flags[i] &= ~FLAG_CHANGED;
 711  0145 ce0000        	ldw	x,L312_i
 712  0148 d60000        	ld	a,(_sensors_flags,x)
 713  014b a47f          	and	a,#127
 714  014d d70000        	ld	(_sensors_flags,x),a
 715                     ; 129 	  events++;
 717  0150 ce0002        	ldw	x,L512_events
 718  0153 1c0001        	addw	x,#1
 719  0156 cf0002        	ldw	L512_events,x
 720  0159               L723:
 721                     ; 123       for(i = 0; i < num_sensors; ++i) {
 723  0159 ce0000        	ldw	x,L312_i
 724  015c 1c0001        	addw	x,#1
 725  015f cf0000        	ldw	L312_i,x
 726  0162               L323:
 729  0162 9c            	rvf
 730  0163 c60004        	ld	a,L3_num_sensors
 731  0166 5f            	clrw	x
 732  0167 97            	ld	xl,a
 733  0168 bf00          	ldw	c_x,x
 734  016a ce0000        	ldw	x,L312_i
 735  016d b300          	cpw	x,c_x
 736  016f 2f9b          	jrslt	L713
 737                     ; 132     } while(events);
 739  0171 ce0002        	ldw	x,L512_events
 740  0174 268c          	jrne	L113
 742  0176 cc00f1        	jra	L303
 743  0179               L562:
 744                     ; 135   PROCESS_END();
 749  0179 1e02          	ldw	x,(OFST+1,sp)
 750  017b 905f          	clrw	y
 751  017d ff            	ldw	(x),y
 755  017e a603          	ld	a,#3
 757  0180 20c0          	jra	L42
 860                     	switch	.bss
 861  0004               L3_num_sensors:
 862  0004 00            	ds.b	1
 863                     	xref	_sensors_flags
 864                     	xref	_sensors
 865                     	xdef	_sensors_process
 866  0005               _sensors_event:
 867  0005 00            	ds.b	1
 868                     	xdef	_sensors_event
 869                     	xdef	_sensors_changed
 870                     	xdef	_sensors_first
 871                     	xdef	_sensors_next
 872                     	xdef	_sensors_find
 873                     	xref	_process_poll
 874                     	xref	_process_alloc_event
 875                     	xref	_process_post
 876                     	xref	_strlen
 877                     	xref	_strncmp
 878                     .const:	section	.text
 879  0000               L7:
 880  0000 53656e736f72  	dc.b	"Sensors",0
 881                     	xref.b	c_x
 901                     	end
