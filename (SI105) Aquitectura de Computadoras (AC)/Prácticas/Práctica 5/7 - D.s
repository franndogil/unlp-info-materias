#longitud

.data
control: .word	0x10000
data:	.word	0x10008
cad:	.asciiz	"HolaMundo"
car:	.asciiz	"a"
str: 	.asciiz "aeiouAEIOU"

.code
daddi $sp, $0, 0x400	#Inicializo la pila
ld $s0, control($zero)
ld $s1, data($zero)
daddi $a2, $zero, cad

jal cant_vocales

dadd $t2, $zero, $v1
sd $t2, 0($s1)
daddi $t2, $zero, 2
sd $t2, 0($s0)

halt

cant_vocales: daddi $sp, $sp, -8	#PUSH DIR RET
	sd $ra, 0($sp)

	dadd $t3, $zero, $a2 	#copio la direccion de inicio de la cadena
loop1:	lb $a1, 0($t3)
 	beqz $a1, salir1

	daddi $sp, $sp, -8	#PUSH DIR CADENA
	sd $t3, 0($sp)

	jal es_vocal
	beqz $v0, no_es1
	daddi $v1, $v1, 1

no_es1: ld $t3, 0($sp)	#POP DIR CADENA
	daddi $sp, $sp, 8
	daddi $t3, $t3, 1
	j loop1

salir1:	ld $ra, 0($sp)	#POP DIR RET
	daddi $sp, $sp, 8
	jr $ra

es_vocal: daddi $sp, $sp, -8	#PUSH DIR RET
	  sd $ra, 0($sp)

	  daddi $a0, $zero, str
	  jal contiene
	  beqz $v0, no_es2

	  daddi $v1, $zero, 1
	  j salir2

no_es2:	  dadd $v0, $zero, $zero

salir2:	  ld $ra, 0($sp)	#POP DIR RET
	  daddi $sp, $sp, 8
	  jr $ra

contiene: dadd $v0, $zero, $zero 
	dadd $t2, $zero, $a0 	#copio la direccion de inicio de la cadena
loop2:	lb $a0, 0($t2)
 	beqz $a0, fin
	beq $a0, $a1, siEsta
	daddi $t2, $t2, 1
	j loop2
siEsta:	daddi $v0, $zero, 1
	daddi $t2, $t2, 1
	j loop2
fin:	jr $ra