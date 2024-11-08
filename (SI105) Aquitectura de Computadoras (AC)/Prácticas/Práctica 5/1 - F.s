	.data
CONTROL: .word 	0x10000
DATA: .word 	0x10008
text2: .asciiz "Ingrese el exponente:"
text3: .asciiz "Resultado:"
NUM1:	.word	2
NUM2:	.word	3
exponente:	.word	0
result: .word   0

.code
ld $s0, CONTROL($zero)
ld $s1, DATA($zero)

daddi $t2, $zero, text2		#ingrese el exponente
sd $t2, 0($s1)
daddi $t2, $zero, 4
sd $t2, 0($s0)

daddi $t2, $zero, 8
sd $t2, 0($s0)
ld $t2, 0($s1)
sd $t2, exponente($zero)

ld $a0, NUM1($zero)
ld $a1, exponente($zero)
jal potencia

dadd $t3, $0, $v0

ld $a0, NUM2($zero)
ld $a1, exponente($zero)
jal potencia

dadd $t3, $t3, $v0

sd $t3, result($zero)

daddi $t2, $zero, text3		#resultado
sd $t2, 0($s1)
daddi $t2, $zero, 4
sd $t2, 0($s0)

ld $t2, result($zero)
sd $t2, 0($s1)
daddi $t2, $zero, 2
sd $t2, 0($s0)
halt

potencia: daddi $v0, $zero, 1
lazo:     beqz $a1, terminar
          daddi $a1, $a1, -1
          dmul $v0, $v0, $a0
          j lazo
terminar: jr $ra
