.data
base:	.word	5
exp:	.word	4
res:	.word	0
.code

#INICIALIZO SP
daddi $sp, $0, 0x400

#CARGO PARA ENVIAR POR VALOR
ld $a0, base($zero)
ld $a1, exp($zero)

#PUSHH
daddi $sp, $sp, -8
sd $a0, 0($sp)

daddi $sp, $sp, -8
sd $a1, 0($sp)

jal potencia
sd $v0, res($zero)
halt

potencia: daddi $v0, $zero, 1
	  #POPP
	  ld $t1, 0($sp)
	  daddi $sp, $sp, 8
	  ld $t0, 0($sp)
	  daddi $sp, $sp, 8
lazo:     beqz $t1, terminar
          daddi $t1, $t1, -1
          dmul $v0, $v0, $t0
          j lazo
terminar: jr $ra