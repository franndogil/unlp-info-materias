.data
base:	.word	5
exp:	.word	4
res:	.word	0
.code

#INICIALIZO SP
daddi $sp, $0, 0x400

#CARGO PARA ENVIAR POR REFERENCIA
daddi $a0, $zero, base
daddi $t1, $zero, exp

#PUSHH (CON DIRECCIONES)	(ENVIO DIRECCIONES)
daddi $sp, $sp, -8
sd $a0, 0($sp)

daddi $sp, $sp, -8
sd $a1, 0($sp)

jal potencia
sd $v0, res($zero)
halt

potencia: daddi $v0, $zero, 1
	  #POPP (CON DIRECCIONES)	(ALMACENO DIRECCIONES)
	  ld $t2, 0($sp)
	  daddi $sp, $sp, 8	#POP EXP
	  
	  ld $t3, 0($sp)
	  daddi $sp, $sp, 8	#POP BASE
	  	
	  ld $t1, 0($t2)	#(CARGO LOS VALORES DE LAS DIRECCIONES ALMACENADAS EN $t1 y $t0)
	  ld $t0, 0($t3)

lazo:     beqz $t1, terminar
          daddi $t1, $t1, -1
          dmul $v0, $v0, $t0
          j lazo
terminar: jr $ra