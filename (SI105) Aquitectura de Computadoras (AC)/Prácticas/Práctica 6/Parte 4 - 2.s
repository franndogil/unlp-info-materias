.code
dmul $t1, $0, $0
nop
nop
nop
nop
nop
dadd $t2, $0, $0
halt

#A)
#El atasco sucede entre las instrucciones dmul $t1, $0, $0 y dadd $t2, $0, $0
#Se atasca la segunda instruccion porque la primera tiene prioridad (por oden de entrada).

#B)
#El atasco no se va a pesar de que agregue o elimine "nops".
#Todo esto ocurre porque la instruccion dmul fue la primera que entró, y hasta que esta no llegue a la etapa de MEM la instruccion DADD no puede "avanzar".
#Una vez que la instrucción dmul avanza se produce un atasco estructural y se termina cuando la instrccion dmul avanza a la etapa de WB (la instruccion dadd puede avanzar a la etama MEM)