	.data
A:	.byte	1
B:	.byte	4
S:	.byte	0
P:	.byte	0
D:	.byte	0

	.code
ld $t0, A($zero)
ld $t1, B($zero)

dadd	$t2, $t1, $t0
sd $t2, S($zero)
dmul	$t2, $t1, $t0
sd $t2, P($zero)
ddiv	$t2, $t1, $t0
sd $t2, D($zero)

halt