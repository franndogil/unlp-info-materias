.code
daddi $a0, $0, tabla
jal subrutina
	daddi $t0, $0, 10
	daddi $t1, $0, 0
loop: 	bnez $t0, fin
	ld $t2, 0($a0)
	dadd $t1, $t1, $t2
	daddi $t0, $t0, -1
	dadd $a0, $a0, 8
	j loop
fin:halt

#Se utiliza el registro $a0 (este esta reservado para el pasaje de parametros a la subrutina) luego de haber terminado la subrutina.

#correccion:
.code
daddi $a0, $0, tabla
jal subrutina
	daddi $t0, $0, 10
	daddi $t1, $0, 0
	dadd $t3, $zero, $zero
loop: 	bnez $t0, fin
	ld $t2, tabla($t3)
	dadd $t1, $t1, $t2
	daddi $t0, $t0, -1
	dadd $t3, $t3, 8
	j loop
fin:halt