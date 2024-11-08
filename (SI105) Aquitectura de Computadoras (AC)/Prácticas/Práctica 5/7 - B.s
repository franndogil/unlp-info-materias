#longitud

.data
control: .word	0x10000
data:	.word	0x10008
cadena:	.asciiz	"Hola"
car:	.asciiz	"o"

.code
ld $s0, control($zero)
ld $s1, data($zero)
daddi $a0, $zero, cadena
ld $a1, car($zero)

jal contiene

dadd $t2, $zero, $v0
sd $t2, 0($s1)
daddi $t2, $zero, 2
sd $t2, 0($s0)

halt

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
fin: 	jr $ra