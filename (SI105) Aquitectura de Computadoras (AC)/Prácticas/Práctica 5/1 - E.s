	.data
CONTROL: .word 	0x10000
DATA: .word 	0x10008
text1: .asciiz "Ingrese la base: \n"
text2: .asciiz "Ingrese el exponente: \n"
text3: .asciiz "Resultado: \n"
result: .word 0

.code
ld $t0, CONTROL($zero)
ld $t1, DATA($zero)

daddi $t2, $zero, text1		#ingrese la base
sd $t2, 0($t1)
daddi $t2, $zero, 4
sd $t2, 0($t0)

daddi $t2, $zero, 8
sd $t2, 0($t0)
ld $a0, 0($t1)

daddi $t2, $zero, text2		#ingrese el exponente
sd $t2, 0($t1)
daddi $t2, $zero, 4
sd $t2, 0($t0)

daddi $t2, $zero, 8
sd $t2, 0($t0)
ld $a1, 0($t1)

jal potencia
sd $v0, result($zero)

daddi $t2, $zero, text3		#resultado
sd $t2, 0($t1)
daddi $t2, $zero, 4
sd $t2, 0($t0)

dadd $t2, $zero, $v0
sd $t2, 0($t1)
daddi $t2, $zero, 2
sd $t2, 0($t0)



halt

potencia: daddi $v0, $zero, 1
lazo:     beqz $a1, terminar
          daddi $a1, $a1, -1
          dmul $v0, $v0, $a0
          j lazo
terminar: jr $ra
