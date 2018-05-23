   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  16                     	switch	.data
  17  0000               L3_ctimer_list_list:
  18  0000 0000          	dc.w	0
  19  0002               L5_ctimer_list:
  20  0002 0000          	dc.w	L3_ctimer_list_list
  21  0004               _ctimer_process:
  22  0004 0000          	dc.w	0
  23  0006 0000          	dc.w	L31
  25  0008 0000          	dc.w	L11_process_thread_ctimer_process
  26  000a 00000000      	ds.b	4
 326                     ; 63 PROCESS_THREAD(ctimer_process, ev, data)
 326                     ; 64 {
 328                     	switch	.text
 329  0000               L11_process_thread_ctimer_process:
 331  0000 89            	pushw	x
 332  0001 5205          	subw	sp,#5
 333       00000005      OFST:	set	5
 336                     ; 66   PROCESS_BEGIN();
 338  0003 a601          	ld	a,#1
 339  0005 6b03          	ld	(OFST-2,sp),a
 344  0007 fe            	ldw	x,(x)
 346                     ; 75     for(c = list_head(ctimer_list); c != NULL; c = c->next) {
 347  0008 5d            	tnzw	x
 348  0009 2709          	jreq	L51
 349  000b 1d004a        	subw	x,#74
 350  000e 2731          	jreq	L71
 351  0010 ac9c009c      	jpf	L522
 352  0014               L51:
 353                     ; 68   for(c = list_head(ctimer_list); c != NULL; c = c->next) {
 356  0014 ce0002        	ldw	x,L5_ctimer_list
 357  0017 cd0000        	call	_list_head
 359  001a 1f04          	ldw	(OFST-1,sp),x
 362  001c 2012          	jra	L332
 363  001e               L722:
 364                     ; 69     etimer_set(&c->etimer, c->etimer.timer.interval);
 366  001e 1e04          	ldw	x,(OFST-1,sp)
 367  0020 ee04          	ldw	x,(4,x)
 368  0022 89            	pushw	x
 369  0023 1e06          	ldw	x,(OFST+1,sp)
 370  0025 5c            	incw	x
 371  0026 5c            	incw	x
 372  0027 cd0000        	call	_etimer_set
 374  002a 85            	popw	x
 375                     ; 68   for(c = list_head(ctimer_list); c != NULL; c = c->next) {
 377  002b 1e04          	ldw	x,(OFST-1,sp)
 378  002d fe            	ldw	x,(x)
 379  002e 1f04          	ldw	(OFST-1,sp),x
 381  0030               L332:
 384  0030 1e04          	ldw	x,(OFST-1,sp)
 385  0032 26ea          	jrne	L722
 386                     ; 71   initialized = 1;
 388  0034 35010000      	mov	L7_initialized,#1
 389  0038               L342:
 390                     ; 74     PROCESS_YIELD_UNTIL(ev == PROCESS_EVENT_TIMER);
 392  0038 0f03          	clr	(OFST-2,sp)
 396  003a 1e06          	ldw	x,(OFST+1,sp)
 397  003c 90ae004a      	ldw	y,#74
 398  0040 ff            	ldw	(x),y
 399  0041               L71:
 403  0041 0d03          	tnz	(OFST-2,sp)
 404  0043 2706          	jreq	L152
 406  0045 7b0a          	ld	a,(OFST+5,sp)
 407  0047 a188          	cp	a,#136
 408  0049 2704          	jreq	L742
 409  004b               L152:
 412  004b a601          	ld	a,#1
 414  004d 2054          	jra	L6
 415  004f               L742:
 416                     ; 75     for(c = list_head(ctimer_list); c != NULL; c = c->next) {
 418  004f ce0002        	ldw	x,L5_ctimer_list
 419  0052 cd0000        	call	_list_head
 421  0055 1f04          	ldw	(OFST-1,sp),x
 424  0057 203d          	jra	L752
 425  0059               L352:
 426                     ; 76       if(&c->etimer == data) {
 428  0059 1e04          	ldw	x,(OFST-1,sp)
 429  005b 5c            	incw	x
 430  005c 5c            	incw	x
 431  005d 130b          	cpw	x,(OFST+6,sp)
 432  005f 2630          	jrne	L362
 433                     ; 77 	list_remove(ctimer_list, c);
 435  0061 1e04          	ldw	x,(OFST-1,sp)
 436  0063 89            	pushw	x
 437  0064 ce0002        	ldw	x,L5_ctimer_list
 438  0067 cd0000        	call	_list_remove
 440  006a 85            	popw	x
 441                     ; 78 	PROCESS_CONTEXT_BEGIN(c->p);
 443  006b ce0000        	ldw	x,_process_current
 444  006e 1f01          	ldw	(OFST-4,sp),x
 448  0070 1e04          	ldw	x,(OFST-1,sp)
 449  0072 ee0a          	ldw	x,(10,x)
 450  0074 cf0000        	ldw	_process_current,x
 451                     ; 79 	if(c->f != NULL) {
 453  0077 1e04          	ldw	x,(OFST-1,sp)
 454  0079 e60d          	ld	a,(13,x)
 455  007b ea0c          	or	a,(12,x)
 456  007d 270b          	jreq	L562
 457                     ; 80 	  c->f(c->ptr);
 459  007f 1e04          	ldw	x,(OFST-1,sp)
 460  0081 ee0e          	ldw	x,(14,x)
 461  0083 1604          	ldw	y,(OFST-1,sp)
 462  0085 90ee0c        	ldw	y,(12,y)
 463  0088 90fd          	call	(y)
 465  008a               L562:
 466                     ; 82 	PROCESS_CONTEXT_END(c->p);
 468  008a 1e01          	ldw	x,(OFST-4,sp)
 469  008c cf0000        	ldw	_process_current,x
 470                     ; 83 	break;
 473  008f 20a7          	jra	L342
 474  0091               L362:
 475                     ; 75     for(c = list_head(ctimer_list); c != NULL; c = c->next) {
 477  0091 1e04          	ldw	x,(OFST-1,sp)
 478  0093 fe            	ldw	x,(x)
 479  0094 1f04          	ldw	(OFST-1,sp),x
 481  0096               L752:
 484  0096 1e04          	ldw	x,(OFST-1,sp)
 485  0098 26bf          	jrne	L352
 486  009a 209c          	jra	L342
 487  009c               L522:
 488                     ; 87   PROCESS_END();
 493  009c 1e06          	ldw	x,(OFST+1,sp)
 494  009e 905f          	clrw	y
 495  00a0 ff            	ldw	(x),y
 499  00a1 a603          	ld	a,#3
 501  00a3               L6:
 503  00a3 5b07          	addw	sp,#7
 504  00a5 81            	ret
 532                     ; 91 ctimer_init(void)
 532                     ; 92 {
 533                     	switch	.text
 534  00a6               _ctimer_init:
 538                     ; 93   initialized = 0;
 540  00a6 725f0000      	clr	L7_initialized
 541                     ; 94   list_init(ctimer_list);
 543  00aa ce0002        	ldw	x,L5_ctimer_list
 544  00ad cd0000        	call	_list_init
 546                     ; 95   process_start(&ctimer_process, NULL);
 548  00b0 5f            	clrw	x
 549  00b1 89            	pushw	x
 550  00b2 ae0004        	ldw	x,#_ctimer_process
 551  00b5 cd0000        	call	_process_start
 553  00b8 85            	popw	x
 554                     ; 96 }
 557  00b9 81            	ret
 624                     ; 99 ctimer_set(struct ctimer *c, clock_time_t t,
 624                     ; 100 	   void (*f)(void *), void *ptr)
 624                     ; 101 {
 625                     	switch	.text
 626  00ba               _ctimer_set:
 628  00ba 89            	pushw	x
 629       00000000      OFST:	set	0
 632                     ; 102   ctimer_set_with_process(c, t, f, ptr, PROCESS_CURRENT());
 634  00bb ce0000        	ldw	x,_process_current
 635  00be 89            	pushw	x
 636  00bf 1e0b          	ldw	x,(OFST+11,sp)
 637  00c1 89            	pushw	x
 638  00c2 1e0b          	ldw	x,(OFST+11,sp)
 639  00c4 89            	pushw	x
 640  00c5 1e0b          	ldw	x,(OFST+11,sp)
 641  00c7 89            	pushw	x
 642  00c8 1e09          	ldw	x,(OFST+9,sp)
 643  00ca ad04          	call	_ctimer_set_with_process
 645  00cc 5b08          	addw	sp,#8
 646                     ; 103 }
 649  00ce 85            	popw	x
 650  00cf 81            	ret
 746                     ; 106 ctimer_set_with_process(struct ctimer *c, clock_time_t t,
 746                     ; 107 	   void (*f)(void *), void *ptr, struct process *p)
 746                     ; 108 {
 747                     	switch	.text
 748  00d0               _ctimer_set_with_process:
 750  00d0 89            	pushw	x
 751  00d1 89            	pushw	x
 752       00000002      OFST:	set	2
 755                     ; 110   c->p = p;
 758  00d2 160d          	ldw	y,(OFST+11,sp)
 759  00d4 ef0a          	ldw	(10,x),y
 760                     ; 111   c->f = f;
 762  00d6 1609          	ldw	y,(OFST+7,sp)
 763  00d8 ef0c          	ldw	(12,x),y
 764                     ; 112   c->ptr = ptr;
 766  00da 160b          	ldw	y,(OFST+9,sp)
 767  00dc ef0e          	ldw	(14,x),y
 768                     ; 113   if(initialized) {
 770  00de 725d0000      	tnz	L7_initialized
 771  00e2 271d          	jreq	L773
 772                     ; 114     PROCESS_CONTEXT_BEGIN(&ctimer_process);
 774  00e4 ce0000        	ldw	x,_process_current
 775  00e7 1f01          	ldw	(OFST-1,sp),x
 779  00e9 ae0004        	ldw	x,#_ctimer_process
 780  00ec cf0000        	ldw	_process_current,x
 781                     ; 115     etimer_set(&c->etimer, t);
 783  00ef 1e07          	ldw	x,(OFST+5,sp)
 784  00f1 89            	pushw	x
 785  00f2 1e05          	ldw	x,(OFST+3,sp)
 786  00f4 5c            	incw	x
 787  00f5 5c            	incw	x
 788  00f6 cd0000        	call	_etimer_set
 790  00f9 85            	popw	x
 791                     ; 116     PROCESS_CONTEXT_END(&ctimer_process);
 793  00fa 1e01          	ldw	x,(OFST-1,sp)
 794  00fc cf0000        	ldw	_process_current,x
 797  00ff 2006          	jra	L104
 798  0101               L773:
 799                     ; 118     c->etimer.timer.interval = t;
 801  0101 1e03          	ldw	x,(OFST+1,sp)
 802  0103 1607          	ldw	y,(OFST+5,sp)
 803  0105 ef04          	ldw	(4,x),y
 804  0107               L104:
 805                     ; 121   list_add(ctimer_list, c);
 807  0107 1e03          	ldw	x,(OFST+1,sp)
 808  0109 89            	pushw	x
 809  010a ce0002        	ldw	x,L5_ctimer_list
 810  010d cd0000        	call	_list_add
 812  0110 85            	popw	x
 813                     ; 122 }
 816  0111 5b04          	addw	sp,#4
 817  0113 81            	ret
 872                     ; 125 ctimer_reset(struct ctimer *c)
 872                     ; 126 {
 873                     	switch	.text
 874  0114               _ctimer_reset:
 876  0114 89            	pushw	x
 877  0115 89            	pushw	x
 878       00000002      OFST:	set	2
 881                     ; 127   if(initialized) {
 883  0116 725d0000      	tnz	L7_initialized
 884  011a 2717          	jreq	L134
 885                     ; 128     PROCESS_CONTEXT_BEGIN(&ctimer_process);
 887  011c ce0000        	ldw	x,_process_current
 888  011f 1f01          	ldw	(OFST-1,sp),x
 892  0121 ae0004        	ldw	x,#_ctimer_process
 893  0124 cf0000        	ldw	_process_current,x
 894                     ; 129     etimer_reset(&c->etimer);
 896  0127 1e03          	ldw	x,(OFST+1,sp)
 897  0129 5c            	incw	x
 898  012a 5c            	incw	x
 899  012b cd0000        	call	_etimer_reset
 901                     ; 130     PROCESS_CONTEXT_END(&ctimer_process);
 903  012e 1e01          	ldw	x,(OFST-1,sp)
 904  0130 cf0000        	ldw	_process_current,x
 906  0133               L134:
 907                     ; 133   list_add(ctimer_list, c);
 909  0133 1e03          	ldw	x,(OFST+1,sp)
 910  0135 89            	pushw	x
 911  0136 ce0002        	ldw	x,L5_ctimer_list
 912  0139 cd0000        	call	_list_add
 914  013c 85            	popw	x
 915                     ; 134 }
 918  013d 5b04          	addw	sp,#4
 919  013f 81            	ret
 974                     ; 137 ctimer_restart(struct ctimer *c)
 974                     ; 138 {
 975                     	switch	.text
 976  0140               _ctimer_restart:
 978  0140 89            	pushw	x
 979  0141 89            	pushw	x
 980       00000002      OFST:	set	2
 983                     ; 139   if(initialized) {
 985  0142 725d0000      	tnz	L7_initialized
 986  0146 2717          	jreq	L164
 987                     ; 140     PROCESS_CONTEXT_BEGIN(&ctimer_process);
 989  0148 ce0000        	ldw	x,_process_current
 990  014b 1f01          	ldw	(OFST-1,sp),x
 994  014d ae0004        	ldw	x,#_ctimer_process
 995  0150 cf0000        	ldw	_process_current,x
 996                     ; 141     etimer_restart(&c->etimer);
 998  0153 1e03          	ldw	x,(OFST+1,sp)
 999  0155 5c            	incw	x
1000  0156 5c            	incw	x
1001  0157 cd0000        	call	_etimer_restart
1003                     ; 142     PROCESS_CONTEXT_END(&ctimer_process);
1005  015a 1e01          	ldw	x,(OFST-1,sp)
1006  015c cf0000        	ldw	_process_current,x
1008  015f               L164:
1009                     ; 145   list_add(ctimer_list, c);
1011  015f 1e03          	ldw	x,(OFST+1,sp)
1012  0161 89            	pushw	x
1013  0162 ce0002        	ldw	x,L5_ctimer_list
1014  0165 cd0000        	call	_list_add
1016  0168 85            	popw	x
1017                     ; 146 }
1020  0169 5b04          	addw	sp,#4
1021  016b 81            	ret
1062                     ; 149 ctimer_stop(struct ctimer *c)
1062                     ; 150 {
1063                     	switch	.text
1064  016c               _ctimer_stop:
1066  016c 89            	pushw	x
1067       00000000      OFST:	set	0
1070                     ; 151   if(initialized) {
1072  016d 725d0000      	tnz	L7_initialized
1073  0171 2707          	jreq	L305
1074                     ; 152     etimer_stop(&c->etimer);
1076  0173 5c            	incw	x
1077  0174 5c            	incw	x
1078  0175 cd0000        	call	_etimer_stop
1081  0178 200c          	jra	L505
1082  017a               L305:
1083                     ; 154     c->etimer.next = NULL;
1085  017a 1e01          	ldw	x,(OFST+1,sp)
1086  017c 905f          	clrw	y
1087  017e ef06          	ldw	(6,x),y
1088                     ; 155     c->etimer.p = PROCESS_NONE;
1090  0180 1e01          	ldw	x,(OFST+1,sp)
1091  0182 905f          	clrw	y
1092  0184 ef08          	ldw	(8,x),y
1093  0186               L505:
1094                     ; 157   list_remove(ctimer_list, c);
1096  0186 1e01          	ldw	x,(OFST+1,sp)
1097  0188 89            	pushw	x
1098  0189 ce0002        	ldw	x,L5_ctimer_list
1099  018c cd0000        	call	_list_remove
1101  018f 85            	popw	x
1102                     ; 158 }
1105  0190 85            	popw	x
1106  0191 81            	ret
1159                     ; 161 ctimer_expired(struct ctimer *c)
1159                     ; 162 {
1160                     	switch	.text
1161  0192               _ctimer_expired:
1163  0192 89            	pushw	x
1164  0193 89            	pushw	x
1165       00000002      OFST:	set	2
1168                     ; 164   if(initialized) {
1170  0194 725d0000      	tnz	L7_initialized
1171  0198 2707          	jreq	L535
1172                     ; 165     return etimer_expired(&c->etimer);
1174  019a 5c            	incw	x
1175  019b 5c            	incw	x
1176  019c cd0000        	call	_etimer_expired
1179  019f 2011          	jra	L62
1180  01a1               L535:
1181                     ; 167   for(t = list_head(ctimer_list); t != NULL; t = t->next) {
1183  01a1 ce0002        	ldw	x,L5_ctimer_list
1184  01a4 cd0000        	call	_list_head
1186  01a7 1f01          	ldw	(OFST-1,sp),x
1189  01a9 200f          	jra	L345
1190  01ab               L735:
1191                     ; 168     if(t == c) {
1193  01ab 1e01          	ldw	x,(OFST-1,sp)
1194  01ad 1303          	cpw	x,(OFST+1,sp)
1195  01af 2604          	jrne	L745
1196                     ; 169       return 0;
1198  01b1 5f            	clrw	x
1200  01b2               L62:
1202  01b2 5b04          	addw	sp,#4
1203  01b4 81            	ret
1204  01b5               L745:
1205                     ; 167   for(t = list_head(ctimer_list); t != NULL; t = t->next) {
1207  01b5 1e01          	ldw	x,(OFST-1,sp)
1208  01b7 fe            	ldw	x,(x)
1209  01b8 1f01          	ldw	(OFST-1,sp),x
1211  01ba               L345:
1214  01ba 1e01          	ldw	x,(OFST-1,sp)
1215  01bc 26ed          	jrne	L735
1216                     ; 172   return 1;
1218  01be ae0001        	ldw	x,#1
1220  01c1 20ef          	jra	L62
1273                     	xdef	_ctimer_process
1274                     	switch	.bss
1275  0000               L7_initialized:
1276  0000 00            	ds.b	1
1277                     	xref	_list_remove
1278                     	xref	_list_add
1279                     	xref	_list_head
1280                     	xref	_list_init
1281                     	xdef	_ctimer_init
1282                     	xdef	_ctimer_expired
1283                     	xdef	_ctimer_stop
1284                     	xdef	_ctimer_set_with_process
1285                     	xdef	_ctimer_set
1286                     	xdef	_ctimer_restart
1287                     	xdef	_ctimer_reset
1288                     	xref	_etimer_stop
1289                     	xref	_etimer_expired
1290                     	xref	_etimer_restart
1291                     	xref	_etimer_reset
1292                     	xref	_etimer_set
1293                     	xref	_process_current
1294                     	xref	_process_start
1295                     .const:	section	.text
1296  0000               L31:
1297  0000 4374696d6572  	dc.b	"Ctimer process",0
1317                     	end
