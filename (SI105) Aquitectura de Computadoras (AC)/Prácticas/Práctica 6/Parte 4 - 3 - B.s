;factorial: Calcula en $t2
;el factorial de $t1
.code
daddi $t1, $0, 5 ;n=5
daddi $t2, $0, 1 ;f=1
loop: dmul $t2, $t2, $t1 ;f=fn
daddi $t1, $t1, -1 ;n=n-1
bnez $t1, loop
halt