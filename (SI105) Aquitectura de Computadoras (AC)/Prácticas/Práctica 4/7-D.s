	.data
v:	.word	0, 2, 10, 7, 3, 4, 6, 5, 9, 8
w:	.word	0

	.code
	daddi $t2, $t2, 10
lazo:	beq $t1, $t2, fin
	ld $t0, v($t5)
	andi $t3, $t0, 1
	beqz $t3, no_es
	sd $t0, w($t6)
	daddi $t1, $t1, 1
	daddi $t5, $t5, 8
	daddi $t6, $t6, 8
	j lazo
no_es:	daddi $t1, $t1, 1
	daddi $t5, $t5, 8
	j lazo
fin:	halt