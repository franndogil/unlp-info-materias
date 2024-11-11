.data
A: .word 1
B: .word 3
C: .word 0
.code
ld $t1, A($0)
ld $t2, B($0)
loop: dsll $t1, $t1, 1
daddi $t2, $t2,-1
bnez $t2, loop
sd $t1, C($0)
halt

#Las instrucciones que generan atascos raw son:
#dsll $t1, $t1, 1
#daddi $t2, $t2,-1
#bnez $t2, loop

#Las tres son por el mismo problema: quieren operar con valores que todavía no estan alojados en los registros (no llegaron a la etapa WB) y se produce un atasco.

#El primer atasco se produce en la etapa ID y dura 1 ciclo.
#El segundo atasco se produce en la etapa ID y dura 1 ciclo (por tres vueltas del loop)
#El tercer atasco se produce en la etapa ID y dura 1 ciclo (por tres vueltas del loop)

#ATASCOS RAW: 7
#CPI: 2.0

#CON B = 1000

#RAW: 2001
#CPI: 2.0

#La cantidad de CPI se mantuvo
