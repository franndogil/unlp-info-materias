	.data
A: 	.word 2, 1, 3, 1, 4, 1
MAX: 	.word -1

	.code
	ld $t1, MAX($0)
	daddi $t2, $0, 0
	daddi $t3, $0, 6 
	ld $t4, A($t2)

	loop:	slt $t5, $t1, $t4
		beqz $t5, chico

		daddi $t1, $t4, 0

	chico:  daddi $t2, $t2, 8
		daddi $t3, $t3, -1
		bnez $t3, loop
		ld $t4, A($t2)		#----> pase la carga al final para siempre ejecutarla
	
		sd $t1, MAX($0)
	halt
