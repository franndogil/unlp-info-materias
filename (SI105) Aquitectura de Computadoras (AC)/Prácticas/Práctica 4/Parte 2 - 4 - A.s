	.data
TEXT1:	.asciiz	  "Ingrese la coordenada X: \n"
TEXT2:	.asciiz	  "Ingrese la coordenada Y: \n"
coorX:	.byte 0
coorY:	.byte 0
color:  .byte 255, 0, 255, 0
CONTROL:  .word   0x10000
DATA:     .word   0x10008

 .code
ld $t0,CONTROL($zero) 		#$t0=direccióndeCONTROL
ld $t1,DATA($zero) 		#$t1=direccióndeDATA

daddi $t2, $zero, TEXT1
sd $t2, 0($t1)
daddi $t2, $zero, 4
sd $t2, 0($t0)

daddi $t2, $zero, 8
sd $t2, 0($t0)
ld $t3, 0($t1)
sd $t3, coorX($zero)

daddi $t2, $zero, TEXT2
sd $t2, 0($t1)
daddi $t2, $zero, 4
sd $t2, 0($t0)

daddi $t2, $zero, 8
sd $t2, 0($t0)
ld $t3, 0($t1)
sd $t3, coorY($zero)

lwu $t2,color($zero) 		#$t2 = valor de color a pintar(4bytes)
sw $t2,0($t1) 			#DATA recibe el valor del color a pintar
lbu $t2,coorX($zero) 		#$t2 = valor de coordenada X
sb $t2,5($t1) 			#DATA+5 recibe el valor de coordenada X
lbu $t2,coorY($zero) 		#$t2= valor de coordenada Y
sb $t2,4($t1) 			#DATA+4 recibe el valor de coordenada Y

daddi $t2,$zero,5 		#$t2=5 función 5: salida gráfca
sd $t2,0($t0) 			#CONTROL recibe 5 y produce el dibujo del punto
halt