	.data
CONTROL:  .word	   0x10000
DATA:	  .word	   0x10008
text1:	.asciiz	  "Ingrese una clave de 4 digitos( "
text2:	.asciiz	  "Clave correcta: acceso permitido \n"
text3:	.asciiz	  "Clave incorrecta \n"
text5: 	.asciiz	  " intentos restantes):  \n"
clave:	.asciiz	  "1234"
clavei: .asciiz   "    "

	.code
	ld $t0, CONTROL($zero)
	ld $t1, DATA($zero)
	daddi $t4, $zero, 4
	daddi $t7, $zero, 5 

inicio:	beqz $t7, fin_p

	daddi $t2, $zero, text1		#imprimo el texto 1
	sd $t2, 0($t1)
	daddi $t2, $zero, 4
	sd $t2, 0($t0)

	dadd $t2, $zero, $t7		#imprimo la cantidad de intentos
	sd $t2, 0($t1)
	daddi $t2, $zero, 2
	sd $t2, 0($t0)

	daddi $t2, $zero, text5		#imprimo el texto 5
	sd $t2, 0($t1)
	daddi $t2, $zero, 4
	sd $t2, 0($t0)

	dadd $t3, $zero, $zero
	daddi $t4, $zero, 4

carga:	beq $t3, $t4, fin_carga

	daddi $t2, $zero, 9
	sd $t2, 0($t0)

	ld $t5, 0($t1)
	sd $t5, clavei($t6)

	daddi $t3, $t3, 1
	daddi $t6, $t6, 8
	j carga

fin_carga: dadd $t3, $zero, $zero
	   dadd $t6, $zero, $zero

	   lbu $t4, clave($t3)
	   lbu $t5, clavei($t6)

	   beq $t4, $t5, sigue1
	   j incorrecta

sigue1:	    daddi $t3, $zero, 1
	    daddi $t6, $zero, 8
	    lbu $t4, clave($t3)
	    lbu $t5, clavei($t6)

	    beq $t4, $t5, sigue2
	    j incorrecta

sigue2:	    daddi $t3, $t3, 1
	    daddi $t6, $t6, 8
	    lbu $t4, clave($t3)
	    lbu $t5, clavei($t6)

	    beq $t4, $t5, sigue3
	    j incorrecta

sigue3:	    daddi $t3, $t3, 1
	    daddi $t6, $t6, 8
	    lbu $t4, clave($t3)
	    lbu $t5, clavei($t6)

	    beq $t4, $t5, correcta
	    j incorrecta


correcta:   daddi $t2, $zero, text2
	    sd $t2, 0 ($t1)

	    daddi $t2, $zero, 4
	    sd $t2, 0($t0)
	    j fin_p

incorrecta: daddi $t2, $zero, text3
	    sd $t2, 0($t1)

	    daddi $t2, $zero, 4
	    sd $t2, 0($t0)
		
            daddi $t7, $t7, -1
	    dadd $t3, $zero, $zero
            j inicio

fin_p:	    halt