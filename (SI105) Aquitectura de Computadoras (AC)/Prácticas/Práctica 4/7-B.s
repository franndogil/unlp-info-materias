	.data
v:	.word	0, 2, 10, 7, 3, 4, 6, 5, 9, 8
max:	.byte	0
	
#calcular maximo

	.code
	daddi $t2, $t2, 10
lazo:	ld $t0, v($t6)
	beq $t1, $t2, fin
	slt $t5, $t0, $t4
	beqz $t5, es
	daddi $t1, $t1, 1
	daddi $t6, $t6, 8
	j lazo
es:	dadd $t4, $t0, $zero
	daddi $t1, $t1, 1
	daddi $t6, $t6, 8
	j lazo
fin: 	sd $t4, max($zero)
	halt