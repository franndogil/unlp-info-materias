.data
vec1: .word 5, 4, 1
vec2: .word 0

.code
daddi $t1, $0, 3
daddi $t0, $0, 0
loop: ld $t2, vec1($t0)
daddi $t1, $t1, -1
sd $t2, vec2($t0)
daddi $t0, $t0, 8
bnez $t1, loop
halt