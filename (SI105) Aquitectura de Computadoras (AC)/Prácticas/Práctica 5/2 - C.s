.code
daddi $a0, $0, 5
daddi $a1, $0, 7
jal subrutina
dmul $t2, $a0, $v0
sd $t2, variable($0)
halt

#Se utiliza el registro $a0 (este esta reservado para el pasaje de parametros a la subrutina) luego de haber terminado la subrutina.

#correccion:
.code
daddi $a0, $0, 5
daddi $a1, $0, 7
dadd $t3, $zero, 5
jal subrutina
dmul $t2, $t3, $v0
sd $t2, variable($0)
halt