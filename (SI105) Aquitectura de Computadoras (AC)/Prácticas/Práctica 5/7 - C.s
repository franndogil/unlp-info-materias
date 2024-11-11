#longitud

.data
control: .word	0x10000
data:	.word	0x10008
car:	.asciiz	"A"
str: 	.asciiz "aeiouAEIOU"

.code
daddi $sp, $0, 0x400	#Inicializo la pila
ld $s0, control($zero)
ld $s1, data($zero)
ld $a1, car($zero)

jal es_vocal

dadd $t2, $zero, $v0
sd $t2, 0($s1)
daddi $t2, $zero, 2
sd $t2, 0($s0)

halt

es_vocal: daddi $sp, $sp, -8	#PUSH DIR RET
	  sd $ra, 0($sp)

	  daddi $a0, $zero, str
	  jal contiene
	  beqz $v0, no_es

	  daddi $v1, $zero, 1
	  j salir

no_es:	  dadd $v0, $zero, $zero

salir:	  ld $ra, 0($sp)	#POP DIR RET
	  daddi $sp, $sp, 8
	  jr $ra

contiene: dadd $v0, $zero, $zero 
	dadd $t2, $zero, $a0 	#copio la direccion de inicio de la cadena
loop:	lb $a0, 0($t2)
 	beqz $a0, fin
	beq $a0, $a1, siEsta
	daddi $t2, $t2, 1
	j loop
siEsta:	daddi $v0, $zero, 1
	daddi $t2, $t2, 1
	j loop
fin:	jr $ra