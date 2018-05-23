   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  57                     ; 66 list_init(list_t list)
  57                     ; 67 {
  59                     	switch	.text
  60  0000               _list_init:
  64                     ; 68   *list = NULL;
  66  0000 905f          	clrw	y
  67  0002 ff            	ldw	(x),y
  68                     ; 69 }
  71  0003 81            	ret
 108                     ; 82 void *
 108                     ; 83 list_head(list_t list)
 108                     ; 84 {
 109                     	switch	.text
 110  0004               _list_head:
 114                     ; 85   return *list;
 116  0004 fe            	ldw	x,(x)
 119  0005 81            	ret
 166                     ; 101 list_copy(list_t dest, list_t src)
 166                     ; 102 {
 167                     	switch	.text
 168  0006               _list_copy:
 170  0006 89            	pushw	x
 171       00000000      OFST:	set	0
 174                     ; 103   *dest = *src;
 176  0007 1e05          	ldw	x,(OFST+5,sp)
 177  0009 1601          	ldw	y,(OFST+1,sp)
 178  000b 89            	pushw	x
 179  000c fe            	ldw	x,(x)
 180  000d 90ff          	ldw	(y),x
 181  000f 85            	popw	x
 182                     ; 104 }
 185  0010 85            	popw	x
 186  0011 81            	ret
 254                     ; 117 void *
 254                     ; 118 list_tail(list_t list)
 254                     ; 119 {
 255                     	switch	.text
 256  0012               _list_tail:
 258  0012 89            	pushw	x
 259  0013 89            	pushw	x
 260       00000002      OFST:	set	2
 263                     ; 122   if(*list == NULL) {
 265  0014 e601          	ld	a,(1,x)
 266  0016 fa            	or	a,(x)
 267  0017 2603          	jrne	L521
 268                     ; 123     return NULL;
 270  0019 5f            	clrw	x
 272  001a 2015          	jra	L41
 273  001c               L521:
 274                     ; 126   for(l = *list; l->next != NULL; l = l->next);
 276  001c 1e03          	ldw	x,(OFST+1,sp)
 277  001e fe            	ldw	x,(x)
 278  001f 1f01          	ldw	(OFST-1,sp),x
 281  0021 2005          	jra	L331
 282  0023               L721:
 286  0023 1e01          	ldw	x,(OFST-1,sp)
 287  0025 fe            	ldw	x,(x)
 288  0026 1f01          	ldw	(OFST-1,sp),x
 290  0028               L331:
 293  0028 1e01          	ldw	x,(OFST-1,sp)
 294  002a e601          	ld	a,(1,x)
 295  002c fa            	or	a,(x)
 296  002d 26f4          	jrne	L721
 297                     ; 128   return l;
 299  002f 1e01          	ldw	x,(OFST-1,sp)
 301  0031               L41:
 303  0031 5b04          	addw	sp,#4
 304  0033 81            	ret
 364                     ; 143 list_add(list_t list, void *item)
 364                     ; 144 {
 365                     	switch	.text
 366  0034               _list_add:
 368  0034 89            	pushw	x
 369  0035 89            	pushw	x
 370       00000002      OFST:	set	2
 373                     ; 148   list_remove(list, item);
 375  0036 1e07          	ldw	x,(OFST+5,sp)
 376  0038 89            	pushw	x
 377  0039 1e05          	ldw	x,(OFST+3,sp)
 378  003b cd00d5        	call	_list_remove
 380  003e 85            	popw	x
 381                     ; 150   ((struct list *)item)->next = NULL;
 383  003f 1e07          	ldw	x,(OFST+5,sp)
 384  0041 905f          	clrw	y
 385  0043 ff            	ldw	(x),y
 386                     ; 152   l = list_tail(list);
 388  0044 1e03          	ldw	x,(OFST+1,sp)
 389  0046 adca          	call	_list_tail
 391  0048 1f01          	ldw	(OFST-1,sp),x
 393                     ; 154   if(l == NULL) {
 395  004a 1e01          	ldw	x,(OFST-1,sp)
 396  004c 2607          	jrne	L761
 397                     ; 155     *list = item;
 399  004e 1e03          	ldw	x,(OFST+1,sp)
 400  0050 1607          	ldw	y,(OFST+5,sp)
 401  0052 ff            	ldw	(x),y
 403  0053 2005          	jra	L171
 404  0055               L761:
 405                     ; 157     l->next = item;
 407  0055 1e01          	ldw	x,(OFST-1,sp)
 408  0057 1607          	ldw	y,(OFST+5,sp)
 409  0059 ff            	ldw	(x),y
 410  005a               L171:
 411                     ; 159 }
 414  005a 5b04          	addw	sp,#4
 415  005c 81            	ret
 462                     ; 165 list_push(list_t list, void *item)
 462                     ; 166 {
 463                     	switch	.text
 464  005d               _list_push:
 466  005d 89            	pushw	x
 467       00000000      OFST:	set	0
 470                     ; 170   list_remove(list, item);
 472  005e 1e05          	ldw	x,(OFST+5,sp)
 473  0060 89            	pushw	x
 474  0061 1e03          	ldw	x,(OFST+3,sp)
 475  0063 ad70          	call	_list_remove
 477  0065 85            	popw	x
 478                     ; 172   ((struct list *)item)->next = *list;
 480  0066 1e01          	ldw	x,(OFST+1,sp)
 481  0068 1605          	ldw	y,(OFST+5,sp)
 482  006a 89            	pushw	x
 483  006b fe            	ldw	x,(x)
 484  006c 90ff          	ldw	(y),x
 485  006e 85            	popw	x
 486                     ; 173   *list = item;
 488  006f 1e01          	ldw	x,(OFST+1,sp)
 489  0071 1605          	ldw	y,(OFST+5,sp)
 490  0073 ff            	ldw	(x),y
 491                     ; 174 }
 494  0074 85            	popw	x
 495  0075 81            	ret
 556                     ; 185 void *
 556                     ; 186 list_chop(list_t list)
 556                     ; 187 {
 557                     	switch	.text
 558  0076               _list_chop:
 560  0076 89            	pushw	x
 561  0077 5204          	subw	sp,#4
 562       00000004      OFST:	set	4
 565                     ; 190   if(*list == NULL) {
 567  0079 e601          	ld	a,(1,x)
 568  007b fa            	or	a,(x)
 569  007c 2603          	jrne	L742
 570                     ; 191     return NULL;
 572  007e 5f            	clrw	x
 574  007f 2014          	jra	L42
 575  0081               L742:
 576                     ; 193   if(((struct list *)*list)->next == NULL) {
 578  0081 1e05          	ldw	x,(OFST+1,sp)
 579  0083 fe            	ldw	x,(x)
 580  0084 e601          	ld	a,(1,x)
 581  0086 fa            	or	a,(x)
 582  0087 260f          	jrne	L152
 583                     ; 194     l = *list;
 585  0089 1e05          	ldw	x,(OFST+1,sp)
 586  008b fe            	ldw	x,(x)
 587  008c 1f03          	ldw	(OFST-1,sp),x
 589                     ; 195     *list = NULL;
 591  008e 1e05          	ldw	x,(OFST+1,sp)
 592  0090 905f          	clrw	y
 593  0092 ff            	ldw	(x),y
 594                     ; 196     return l;
 596  0093 1e03          	ldw	x,(OFST-1,sp)
 598  0095               L42:
 600  0095 5b06          	addw	sp,#6
 601  0097 81            	ret
 602  0098               L152:
 603                     ; 199   for(l = *list; l->next->next != NULL; l = l->next);
 605  0098 1e05          	ldw	x,(OFST+1,sp)
 606  009a fe            	ldw	x,(x)
 607  009b 1f03          	ldw	(OFST-1,sp),x
 610  009d 2005          	jra	L752
 611  009f               L352:
 615  009f 1e03          	ldw	x,(OFST-1,sp)
 616  00a1 fe            	ldw	x,(x)
 617  00a2 1f03          	ldw	(OFST-1,sp),x
 619  00a4               L752:
 622  00a4 1e03          	ldw	x,(OFST-1,sp)
 623  00a6 fe            	ldw	x,(x)
 624  00a7 e601          	ld	a,(1,x)
 625  00a9 fa            	or	a,(x)
 626  00aa 26f3          	jrne	L352
 627                     ; 201   r = l->next;
 629  00ac 1e03          	ldw	x,(OFST-1,sp)
 630  00ae fe            	ldw	x,(x)
 631  00af 1f01          	ldw	(OFST-3,sp),x
 633                     ; 202   l->next = NULL;
 635  00b1 1e03          	ldw	x,(OFST-1,sp)
 636  00b3 905f          	clrw	y
 637  00b5 ff            	ldw	(x),y
 638                     ; 204   return r;
 640  00b6 1e01          	ldw	x,(OFST-3,sp)
 642  00b8 20db          	jra	L42
 691                     ; 217 void *
 691                     ; 218 list_pop(list_t list)
 691                     ; 219 {
 692                     	switch	.text
 693  00ba               _list_pop:
 695  00ba 89            	pushw	x
 696  00bb 89            	pushw	x
 697       00000002      OFST:	set	2
 700                     ; 221   l = *list;
 702  00bc fe            	ldw	x,(x)
 703  00bd 1f01          	ldw	(OFST-1,sp),x
 705                     ; 222   if(*list != NULL) {
 707  00bf 1e03          	ldw	x,(OFST+1,sp)
 708  00c1 e601          	ld	a,(1,x)
 709  00c3 fa            	or	a,(x)
 710  00c4 270a          	jreq	L703
 711                     ; 223     *list = ((struct list *)*list)->next;
 713  00c6 1e03          	ldw	x,(OFST+1,sp)
 714  00c8 fe            	ldw	x,(x)
 715  00c9 1603          	ldw	y,(OFST+1,sp)
 716  00cb 89            	pushw	x
 717  00cc fe            	ldw	x,(x)
 718  00cd 90ff          	ldw	(y),x
 719  00cf 85            	popw	x
 720  00d0               L703:
 721                     ; 226   return l;
 723  00d0 1e01          	ldw	x,(OFST-1,sp)
 726  00d2 5b04          	addw	sp,#4
 727  00d4 81            	ret
 797                     ; 240 list_remove(list_t list, void *item)
 797                     ; 241 {
 798                     	switch	.text
 799  00d5               _list_remove:
 801  00d5 89            	pushw	x
 802  00d6 5204          	subw	sp,#4
 803       00000004      OFST:	set	4
 806                     ; 244   if(*list == NULL) {
 808  00d8 e601          	ld	a,(1,x)
 809  00da fa            	or	a,(x)
 810  00db 272d          	jreq	L23
 811                     ; 245     return;
 813                     ; 248   r = NULL;
 815  00dd 5f            	clrw	x
 816  00de 1f01          	ldw	(OFST-3,sp),x
 818                     ; 249   for(l = *list; l != NULL; l = l->next) {
 820  00e0 1e05          	ldw	x,(OFST+1,sp)
 821  00e2 fe            	ldw	x,(x)
 822  00e3 1f03          	ldw	(OFST-1,sp),x
 825  00e5 202f          	jra	L553
 826  00e7               L153:
 827                     ; 250     if(l == item) {
 829  00e7 1e03          	ldw	x,(OFST-1,sp)
 830  00e9 1309          	cpw	x,(OFST+5,sp)
 831  00eb 2620          	jrne	L163
 832                     ; 251       if(r == NULL) {
 834  00ed 1e01          	ldw	x,(OFST-3,sp)
 835  00ef 260b          	jrne	L363
 836                     ; 253 	*list = l->next;
 838  00f1 1e03          	ldw	x,(OFST-1,sp)
 839  00f3 1605          	ldw	y,(OFST+1,sp)
 840  00f5 89            	pushw	x
 841  00f6 fe            	ldw	x,(x)
 842  00f7 90ff          	ldw	(y),x
 843  00f9 85            	popw	x
 845  00fa 2009          	jra	L563
 846  00fc               L363:
 847                     ; 256 	r->next = l->next;
 849  00fc 1e03          	ldw	x,(OFST-1,sp)
 850  00fe 1601          	ldw	y,(OFST-3,sp)
 851  0100 89            	pushw	x
 852  0101 fe            	ldw	x,(x)
 853  0102 90ff          	ldw	(y),x
 854  0104 85            	popw	x
 855  0105               L563:
 856                     ; 258       l->next = NULL;
 858  0105 1e03          	ldw	x,(OFST-1,sp)
 859  0107 905f          	clrw	y
 860  0109 ff            	ldw	(x),y
 861                     ; 259       return;
 862  010a               L23:
 865  010a 5b06          	addw	sp,#6
 866  010c 81            	ret
 867  010d               L163:
 868                     ; 261     r = l;
 870  010d 1e03          	ldw	x,(OFST-1,sp)
 871  010f 1f01          	ldw	(OFST-3,sp),x
 873                     ; 249   for(l = *list; l != NULL; l = l->next) {
 875  0111 1e03          	ldw	x,(OFST-1,sp)
 876  0113 fe            	ldw	x,(x)
 877  0114 1f03          	ldw	(OFST-1,sp),x
 879  0116               L553:
 882  0116 1e03          	ldw	x,(OFST-1,sp)
 883  0118 26cd          	jrne	L153
 884                     ; 263 }
 886  011a 20ee          	jra	L23
 941                     ; 275 list_length(list_t list)
 941                     ; 276 {
 942                     	switch	.text
 943  011c               _list_length:
 945  011c 89            	pushw	x
 946  011d 5204          	subw	sp,#4
 947       00000004      OFST:	set	4
 950                     ; 278   int n = 0;
 952  011f 5f            	clrw	x
 953  0120 1f01          	ldw	(OFST-3,sp),x
 955                     ; 280   for(l = *list; l != NULL; l = l->next) {
 957  0122 1e05          	ldw	x,(OFST+1,sp)
 958  0124 fe            	ldw	x,(x)
 959  0125 1f03          	ldw	(OFST-1,sp),x
 962  0127 200c          	jra	L124
 963  0129               L514:
 964                     ; 281     ++n;
 966  0129 1e01          	ldw	x,(OFST-3,sp)
 967  012b 1c0001        	addw	x,#1
 968  012e 1f01          	ldw	(OFST-3,sp),x
 970                     ; 280   for(l = *list; l != NULL; l = l->next) {
 972  0130 1e03          	ldw	x,(OFST-1,sp)
 973  0132 fe            	ldw	x,(x)
 974  0133 1f03          	ldw	(OFST-1,sp),x
 976  0135               L124:
 979  0135 1e03          	ldw	x,(OFST-1,sp)
 980  0137 26f0          	jrne	L514
 981                     ; 284   return n;
 983  0139 1e01          	ldw	x,(OFST-3,sp)
 986  013b 5b06          	addw	sp,#6
 987  013d 81            	ret
1044                     ; 303 list_insert(list_t list, void *previtem, void *newitem)
1044                     ; 304 {
1045                     	switch	.text
1046  013e               _list_insert:
1048  013e 89            	pushw	x
1049       00000000      OFST:	set	0
1052                     ; 305   if(previtem == NULL) {
1054  013f 1e05          	ldw	x,(OFST+5,sp)
1055  0141 260b          	jrne	L354
1056                     ; 306     list_push(list, newitem);
1058  0143 1e07          	ldw	x,(OFST+7,sp)
1059  0145 89            	pushw	x
1060  0146 1e03          	ldw	x,(OFST+3,sp)
1061  0148 cd005d        	call	_list_push
1063  014b 85            	popw	x
1065  014c 200e          	jra	L554
1066  014e               L354:
1067                     ; 309     ((struct list *)newitem)->next = ((struct list *)previtem)->next;
1069  014e 1e05          	ldw	x,(OFST+5,sp)
1070  0150 1607          	ldw	y,(OFST+7,sp)
1071  0152 89            	pushw	x
1072  0153 fe            	ldw	x,(x)
1073  0154 90ff          	ldw	(y),x
1074  0156 85            	popw	x
1075                     ; 310     ((struct list *)previtem)->next = newitem;
1077  0157 1e05          	ldw	x,(OFST+5,sp)
1078  0159 1607          	ldw	y,(OFST+7,sp)
1079  015b ff            	ldw	(x),y
1080  015c               L554:
1081                     ; 312 }
1084  015c 85            	popw	x
1085  015d 81            	ret
1121                     ; 324 void *
1121                     ; 325 list_item_next(void *item)
1121                     ; 326 {
1122                     	switch	.text
1123  015e               _list_item_next:
1127                     ; 327   return item == NULL? NULL: ((struct list *)item)->next;
1129  015e a30000        	cpw	x,#0
1130  0161 2603          	jrne	L24
1131  0163 5f            	clrw	x
1132  0164 2001          	jra	L44
1133  0166               L24:
1134  0166 fe            	ldw	x,(x)
1135  0167               L44:
1138  0167 81            	ret
1151                     	xdef	_list_item_next
1152                     	xdef	_list_insert
1153                     	xdef	_list_copy
1154                     	xdef	_list_length
1155                     	xdef	_list_remove
1156                     	xdef	_list_add
1157                     	xdef	_list_chop
1158                     	xdef	_list_push
1159                     	xdef	_list_pop
1160                     	xdef	_list_tail
1161                     	xdef	_list_head
1162                     	xdef	_list_init
1181                     	end
