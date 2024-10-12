	.data
datos:	.byte	-2, 2, 2, 2, 2, 2
	
	.code
	ld $t1, datos($zero)
	lb $t2, datos($zero)
	lbu $t3, datos($zero)
	halt

#pregunta n1:
#el registro $t2 tendría el valor correcto (instruccion lb).

#pregunta n2:
#parar cargar un ascii que siempre es positivo podria usar la instruccion lbu.