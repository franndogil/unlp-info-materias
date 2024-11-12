;Resto: Calcula en $t4 el resto
;de $t1 div $t2
.code
daddi $t1, $0, 30 ;a=30
daddi $t2, $0, 4 ;b=4
ddiv $t3, $t1, $t2 ;c=adivb=7
dmul $t3, $t3, $t3 ;cb=7*4=28
dsub $t4, $t1, $t3 ;resto=acb=2
halt