	.data
coorX:	.byte 0
coorY:	.byte 0
color:  .byte 0, 0, 255, 0 
CONTROL:  .word   0x10000
DATA:     .word   0x10008

 .code
 ld $t0,CONTROL($zero) 		#$t0=direccióndeCONTROL
 ld $t1,DATA($zero) 		#$t1=direccióndeDATA

 daddi $t4, $zero, 50


lazo: beqz $t4, fin
 lwu $t2,color($zero) 		#$t2 = valor de color a pintar(4bytes)
 sw $t2,0($t1) 			#DATA recibe el valor del color a pintar
 lbu $t2,coorX($zero) 		#$t2 = valor de coordenada X
 sb $t2,5($t1) 			#DATA+5 recibe el valor de coordenada X
 lbu $t2,coorY($zero) 		#$t2= valor de coordenada Y
 sb $t2,4($t1) 			#DATA+4 recibe el valor de coordenada Y

 daddi $t2,$zero,5 		#$t2=5 función 5: salida gráfca
 sd $t2,0($t0) 			#CONTROL recibe 5 y produce el dibujo del punto
 
 lbu $t2, coorY($zero)
 daddi $t2, $t2, 1
 sb $t2, coorY($zero)
 daddi $t4, $t4, -1

 j lazo
 fin: halt