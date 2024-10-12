	.data
v:	.word32	5, 2, 6
res:	.byte	0

	.code
	dadd $t2, $zero, $zero
	dadd $t1, $zero, $zero
	daddi $t3, $zero, 3
	daddi $t5, $zero, 2

lazo:	beq $t1, $t3, fin
	ld $t0, v($t2)
lazo2:	daddi $t1, $t1, 1 
	dadd $t4, $t4, $t0
	beq $t1, $t5, lazo
	dsrl $t0, $t0, 31
	beq $t1, $t5, lazo
	j lazo2

fin:	sd $t4, res($zero)
	halt