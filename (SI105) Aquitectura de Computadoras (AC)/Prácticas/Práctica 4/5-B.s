	.data
A:	.byte	1
B:	.byte	4
C:	.byte	0

	.code
ld $t0, A($zero)
ld $t1, B($zero)

dadd	$t2, $t1, $t0
sd $t2, C($zero)
halt