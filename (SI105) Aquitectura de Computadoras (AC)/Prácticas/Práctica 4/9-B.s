	.data
cad:	.asciiz	"abcdefdhijdlmnd"
car:	.ascii	"d"
cant:	.word	0

	.code
	dadd $t0, $zero, $zero
	dadd $t2, $zero, $zero
	dadd $t3, $zero, $zero
	lbu $t0, car($zero)
lazo:	lbu $t1, cad($t2)
	beqz $t1, fin
	beq $t1, $t0, si
	daddi $t2, $t2, 1
	j lazo

si:	daddi $t3, $t3, 1
	daddi $t2, $t2, 1
	j lazo

fin:	sd $t3, cant($zero)
	halt
	