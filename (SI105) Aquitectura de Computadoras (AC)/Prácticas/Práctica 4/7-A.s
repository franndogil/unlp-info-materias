	.data
v:	.word	0, 2, 10, 7, 3, 4, 6, 5, 9, 8
pos:	.byte	0
	
#contar positivos

	.code
	daddi $t1, $t1, 0
	daddi $t2, $t2, 10
lazo:	ld $t0, v($t5)
	beq $t1, $t2, fin
	andi $t0, $t0, 1
	beqz $t0, es_par
	daddi $t5, $t5, 8
	daddi $t1, $t1, 1
	j lazo
es_par: daddi $t3, $t3, 1
	daddi $t5, $t5, 8
	daddi $t1, $t1, 1
	j lazo
fin:	sd $t3, pos($zero)
	halt