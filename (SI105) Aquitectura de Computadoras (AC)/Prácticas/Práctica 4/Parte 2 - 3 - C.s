	.data
CONTROL:  .word	   0x10000
DATA:	  .word	   0x10008
SUMA:	  .asciiz  "+"
RESTA:	  .asciiz  "-"
MULTI:	  .asciiz  "*"
DIV:	  .asciiz  "/"
TEXT1:	  .asciiz  "Ingrese el primer numero: \n"
TEXT2:    .asciiz  "Resultado: "
SALTO:	  .asciiz  "\n"
	.code
ld $t0, CONTROL($zero)
ld $t1, DATA($zero)

daddi $t2, $zero, 8

sd $t2, 0($t0)
ld $t3, 0($t1)	#num1

daddi $t2, $zero, 9
sd $t2, 0($t0)
ld $t5, 0($t1)	#caracter

daddi $t2, $zero, 8
sd $t2, 0($t0)	
ld $t4, 0($t1)	#num2

lbu $t7, SUMA($zero)
beq $t5, $t7, SUMAR

lbu $t7, RESTA($zero)
beq $t5, $t7, RESTAR

lbu $t7, MULTI($zero)
beq $t5, $t7, MULTIPLICAR

lbu $t7, DIV($zero)
beq $t5, $t7, DIVIDIR

j FIN

SUMAR:  dadd $t6, $t3, $t4
	j MUESTRA

RESTAR:  dsub $t6, $t3, $t4
	j MUESTRA

MULTIPLICAR:  dmul $t6, $t3, $t4
	j MUESTRA

DIVIDIR:  ddiv $t6, $t3, $t4
	j MUESTRA

MUESTRA: sd $t6, 0($t1)
	 daddi $t2, $zero, 2
	 sd $t2, 0($t0)
	 j FIN

FIN: halt