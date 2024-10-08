	.data
N:	.byte	7
CANT:	.byte	0
F:	.byte	0

	.code
ld $t0, N($zero)
ld $t1, CANT($zero)
dadd $ti, $t0, $zero	#guardo 7 en cant
dadd $t3, $t1, $zero
lazo: 	bnez $t1, fin
	daddi $t1, $t1, -1
	dmul $t3, $t3, $t1
	j lazo
fin:	sd $t3, F($zero)
	halt