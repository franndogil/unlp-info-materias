	.data
CONTROL:  .word	   0x10000
DATA:	  .word	   0x10008
	.code
ld $t0, CONTROL($zero)
ld $t1, DATA($zero)

daddi $t2, $zero, 8
sd $t2, 0($t0)
ld $t3, 0($t1)

sd $t2, 0($t0)
ld $t4, 0($t1)

dadd $t5, $t3, $t4
sd $t5, 0($t1)

daddi $t2, $zero, 2
sd $t2, 0($t0)
halt