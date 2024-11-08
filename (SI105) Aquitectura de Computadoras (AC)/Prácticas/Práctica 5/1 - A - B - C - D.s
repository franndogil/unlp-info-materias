.data
base: .word 5
exponente: .word 4
result: .word 0

.code
ld $a1, exponente($zero)
ld $a0, base($zero)
jal potencia
sd $v0, result($zero)
halt

potencia: daddi $v0, $zero, 1
lazo:     beqz $a1, terminar
          daddi $a1, $a1, -1
          dmul $v0, $v0, $a0
          j lazo
terminar: jr $ra


#A) El programa se encarga de multiplicar el numero 5 por 5, las veces que el exponente lo indique (igual a mi me funca mal XD)
#B) La instruccion jal llama a la subrutina y la instruccion jr retorna a donde lo indique el registro $ra
#C) En el registro $ra se guarda la direccion de retorno (return address)
#D) Deberiamos guardar en el $sp la direccion actual de retorno $ra (al programa principal) antes de meternos en la nueva subrutina.