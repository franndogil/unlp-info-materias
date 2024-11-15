.data
pos_x: .byte 24
pos_y: .byte 24
color_rojo: .byte 255, 0, 0, 255
color_azul: .byte 0, 0, 255, 255
control: .word32 0x10000
data: .word32 0x10008

.code
lwu $s6, control($0)
lwu $s7, data($0)
lbu $s0, pos_y($0)
lbu $s1, pos_y($0)
lbu $s2, pos_y($0)
lbu $s3, pos_y($0)
daddi $t8, $0, 1
seguir: sb $s0, 4($s7)
sb $s1, 5($s7)
beqz $t8, azul		#LINEA 1
daddi $t4, $s3, 0
j salto
azul: daddi $t4, $s3, 0
salto: sw $t4, 0($s7)		#LINEA 2
xori $t8, $t8, 1
daddi $t1, $0, 1
daddi $t1, $0, 5
sd $t1, 0($s6)
daddi $s0, $s0, 1
daddi $s1, $s1, 1
slti $t9, $s1, 50	#LINEA 3
bnez $t9, seguir
halt

#1) beqz $t8, azul
#2) sd $t4, 0($s7)
#3) slti $t9, $s1, 50