	.data
cad:	.asciiz	"abcHfhFijdDlmDndSSSS"
cant:	.word	0

	.code
	dadd $t5, $zero, $zero
	dadd $t6, $zero, $zero
	dadd $t7, $zero, $zero
	daddi $t5, $t5, 65
	daddi $t6, $t6, 90
	daddi $t7, $t7, 1
	dadd $t4, $zero, $zero
	dadd $t0, $zero, $zero
lazo:	lbu $t1, cad($t0)
	beqz $t1, fin
	slt $t3, $t1, $t5
	beq $t3, $t7, no_es
	slt $t3, $t6, $t1
	beq $t3, $t7, no_es
	daddi $t4, $t4, 1
	daddi $t0, $t0, 1
	j lazo

no_es:	daddi $t0, $t0, 1
	j lazo

fin:	sd $t4, cant($zero)
	halt