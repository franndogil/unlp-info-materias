.data
A:	.word	5
res:	.word	0
.code
daddi $t1, $0, 0
daddi $t2, $0, 0
loop: ld $t3, A($t1)
dadd $t2, $t2, $t3
daddi $t1, $t1, 8
bnez $t3, loop
sd $t2, res($0)
halt

#7 atascos RAW
#1.813 CPI
