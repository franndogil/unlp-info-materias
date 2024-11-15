.data
TABLA1:	.word	11, 2, 6, 7, 4, 21, 10, 4
CANT:	.word	8
RES:	.word	0
TABLA2:	.word	0

.code
ld $t0, CANT($zero)
dadd $t1, $zero, $zero
dadd $t2, $zero, $zero
dadd $t3, $zero, $zero
loop: ld $t4, TABLA1($t2)
andi $t5, $t4, 1
bnez $t5, FUERA	
daddi $t1, $t1, 1
sd $t4, TABLA2($t3)
daddi $t3, $t3, 8
FUERA: daddi $t2, $t2, 8
daddi $t0, $t0, -1
bnez $t0, loop
sd $t1, RES($zero)
halt