.data
valor: .word 5
.code
ld $t1, valor ($0)
dadd $t2, $t3, $t4
dmul $t5, $t6, $t7
sd $t8, valor ($0)
halt