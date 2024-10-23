	.data
CONTROL:  .word	   0x10000
DATA:	  .word	   0x10008

text1:	.asciiz	  "Ingrese una clave de 4 digitos: \n"
text2:	.asciiz	  "Clave correcta: acceso permitido \n"
text3:	.asciiz	  "Clave incorrecta \n"
clave:	.asciiz	  "1234"
clavei: .asciiz   "    "

	.code
	ld $t0, CONTROL($zero)
	ld $t1, DATA($zero)

inicio:	daddi $t2, $zero, text1
	sd $t2, 0($t1)

	daddi $t2, $zero, 4
	sd $t2, 0($t0)

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

correcta:   daddi $t2, $zero, text2
	    sd $t2, 0 ($t1)

	    daddi $t2, $zero, 4
	    sd $t2, 0($t0)
	    j fin

incorrecta: daddi $t2, $zero, text3
	    sd $t2, 0($t1)

	    daddi $t2, $zero, 4
	    sd $t2, 0($t0)
            j inicio

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

fin:	    halt