	.data
coorX:	.byte 24 
coorY:	.byte 24 
color:  .byte 0, 0, 0, 0
CONTROL:  .word   0x10000
DATA:     .word   0x10008

 .code
 ld $t0,CONTROL($zero) 		#$t0=direccióndeCONTROL
 ld $t1,DATA($zero) 		#$t1=direccióndeDATA

 daddi $t5, $zero, 255
 dadd $t4, $zero, $zero

 lbu $t2,coorX($zero) 		#$t2 = valor de coordenada X
 sb $t2,5($t1) 			#DATA+5 recibe el valor de coordenada X

 lbu $t2,coorY($zero) 		#$t2= valor de coordenada Y
 sb $t2,4($t1) 			#DATA+4 recibe el valor de coordenada Y

 lazo: beqz $t5, fin

 lwu $t2, color($zero)
 dadd $t2, $zero, $t4
 sw $t2, color($zero) 
 sw $t2, 0($t1)

 daddi $t2, $zero, 5 		#$t2=5 función 5: salida gráfca
 sd $t2,0($t0) 			#CONTROL recibe 5 y produce el dibujo del punto

 daddi $t5, $t5, -1
 daddi $t4, $zero, 1

 j lazo

 fin: halt