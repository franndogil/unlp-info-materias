	.data
CONTROL:  .word	   0x10000
DATA:	  .word	   0x10008
TEXT1:	.asciiz	  "Ingrese la base: \n"
TEXT2:	.asciiz	  "Ingrese la altura: \n"
TEXT3:	.asciiz	  "Resultado: \n"
A:	.byte	0
B:	.byte	0
SUPER:	.byte	0

	.code
ld $t0, CONTROL($zero)
ld $t1, DATA($zero)

daddi $t2, $zero, TEXT1
sd $t2, 0($t1)
daddi $t2, $zero, 4
sd $t2, 0($t0)

daddi $t2, $zero, 8
sd $t2, 0($t0)
ld $t3, 0($t1)

daddi $t2, $zero, TEXT2
sd $t2, 0($t1)
daddi $t2, $zero, 4
sd $t2, 0($t0)

daddi $t2, $zero, 8
sd $t2, 0($t0)
ld $t4, 0($t1)

dmul $t5, $t4, $t3
daddi $t6, $zero, 2
ddiv $t5, $t5, $t6

sd $t5, SUPER($zero)
sd $t3, A($zero)
sd $t4, B($zero)

daddi $t2, $zero, TEXT3
sd $t2, 0($t1)
daddi $t2, $zero, 4
sd $t2, 0($t0)

dadd $t2, $zero, $t5
sd $t2, 0($t1)
daddi $t2, $zero, 2
sd $t2, 0($t0)

halt