.code
 dmul $t1, $0, $0
 dmul $t3, $t1, $t2
 dadd $t2, $0, $0
 halt

#WAR
#La instruccion lenta la segunda multiplicacion.
#Se esta escribiendo el registro $t1 mientras la segunda instruccion quiere leerlo.