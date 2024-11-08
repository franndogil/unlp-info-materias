#En este ejercicio solo debemos salvar la direccion de retorno de la subrutina "espar".
#No debemos salvar el registro $s0 debido a que no se usa en la subrutina interna "esimpar"

#ANTES
#v0 devuelve 1 si $a0 es impar y 0 de lo contrario
#a0 número entero cualquiera

esimpar:andi $v0, $a0, 1
	jr $ra

#v0 devuelve 1 si $a0 es par y 0 de lo contrario
#a0 número entero cualquiera

espar:	jal esimpar
#truco:	espar = 1 - esimpar
	daddi $s0, $0, 1
	dsub $v0, $s0, $v0
	jr $ra

#DESPUES
#v0 devuelve 1 si $a0 es impar y 0 de lo contrario
#a0 número entero cualquiera

esimpar:andi $v0, $a0, 1
	jr $ra

#v0 devuelve 1 si $a0 es par y 0 de lo contrario
#a0 número entero cualquiera

espar:	daddi $sp, $sp, -8	#REALIZO UN PUSH DE LA DIRECCION DE RETORNO
	sd $ra, 0($sp)	
	
	jal esimpar
#truco:	espar = 1 - esimpar
	daddi $s0, $0, 1
	dsub $v0, $s0, $v0

	ld $ra, 0($sp)		#REALIZO UN POP DE LA DIRECCION DE RETORNO
	daddi $sp, $sp, 8
	jr $ra