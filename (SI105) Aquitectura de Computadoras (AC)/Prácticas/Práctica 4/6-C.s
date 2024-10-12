	.data
v:	.word	5, 2, 6
res:	.byte	0

	.code
	daddi $t2, $zero, v
	dadd $t3, $zero, $zero
	daddi $t4, $zero, 3
lazo:	beq $t3, $t4, fin
	ld $t0, 0($t2)
	dadd $t1, $t1, $t0
	daddi $t2, $t2, 8
	daddi $t3, $t3, 1
	j lazo
fin:	sd $t1, res($zero)
	halt