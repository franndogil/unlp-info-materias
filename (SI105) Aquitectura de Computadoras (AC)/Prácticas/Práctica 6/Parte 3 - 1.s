.data
A: .word 1
B: .word 3
C: .word 0
.code
ld $t1, A($0)
ld $t2, B($0)
loop: daddi $t2, $t2,-1 
dsll $t1, $t1, 1		
bnez $t2, loop
sd $t1, C($0)
halt

#B = 3 / BTS = 2 / CPI = 1,538

#B = 1000 / BTS = 999 / CPI = 1,334

#2) Al ejecutar un loop simple con N iteraciones se producen 2 (DOS) atascos BTS.
#3) Los atascos BTS se producen cuando empezamos a ejecutar una instruccion que no debiamos ejecutar.
#4) Pueden evitarse los BTS reordenando instrucciones a través de la técnica Delay Slot.
#5) Las instrucciones descartadas no cuentan para el calculo del CPI.
