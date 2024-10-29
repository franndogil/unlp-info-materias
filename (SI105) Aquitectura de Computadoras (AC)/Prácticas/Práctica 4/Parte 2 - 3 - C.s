	.data
CONTROL:  .word	   0x10000
DATA:	  .word	   0x10008
SUMA:	  .asciiz  "+"
RESTA:	  .asciiz  "-"
MULTI:	  .asciiz  "*"
DIV:	  .asciiz  "/"
TEXT1:	  .asciiz  "Ingrese el primer numero: \n"
TEXT2:    .asciiz  "Resultado: \n "
TEXT3:	  .asciiz  "Ingrese la operacion: \n"
TEXT4:	  .asciiz  "Ingrese un numero: \n"
SALTO:	  .asciiz  "\n"
	.code
ld $t0, CONTROL($zero)
ld $t1, DATA($zero)

daddi $t2, $zero, TEXT1
sd $t2, 0($t1)
daddi $t2, $zero, 4
sd $t2, 0($t0)

daddi $t2, $zero, 8
sd $t2, 0($t0)
ld $t3, 0($t1)	#ingreso del primer numero
dadd $t6, $zero, $t3

LAZO:   
	daddi $t2, $zero, TEXT3
	sd $t2, 0($t1)
	daddi $t2, $zero, 4	#para imprimir en terminal
	sd $t2, 0($t0)
 
	daddi $t2, $zero, 9
	sd $t2, 0($t0)
	ld $t5, 0($t1)	#caracter

daddi $t2, $zero, TEXT4
sd $t2, 0($t1)
daddi $t2, $zero, 4
sd $t2, 0($t0)

daddi $t2, $zero, 8
sd $t2, 0($t0)	
ld $t4, 0($t1)	#ingreso del segundo numero

lbu $t7, SUMA($zero)
beq $t5, $t7, SUMAR

lbu $t7, RESTA($zero)
beq $t5, $t7, RESTAR

lbu $t7, MULTI($zero)
beq $t5, $t7, MULTIPLICAR

lbu $t7, DIV($zero)
beq $t5, $t7, DIVIDIR

j FIN

SUMAR:  dadd $t6, $t6, $t4
	j MUESTRA

RESTAR:  dsub $t6, $t6, $t4
	j MUESTRA

MULTIPLICAR:  dmul $t6, $t6, $t4
	j MUESTRA

DIVIDIR:  ddiv $t6, $t6, $t4
	j MUESTRA

MUESTRA: daddi $t2, $zero, TEXT2
	sd $t2, 0($t1)
	daddi $t2, $zero, 4
	sd $t2, 0($t0)

	sd $t6, 0($t1)
 	daddi $t2, $zero, 2
 	sd $t2, 0($t0)
	j LAZO

FIN: halt