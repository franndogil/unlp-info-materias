	.data
v:	.word	5, 2, 6
res:	.byte	0

	.code
	dadd $t2, $zero, $zero
	ld $t0, v($t2)
	dadd $t4, $t4, $t0
	daddi $t2, $t2, 8
	ld $t0, v($t2)
	dadd $t4, $t4, $t0
	daddi $t2, $t2, 8
	ld $t0, v($t2)
	dadd $t4, $t4, $t0
	sd $t4, res($zero)
	halt