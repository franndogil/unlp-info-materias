.data
A: .word 1
B: .word 1000
C: .word 0
.code
ld $t1, A($0)
ld $t2, B($0)
loop: daddi $t2, $t2,-1 	#ALT. ESTA LINEA POR
dsll $t1, $t1, 1		#ESTA LINEA
bnez $t2, loop
sd $t1, C($0)
halt

#B = 3		/	B = 1000
#CPI = 1,538	/	CPI = 1,334
#    DISMINUYÓ LA CANTIDAD DE CPI