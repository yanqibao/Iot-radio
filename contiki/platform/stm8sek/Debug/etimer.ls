   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  16                     	switch	.data
  17  0000               _etimer_process:
  18  0000 0000          	dc.w	0
  19  0002 0000          	dc.w	L11
  21  0004 006f          	dc.w	L7_process_thread_etimer_process
  22  0006 00000000      	ds.b	4
 222                     ; 58 update_time(void)
 222                     ; 59 {
 224                     	switch	.text
 225  0000               L31_update_time:
 227  0000 5206          	subw	sp,#6
 228       00000006      OFST:	set	6
 231                     ; 64   if (timerlist == NULL) {
 233  0002 ce0002        	ldw	x,L3_timerlist
 234  0005 2607          	jrne	L341
 235                     ; 65     next_expiration = 0;
 237  0007 5f            	clrw	x
 238  0008 cf0000        	ldw	L5_next_expiration,x
 240  000b               L541:
 241                     ; 78 }
 244  000b 5b06          	addw	sp,#6
 245  000d 81            	ret
 246  000e               L341:
 247                     ; 67     now = clock_time();
 249  000e cd0000        	call	_clock_time
 251  0011 1f03          	ldw	(OFST-3,sp),x
 253                     ; 68     t = timerlist;
 255  0013 ce0002        	ldw	x,L3_timerlist
 256  0016 1f05          	ldw	(OFST-1,sp),x
 258                     ; 70     tdist = t->timer.start + t->timer.interval - now;
 260  0018 1e05          	ldw	x,(OFST-1,sp)
 261  001a ee02          	ldw	x,(2,x)
 262  001c 1605          	ldw	y,(OFST-1,sp)
 263  001e 01            	rrwa	x,a
 264  001f 90eb01        	add	a,(1,y)
 265  0022 01            	rrwa	x,a
 266  0023 90f9          	adc	a,(y)
 267  0025 01            	rrwa	x,a
 268  0026 72f003        	subw	x,(OFST-3,sp)
 269  0029 1f01          	ldw	(OFST-5,sp),x
 271                     ; 71     for(t = t->next; t != NULL; t = t->next) {
 273  002b 1e05          	ldw	x,(OFST-1,sp)
 274  002d ee04          	ldw	x,(4,x)
 275  002f 1f05          	ldw	(OFST-1,sp),x
 278  0031 202e          	jra	L351
 279  0033               L741:
 280                     ; 72       if(t->timer.start + t->timer.interval - now < tdist) {
 282  0033 1e05          	ldw	x,(OFST-1,sp)
 283  0035 ee02          	ldw	x,(2,x)
 284  0037 1605          	ldw	y,(OFST-1,sp)
 285  0039 01            	rrwa	x,a
 286  003a 90eb01        	add	a,(1,y)
 287  003d 01            	rrwa	x,a
 288  003e 90f9          	adc	a,(y)
 289  0040 01            	rrwa	x,a
 290  0041 72f003        	subw	x,(OFST-3,sp)
 291  0044 1301          	cpw	x,(OFST-5,sp)
 292  0046 2413          	jruge	L751
 293                     ; 73 	tdist = t->timer.start + t->timer.interval - now;
 295  0048 1e05          	ldw	x,(OFST-1,sp)
 296  004a ee02          	ldw	x,(2,x)
 297  004c 1605          	ldw	y,(OFST-1,sp)
 298  004e 01            	rrwa	x,a
 299  004f 90eb01        	add	a,(1,y)
 300  0052 01            	rrwa	x,a
 301  0053 90f9          	adc	a,(y)
 302  0055 01            	rrwa	x,a
 303  0056 72f003        	subw	x,(OFST-3,sp)
 304  0059 1f01          	ldw	(OFST-5,sp),x
 306  005b               L751:
 307                     ; 71     for(t = t->next; t != NULL; t = t->next) {
 309  005b 1e05          	ldw	x,(OFST-1,sp)
 310  005d ee04          	ldw	x,(4,x)
 311  005f 1f05          	ldw	(OFST-1,sp),x
 313  0061               L351:
 316  0061 1e05          	ldw	x,(OFST-1,sp)
 317  0063 26ce          	jrne	L741
 318                     ; 76     next_expiration = now + tdist;
 320  0065 1e03          	ldw	x,(OFST-3,sp)
 321  0067 72fb01        	addw	x,(OFST-5,sp)
 322  006a cf0000        	ldw	L5_next_expiration,x
 323  006d 209c          	jra	L541
 426                     ; 80 PROCESS_THREAD(etimer_process, ev, data)
 426                     ; 81 {
 427                     	switch	.text
 428  006f               L7_process_thread_etimer_process:
 430  006f 89            	pushw	x
 431  0070 5205          	subw	sp,#5
 432       00000005      OFST:	set	5
 435                     ; 84   PROCESS_BEGIN();
 437  0072 a601          	ld	a,#1
 438  0074 6b01          	ld	(OFST-4,sp),a
 443  0076 fe            	ldw	x,(x)
 445                     ; 116     for(t = timerlist; t != NULL; t = t->next) {
 446  0077 5d            	tnzw	x
 447  0078 2709          	jreq	L161
 448  007a 1d0059        	subw	x,#89
 449  007d 2711          	jreq	L361
 450  007f ac630163      	jpf	L342
 451  0083               L161:
 452                     ; 86   timerlist = NULL;
 455  0083 5f            	clrw	x
 456  0084 cf0002        	ldw	L3_timerlist,x
 457  0087               L152:
 458                     ; 89     PROCESS_YIELD();
 460  0087 0f01          	clr	(OFST-4,sp)
 464  0089 1e06          	ldw	x,(OFST+1,sp)
 465  008b 90ae0059      	ldw	y,#89
 466  008f ff            	ldw	(x),y
 467  0090               L361:
 471  0090 0d01          	tnz	(OFST-4,sp)
 472  0092 2606          	jrne	L552
 475  0094 a601          	ld	a,#1
 477  0096 ac6a016a      	jpf	L01
 478  009a               L552:
 479                     ; 91     if(ev == PROCESS_EVENT_EXITED) {
 481  009a 7b0a          	ld	a,(OFST+5,sp)
 482  009c a187          	cp	a,#135
 483  009e 2659          	jrne	L752
 484                     ; 92       struct process *p = data;
 486  00a0 1e0b          	ldw	x,(OFST+6,sp)
 487  00a2 1f02          	ldw	(OFST-3,sp),x
 490  00a4 2008          	jra	L562
 491  00a6               L162:
 492                     ; 95 	timerlist = timerlist->next;
 494  00a6 ce0002        	ldw	x,L3_timerlist
 495  00a9 ee04          	ldw	x,(4,x)
 496  00ab cf0002        	ldw	L3_timerlist,x
 497  00ae               L562:
 498                     ; 94       while(timerlist != NULL && timerlist->p == p) {
 500  00ae ce0002        	ldw	x,L3_timerlist
 501  00b1 270d          	jreq	L172
 503  00b3 ce0002        	ldw	x,L3_timerlist
 504  00b6 9093          	ldw	y,x
 505  00b8 51            	exgw	x,y
 506  00b9 ee06          	ldw	x,(6,x)
 507  00bb 1302          	cpw	x,(OFST-3,sp)
 508  00bd 51            	exgw	x,y
 509  00be 27e6          	jreq	L162
 510  00c0               L172:
 511                     ; 98       if(timerlist != NULL) {
 513  00c0 ce0002        	ldw	x,L3_timerlist
 514  00c3 27c2          	jreq	L152
 515                     ; 99 	t = timerlist;
 517  00c5 ce0002        	ldw	x,L3_timerlist
 518  00c8 1f04          	ldw	(OFST-1,sp),x
 521  00ca 2023          	jra	L103
 522  00cc               L572:
 523                     ; 101 	  if(t->next->p == p) {
 525  00cc 1e04          	ldw	x,(OFST-1,sp)
 526  00ce ee04          	ldw	x,(4,x)
 527  00d0 9093          	ldw	y,x
 528  00d2 51            	exgw	x,y
 529  00d3 ee06          	ldw	x,(6,x)
 530  00d5 1302          	cpw	x,(OFST-3,sp)
 531  00d7 51            	exgw	x,y
 532  00d8 260f          	jrne	L503
 533                     ; 102 	    t->next = t->next->next;
 535  00da 1e04          	ldw	x,(OFST-1,sp)
 536  00dc ee04          	ldw	x,(4,x)
 537  00de 1604          	ldw	y,(OFST-1,sp)
 538  00e0 89            	pushw	x
 539  00e1 ee04          	ldw	x,(4,x)
 540  00e3 90ef04        	ldw	(4,y),x
 541  00e6 85            	popw	x
 543  00e7 2006          	jra	L103
 544  00e9               L503:
 545                     ; 104 	    t = t->next;
 547  00e9 1e04          	ldw	x,(OFST-1,sp)
 548  00eb ee04          	ldw	x,(4,x)
 549  00ed 1f04          	ldw	(OFST-1,sp),x
 551  00ef               L103:
 552                     ; 100 	while(t->next != NULL) {
 554  00ef 1e04          	ldw	x,(OFST-1,sp)
 555  00f1 e605          	ld	a,(5,x)
 556  00f3 ea04          	or	a,(4,x)
 557  00f5 26d5          	jrne	L572
 558  00f7 208e          	jra	L152
 559  00f9               L752:
 560                     ; 108     } else if(ev != PROCESS_EVENT_POLL) {
 562  00f9 7b0a          	ld	a,(OFST+5,sp)
 563  00fb a182          	cp	a,#130
 564  00fd 2688          	jrne	L152
 565                     ; 109       continue;
 567  00ff               L561:
 568                     ; 112   again:
 568                     ; 113     
 568                     ; 114     u = NULL;
 570  00ff 5f            	clrw	x
 571  0100 1f02          	ldw	(OFST-3,sp),x
 573                     ; 116     for(t = timerlist; t != NULL; t = t->next) {
 575  0102 ce0002        	ldw	x,L3_timerlist
 576  0105 1f04          	ldw	(OFST-1,sp),x
 579  0107 2052          	jra	L123
 580  0109               L513:
 581                     ; 117       if(timer_expired(&t->timer)) {
 583  0109 1e04          	ldw	x,(OFST-1,sp)
 584  010b cd0000        	call	_timer_expired
 586  010e a30000        	cpw	x,#0
 587  0111 273e          	jreq	L523
 588                     ; 118 	if(process_post(t->p, PROCESS_EVENT_TIMER, t) == PROCESS_ERR_OK) {
 590  0113 1e04          	ldw	x,(OFST-1,sp)
 591  0115 89            	pushw	x
 592  0116 4b88          	push	#136
 593  0118 1e07          	ldw	x,(OFST+2,sp)
 594  011a ee06          	ldw	x,(6,x)
 595  011c cd0000        	call	_process_post
 597  011f 5b03          	addw	sp,#3
 598  0121 a30000        	cpw	x,#0
 599  0124 2629          	jrne	L723
 600                     ; 123 	  t->p = PROCESS_NONE;
 602  0126 1e04          	ldw	x,(OFST-1,sp)
 603  0128 905f          	clrw	y
 604  012a ef06          	ldw	(6,x),y
 605                     ; 124 	  if(u != NULL) {
 607  012c 1e02          	ldw	x,(OFST-3,sp)
 608  012e 270d          	jreq	L133
 609                     ; 125 	    u->next = t->next;
 611  0130 1e04          	ldw	x,(OFST-1,sp)
 612  0132 1602          	ldw	y,(OFST-3,sp)
 613  0134 89            	pushw	x
 614  0135 ee04          	ldw	x,(4,x)
 615  0137 90ef04        	ldw	(4,y),x
 616  013a 85            	popw	x
 618  013b 2007          	jra	L333
 619  013d               L133:
 620                     ; 127 	    timerlist = t->next;
 622  013d 1e04          	ldw	x,(OFST-1,sp)
 623  013f ee04          	ldw	x,(4,x)
 624  0141 cf0002        	ldw	L3_timerlist,x
 625  0144               L333:
 626                     ; 129 	  t->next = NULL;
 628  0144 1e04          	ldw	x,(OFST-1,sp)
 629  0146 905f          	clrw	y
 630  0148 ef04          	ldw	(4,x),y
 631                     ; 130 	  update_time();
 633  014a cd0000        	call	L31_update_time
 635                     ; 131 	  goto again;
 637  014d 20b0          	jra	L561
 638  014f               L723:
 639                     ; 133 	  etimer_request_poll();
 641  014f ad1c          	call	_etimer_request_poll
 643  0151               L523:
 644                     ; 136       u = t;
 646  0151 1e04          	ldw	x,(OFST-1,sp)
 647  0153 1f02          	ldw	(OFST-3,sp),x
 649                     ; 116     for(t = timerlist; t != NULL; t = t->next) {
 651  0155 1e04          	ldw	x,(OFST-1,sp)
 652  0157 ee04          	ldw	x,(4,x)
 653  0159 1f04          	ldw	(OFST-1,sp),x
 655  015b               L123:
 658  015b 1e04          	ldw	x,(OFST-1,sp)
 659  015d 26aa          	jrne	L513
 661  015f ac870087      	jpf	L152
 662  0163               L342:
 663                     ; 141   PROCESS_END();
 668  0163 1e06          	ldw	x,(OFST+1,sp)
 669  0165 905f          	clrw	y
 670  0167 ff            	ldw	(x),y
 674  0168 a603          	ld	a,#3
 676  016a               L01:
 678  016a 5b07          	addw	sp,#7
 679  016c 81            	ret
 705                     ; 145 etimer_request_poll(void)
 705                     ; 146 {
 706                     	switch	.text
 707  016d               _etimer_request_poll:
 711                     ; 147   process_poll(&etimer_process);
 713  016d ae0000        	ldw	x,#_etimer_process
 714  0170 cd0000        	call	_process_poll
 716                     ; 148 }
 719  0173 81            	ret
 772                     ; 151 add_timer(struct etimer *timer)
 772                     ; 152 {
 773                     	switch	.text
 774  0174               L743_add_timer:
 776  0174 89            	pushw	x
 777  0175 89            	pushw	x
 778       00000002      OFST:	set	2
 781                     ; 155   etimer_request_poll();
 783  0176 adf5          	call	_etimer_request_poll
 785                     ; 157   if(timer->p != PROCESS_NONE) {
 787  0178 1e03          	ldw	x,(OFST+1,sp)
 788  017a e607          	ld	a,(7,x)
 789  017c ea06          	or	a,(6,x)
 790  017e 2724          	jreq	L773
 791                     ; 158     for(t = timerlist; t != NULL; t = t->next) {
 793  0180 ce0002        	ldw	x,L3_timerlist
 794  0183 1f01          	ldw	(OFST-1,sp),x
 797  0185 2019          	jra	L504
 798  0187               L104:
 799                     ; 159       if(t == timer) {
 801  0187 1e01          	ldw	x,(OFST-1,sp)
 802  0189 1303          	cpw	x,(OFST+1,sp)
 803  018b 260d          	jrne	L114
 804                     ; 161         timer->p = PROCESS_CURRENT();
 806  018d 1e03          	ldw	x,(OFST+1,sp)
 807  018f 90ce0000      	ldw	y,_process_current
 808  0193 ef06          	ldw	(6,x),y
 809                     ; 162 	update_time();
 811  0195 cd0000        	call	L31_update_time
 813                     ; 163 	return;
 815  0198 2022          	jra	L61
 816  019a               L114:
 817                     ; 158     for(t = timerlist; t != NULL; t = t->next) {
 819  019a 1e01          	ldw	x,(OFST-1,sp)
 820  019c ee04          	ldw	x,(4,x)
 821  019e 1f01          	ldw	(OFST-1,sp),x
 823  01a0               L504:
 826  01a0 1e01          	ldw	x,(OFST-1,sp)
 827  01a2 26e3          	jrne	L104
 828  01a4               L773:
 829                     ; 169   timer->p = PROCESS_CURRENT();
 831  01a4 1e03          	ldw	x,(OFST+1,sp)
 832  01a6 90ce0000      	ldw	y,_process_current
 833  01aa ef06          	ldw	(6,x),y
 834                     ; 170   timer->next = timerlist;
 836  01ac 1e03          	ldw	x,(OFST+1,sp)
 837  01ae 90ce0002      	ldw	y,L3_timerlist
 838  01b2 ef04          	ldw	(4,x),y
 839                     ; 171   timerlist = timer;
 841  01b4 1e03          	ldw	x,(OFST+1,sp)
 842  01b6 cf0002        	ldw	L3_timerlist,x
 843                     ; 173   update_time();
 845  01b9 cd0000        	call	L31_update_time
 847                     ; 174 }
 848  01bc               L61:
 851  01bc 5b04          	addw	sp,#4
 852  01be 81            	ret
 898                     ; 177 etimer_set(struct etimer *et, clock_time_t interval)
 898                     ; 178 {
 899                     	switch	.text
 900  01bf               _etimer_set:
 902  01bf 89            	pushw	x
 903       00000000      OFST:	set	0
 906                     ; 179   timer_set(&et->timer, interval);
 908  01c0 1e05          	ldw	x,(OFST+5,sp)
 909  01c2 89            	pushw	x
 910  01c3 1e03          	ldw	x,(OFST+3,sp)
 911  01c5 cd0000        	call	_timer_set
 913  01c8 85            	popw	x
 914                     ; 180   add_timer(et);
 916  01c9 1e01          	ldw	x,(OFST+1,sp)
 917  01cb ada7          	call	L743_add_timer
 919                     ; 181 }
 922  01cd 85            	popw	x
 923  01ce 81            	ret
 970                     ; 184 etimer_reset_with_new_interval(struct etimer *et, clock_time_t interval)
 970                     ; 185 {
 971                     	switch	.text
 972  01cf               _etimer_reset_with_new_interval:
 974  01cf 89            	pushw	x
 975       00000000      OFST:	set	0
 978                     ; 186   timer_reset(&et->timer);
 980  01d0 cd0000        	call	_timer_reset
 982                     ; 187   et->timer.interval = interval;
 984  01d3 1e01          	ldw	x,(OFST+1,sp)
 985  01d5 1605          	ldw	y,(OFST+5,sp)
 986  01d7 ef02          	ldw	(2,x),y
 987                     ; 188   add_timer(et);
 989  01d9 1e01          	ldw	x,(OFST+1,sp)
 990  01db ad97          	call	L743_add_timer
 992                     ; 189 }
 995  01dd 85            	popw	x
 996  01de 81            	ret
1035                     ; 192 etimer_reset(struct etimer *et)
1035                     ; 193 {
1036                     	switch	.text
1037  01df               _etimer_reset:
1039  01df 89            	pushw	x
1040       00000000      OFST:	set	0
1043                     ; 194   timer_reset(&et->timer);
1045  01e0 cd0000        	call	_timer_reset
1047                     ; 195   add_timer(et);
1049  01e3 1e01          	ldw	x,(OFST+1,sp)
1050  01e5 ad8d          	call	L743_add_timer
1052                     ; 196 }
1055  01e7 85            	popw	x
1056  01e8 81            	ret
1095                     ; 199 etimer_restart(struct etimer *et)
1095                     ; 200 {
1096                     	switch	.text
1097  01e9               _etimer_restart:
1099  01e9 89            	pushw	x
1100       00000000      OFST:	set	0
1103                     ; 201   timer_restart(&et->timer);
1105  01ea cd0000        	call	_timer_restart
1107                     ; 202   add_timer(et);
1109  01ed 1e01          	ldw	x,(OFST+1,sp)
1110  01ef ad83          	call	L743_add_timer
1112                     ; 203 }
1115  01f1 85            	popw	x
1116  01f2 81            	ret
1161                     ; 206 etimer_adjust(struct etimer *et, int timediff)
1161                     ; 207 {
1162                     	switch	.text
1163  01f3               _etimer_adjust:
1165  01f3 89            	pushw	x
1166       00000000      OFST:	set	0
1169                     ; 208   et->timer.start += timediff;
1171  01f4 9093          	ldw	y,x
1172  01f6 fe            	ldw	x,(x)
1173  01f7 72fb05        	addw	x,(OFST+5,sp)
1174  01fa 90ff          	ldw	(y),x
1175                     ; 209   update_time();
1177  01fc cd0000        	call	L31_update_time
1179                     ; 210 }
1182  01ff 85            	popw	x
1183  0200 81            	ret
1220                     ; 213 etimer_expired(struct etimer *et)
1220                     ; 214 {
1221                     	switch	.text
1222  0201               _etimer_expired:
1226                     ; 215   return et->p == PROCESS_NONE;
1228  0201 e607          	ld	a,(7,x)
1229  0203 ea06          	or	a,(6,x)
1230  0205 2605          	jrne	L43
1231  0207 ae0001        	ldw	x,#1
1232  020a 2001          	jra	L63
1233  020c               L43:
1234  020c 5f            	clrw	x
1235  020d               L63:
1238  020d 81            	ret
1276                     ; 219 etimer_expiration_time(struct etimer *et)
1276                     ; 220 {
1277                     	switch	.text
1278  020e               _etimer_expiration_time:
1280  020e 89            	pushw	x
1281       00000000      OFST:	set	0
1284                     ; 221   return et->timer.start + et->timer.interval;
1286  020f ee02          	ldw	x,(2,x)
1287  0211 1601          	ldw	y,(OFST+1,sp)
1288  0213 01            	rrwa	x,a
1289  0214 90eb01        	add	a,(1,y)
1290  0217 01            	rrwa	x,a
1291  0218 90f9          	adc	a,(y)
1292  021a 01            	rrwa	x,a
1295  021b 5b02          	addw	sp,#2
1296  021d 81            	ret
1333                     ; 225 etimer_start_time(struct etimer *et)
1333                     ; 226 {
1334                     	switch	.text
1335  021e               _etimer_start_time:
1339                     ; 227   return et->timer.start;
1341  021e fe            	ldw	x,(x)
1344  021f 81            	ret
1368                     ; 231 etimer_pending(void)
1368                     ; 232 {
1369                     	switch	.text
1370  0220               _etimer_pending:
1374                     ; 233   return timerlist != NULL;
1376  0220 ce0002        	ldw	x,L3_timerlist
1377  0223 2705          	jreq	L64
1378  0225 ae0001        	ldw	x,#1
1379  0228 2001          	jra	L05
1380  022a               L64:
1381  022a 5f            	clrw	x
1382  022b               L05:
1385  022b 81            	ret
1411                     ; 237 etimer_next_expiration_time(void)
1411                     ; 238 {
1412                     	switch	.text
1413  022c               _etimer_next_expiration_time:
1417                     ; 239   return etimer_pending() ? next_expiration : 0;
1419  022c adf2          	call	_etimer_pending
1421  022e a30000        	cpw	x,#0
1422  0231 2705          	jreq	L45
1423  0233 ce0000        	ldw	x,L5_next_expiration
1424  0236 2001          	jra	L65
1425  0238               L45:
1426  0238 5f            	clrw	x
1427  0239               L65:
1430  0239 81            	ret
1481                     ; 243 etimer_stop(struct etimer *et)
1481                     ; 244 {
1482                     	switch	.text
1483  023a               _etimer_stop:
1485  023a 89            	pushw	x
1486  023b 89            	pushw	x
1487       00000002      OFST:	set	2
1490                     ; 248   if(et == timerlist) {
1492  023c c30002        	cpw	x,L3_timerlist
1493  023f 261a          	jrne	L766
1494                     ; 249     timerlist = timerlist->next;
1496  0241 ce0002        	ldw	x,L3_timerlist
1497  0244 ee04          	ldw	x,(4,x)
1498  0246 cf0002        	ldw	L3_timerlist,x
1499                     ; 250     update_time();
1501  0249 cd0000        	call	L31_update_time
1504  024c               L176:
1505                     ; 267   et->next = NULL;
1507  024c 1e03          	ldw	x,(OFST+1,sp)
1508  024e 905f          	clrw	y
1509  0250 ef04          	ldw	(4,x),y
1510                     ; 269   et->p = PROCESS_NONE;
1512  0252 1e03          	ldw	x,(OFST+1,sp)
1513  0254 905f          	clrw	y
1514  0256 ef06          	ldw	(6,x),y
1515                     ; 270 }
1518  0258 5b04          	addw	sp,#4
1519  025a 81            	ret
1520  025b               L766:
1521                     ; 254     for(t = timerlist; t != NULL && t->next != et; t = t->next);
1523  025b ce0002        	ldw	x,L3_timerlist
1524  025e 1f01          	ldw	(OFST-1,sp),x
1527  0260 2006          	jra	L776
1528  0262               L376:
1532  0262 1e01          	ldw	x,(OFST-1,sp)
1533  0264 ee04          	ldw	x,(4,x)
1534  0266 1f01          	ldw	(OFST-1,sp),x
1536  0268               L776:
1539  0268 1e01          	ldw	x,(OFST-1,sp)
1540  026a 270c          	jreq	L307
1542  026c 1e01          	ldw	x,(OFST-1,sp)
1543  026e 9093          	ldw	y,x
1544  0270 51            	exgw	x,y
1545  0271 ee04          	ldw	x,(4,x)
1546  0273 1303          	cpw	x,(OFST+1,sp)
1547  0275 51            	exgw	x,y
1548  0276 26ea          	jrne	L376
1549  0278               L307:
1550                     ; 256     if(t != NULL) {
1552  0278 1e01          	ldw	x,(OFST-1,sp)
1553  027a 27d0          	jreq	L176
1554                     ; 260       t->next = et->next;
1556  027c 1e03          	ldw	x,(OFST+1,sp)
1557  027e 1601          	ldw	y,(OFST-1,sp)
1558  0280 89            	pushw	x
1559  0281 ee04          	ldw	x,(4,x)
1560  0283 90ef04        	ldw	(4,y),x
1561  0286 85            	popw	x
1562                     ; 262       update_time();
1564  0287 cd0000        	call	L31_update_time
1566  028a 20c0          	jra	L176
1610                     	switch	.bss
1611  0000               L5_next_expiration:
1612  0000 0000          	ds.b	2
1613  0002               L3_timerlist:
1614  0002 0000          	ds.b	2
1615                     	xdef	_etimer_process
1616                     	xdef	_etimer_next_expiration_time
1617                     	xdef	_etimer_pending
1618                     	xdef	_etimer_request_poll
1619                     	xdef	_etimer_stop
1620                     	xdef	_etimer_expired
1621                     	xdef	_etimer_start_time
1622                     	xdef	_etimer_expiration_time
1623                     	xdef	_etimer_adjust
1624                     	xdef	_etimer_restart
1625                     	xdef	_etimer_reset_with_new_interval
1626                     	xdef	_etimer_reset
1627                     	xdef	_etimer_set
1628                     	xref	_process_poll
1629                     	xref	_process_current
1630                     	xref	_process_post
1631                     	xref	_timer_expired
1632                     	xref	_timer_restart
1633                     	xref	_timer_reset
1634                     	xref	_timer_set
1635                     	xref	_clock_time
1636                     .const:	section	.text
1637  0000               L11:
1638  0000 4576656e7420  	dc.b	"Event timer",0
1658                     	end
