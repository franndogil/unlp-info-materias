.data
base:	.word	5
exp:	.word	4
res:	.word	0
.code
daddi	$a0, $0, base
daddi	$a1, $0, exp
jal potencia
sd $v0, res($zero)
halt

potencia: daddi $v0, $zero, 1
	  ld $t0, 0($a0)
	  ld $t1, 0($a1)
lazo:     beqz $t1, terminar
          daddi $t1, $t1, -1
          dmul $v0, $v0, $t0
          j lazo
terminar: jr $ra