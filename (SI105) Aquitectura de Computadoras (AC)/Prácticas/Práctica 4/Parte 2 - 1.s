	.data
texto:	.asciiz	   "Hola mundo"
CONTROL:  .word	   0x10000
DATA:	  .word	   0x10008

	.code
ld $t0, CONTROL($zero)
ld $t1, DATA($zero)
daddi	$t2, $zero, texto
sd  $t2, 0($t1)
daddi $t4, $zero, 10


lazo: beq $t3, $t4, fin
      daddi $t3, $t3, 1
      daddi $t2, $zero, 4
      sd $t2, 0($t0)
      j lazo
fin:  halt

#a) el registro t0 guarda 10000 y el registro t1 guarda 10008
#