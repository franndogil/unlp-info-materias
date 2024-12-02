.data
CONTROL:	.word	0x10000
DATA:		.word	0x10008
amarillo:	.byte	255, 255, 0, 0
celeste:	.byte	0, 255, 255, 0

.code
ld $s0, CONTROL ($0)
ld $s1, DATA ($0)
jal pintar_abajo
jal pintar_arriba
jal pintar_sol
halt

pintar_abajo:  	lwu $s2, celeste($0)
 	      	sw $s2, 0($s1)		#cargo el color en data
	      	daddi $t0, $0, 49
	      	daddi $t1, $0, 15
	      	daddi $t3, $0, -1
lazo1:	      	daddi $t2, $0, -1
	      	beq $t3, $t1, fin1
	      	daddi $t3, $t3, 1
lazo2:	      	beq $t2, $t0, lazo1
	      	daddi $t2, $t2, 1
					#cargo en data las coordenadas
 	      	sb $t2, 5($s1)
 	      	sb $t3, 4($s1)

		daddi $t5, $0, 5	#envio la muestra en terminal a control
		sd $t5, 0($s0)
		j lazo2
	      
fin1:	      	jr $ra	#vuelvo al programa principal

pintar_arriba:  lwu $s2, celeste($0)
 	      	sw $s2, 0($s1)		#cargo el color en data
	      	daddi $t0, $0, 49
	      	daddi $t1, $0, 49
	      	daddi $t3, $0, 33
lazo3:	      	daddi $t2, $0, -1
	      	beq $t3, $t1, fin2
	      	daddi $t3, $t3, 1
lazo4:	      	beq $t2, $t0, lazo3
	      	daddi $t2, $t2, 1
					#cargo en data las coordenadas
 	      	sb $t2, 5($s1)
 	      	sb $t3, 4($s1)

		daddi $t5, $0, 5	#envio la muestra en terminal a control
		sd $t5, 0($s0)
		j lazo4
	      
fin2:	      	jr $ra	#vuelvo al programa principal

pintar_sol:	daddi $t0, $0, 4
		daddi $t1, $0, 20
		daddi $t2, $0, 24
		lwu $s2, amarillo($0)
 	      	sw $s2, 0($s1)		#cargo el color en data
lazo5:		beqz 
lazo6:		sb $t1, 5($s1)
		sb $t2, 4($s1)
		daddi $t5, $0, 5	#envio la muestra en terminal a control
		sd $t5, 0($s0)

fin3:		jr $ra	#vuelvo al programa principal