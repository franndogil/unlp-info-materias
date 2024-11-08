
.code
daddi $t0, $0, 5
daddi $t1, $0, 7
jal subrutina
sd $t2, variable($0)
halt
subrutina: daddi $t4, $0, 2
	   dmul $t0, $t0, $t4
	   dmul $t1, $t1, $t4
	   dadd $t2, $t1, $t0
	   jr $ra

#Envia parametros a la subrutina por registros temporales y los devuelve por registros temporales. Eso esta mal
#Para solucionar esto debemos reemplazar estos registros por los registros $a0-$a3 y $v0-$v1

.code
daddi $a0, $0, 5
daddi $a1, $0, 7
jal subrutina
sd $v0, variable($0)
halt

subrutina: daddi $t4, $0, 2
	   dmul $a0, at0, $t4
	   dmul $a1, $a1, $t4
	   dadd $v0, $a1, $a0
	   jr $ra