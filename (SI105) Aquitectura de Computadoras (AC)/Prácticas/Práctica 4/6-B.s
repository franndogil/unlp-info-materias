	.data
v:	.word	5, 2, 6
res:	.byte	0

	.code
	dadd $t2, $zero, $zero
	dadd $t1, $zero, $zero
	daddi $t3, $zero, 3
lazo:	beq $t1, $t3, fin
	ld $t0, v($t2)
	daddi $t1, $t1, 1
	daddi $t2, $t2, 8
	dadd $t4, $t4, $t0
	j lazo
fin:	sd $t4, res($zero)
	halt