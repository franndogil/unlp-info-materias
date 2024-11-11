.data
A: .word 1
B: .word 1000
C: .word 0
.code
ld $t1, A($0)
ld $t2, B($0)
loop: daddi $t2, $t2,-1 
dsll $t1, $t1, 1		
bnez $t2, loop
sd $t1, C($0)
halt

#1) CON BTB
# BTS = 2	/	CPI = 1,692
#2) BMS = 2
# Suceden porque el BTB le erró a la predicción (+1 BMS) y luego la corrigió (+1 BMS).
#3) BTS = 2 / BMS = 2 / CPI = 1,003 / B = 1000
#4) Al ejecutar un loop simple con N iteraciones, si se habilita el BTB, se producen 2 (DOS) atascos BTS y 2 (DOS) atascos tipo BMS.
#5) Es mejor utilizar el BTB ciando se realizan muchas iteraciones y los saltos no son cambiantes.