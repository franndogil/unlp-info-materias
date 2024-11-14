.code
daddi $t2, $0, 15
dadd $t9, $0, $0
lazo: daddi $t2, $t2, -3
slti $t8, $t2, 12
beqz $t8, lazo
dadd $t9, $t9, $t2
halt

#CON DELAY SLOT DESACTIVADO: $t9 = 9 (EN BASE 10)
#CON DELAY SLOT ACTIVADO: $t9 = 21 (EN BASE 10)