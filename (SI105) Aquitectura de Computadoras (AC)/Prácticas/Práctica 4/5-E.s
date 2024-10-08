	.data
A:	.byte	5
B:	.byte	0

	.code
	ld $t0, A($zero)
	andi $t0, $t0, 1
	beqz $t0, ES_PAR
	j ES_IMPAR
ES_PAR: dadd $t1, $zero, $zero
	daddi $t1, $t1, 0
	j FIN
ES_IMPAR: dadd $t1, $zero, $zero
	daddi $t1, $t1, 1
FIN:	sd $t1, B($zero)
halt