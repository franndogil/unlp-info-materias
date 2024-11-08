#v0 devuelve 1 si a0 es par y 0 dlc
#a0 número entero cualquiera
.code
daddi $sp, $0, 0x400	#Inicializamos el SP (SIEMPRE)	
daddi $t0, $0, 5
daddi $t1, $0, 8

daddi $sp, $sp, -8	#PUSH
sd $t0, 0($sp)
daddi $sp, $sp, -8
sd $t1, 0($sp)

ld $t0, 0($sp)		#POP
daddi $sp, $sp, 8
ld $t1, 0($sp)
daddi $sp, $sp, 8
halt