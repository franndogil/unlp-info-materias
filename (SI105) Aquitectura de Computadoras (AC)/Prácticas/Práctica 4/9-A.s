	.data
string:	.asciiz	"arquitectura de computadoras"
long:	.word	0

	.code
	dadd $t0, $zero, $zero
lazo:	lbu $t1, string($t0)
	beqz $t1, fin
	daddi $t0, $t0, 1
	j lazo
fin:	sd $t0, long($zero)
	halt