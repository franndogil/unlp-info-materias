	.data
v:	.word	0, 2, 10, 7, 3, 4, 6, 5, 9, 8
	
#modificar valores

	.code
	daddi $t4, $t4, 2
	daddi $t2, $t2, 10
lazo:	beq $t1, $t2, fin
	ld $t0, v($t3)
	dmul $t0, $t0, $t4
	sd $t0, v($t3)
	daddi $t3, $t3, 8
	daddi $t1, $t1, 1
	j lazo
fin:	halt