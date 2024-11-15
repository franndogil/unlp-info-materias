.data
TEXT1:	.asciiz	"Ingrese un numero entre el 0 y el 9: "
TEXT2:	.asciiz	"Debe ingresar un numero."
TEXT3: 	.asciiz "Cantidad de valores impares:"
CONTROL:	.word	0x10000
DATA:	.word	0x10008
NUMEROS: .word	0
.code
ld $s0, CONTROL($zero)
ld $s1, DATA($zero)

dadd $s2, $0, $0
dadd $s6, $0, $0
dadd $s7, $0, $0

lazo: 	slti $t0, $s7, 9
	beqz $t0, fin_lazo
	jal ingresar_numero
	beqz $v0, lazo
	daddi $s2, $s2, 1
	dadd $s7, $s7, $v0
	sd $v0, NUMEROS($s6)
	daddi $s6, $s6, 8
	j lazo

fin_lazo: dadd $a1, $0, $s2
	daddi $a0, $0, NUMEROS	#equivale a un offset
	jal procesar_numeros

	daddi $t2, $0, TEXT3
	sd $t2, 0($s1)
	daddi $t2, $0, 4
	sd $t2, 0($s0)

	dadd $t2, $0, $v1
	sd $t2, 0($s1)
	daddi $t2, $0, 2
	sd $t2, 0($s0)

halt

ingresar_numero: daddi $t2, $0, TEXT1
		sd $t2, 0($s1)
		daddi $t2, $0, 4
		sd $t2, 0($s0)

		daddi $t2, $0, 8
		sd $t2, 0($s0)
		ld $s3, 0($s1)

		slti $s4, $s3, 10
		beqz $s4, no_es

		slti $s4, $s3, 1
		bnez $s4, no_es

		dadd $v0, $0, $s3
		
		dadd $t2, $0, $s3
		sd $t2, 0($s1)
		daddi $t2, $0, 2
		sd $t2, 0($s0)
		j fin

no_es:		daddi $t2, $0, TEXT2
		sd $t2, 0($s1)
		daddi $t2, $0, 4
		sd $t2, 0($s0)

		daddi $v0, $0, 0
fin:		jr $ra

procesar_numeros: dadd $v1, $0, $0
		dadd $t1, $0, $a0	#CARGO PUNTERO
lazo2:		beqz $a1, finrut
		daddi $a1, $a1, -1
		ld $t4, 0($t1)		#USO PUNTERO
		andi $t3, $t4, 1
		beqz $t3, espar
		daddi $v1, $v1, 1
espar:		daddi $t1, $t1, 8	#AVANZO EN PUNTERO
		j lazo2
finrut:	jr $ra



