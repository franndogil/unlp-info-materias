    .data
 A: .word 1
 B: .word 2
    .code
ld $t1, A($0)
ld $t2, B($0)
sd $t2, A($0)
sd $t1, B($0)
halt

#CON FORWARDING
#Atascos Raw: 0
#CPI: 1.8

#No se presenta ningun atraso porque con la opcion de "Forwarding Activado" adelantamos valos que vamos a utilizar a los buffers y ya no hay necesidad de esperar a las etapas MEM y WB
#El color en la ventana register indica una modificacion en ese registro.