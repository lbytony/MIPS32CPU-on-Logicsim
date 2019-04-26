ori $t1,0x1 	#t1:1
ori $t2,0x2	#t2:2
addu $t3,$t1,$t2 	#t3:3
subu $t4,$t2,$t1 	#t4:1
beq $t1,$t3,j1 	#不跳
lui $t5,0x1000 	#mars首地址
ori $s1,$t5,0x8 	#地址0x10000008
j1: beq $t1,$t4,j2 	#跳
addu $t1,$t1,$t1 	#不执行
j2: sw $t3,0x0($s1)	#0x1000008 存 3
lw $s2,0x4($s1)	#取到s2
subu $t3,$t3,$t1	#减1
beq $t3,$0,j3	#至0跳出
j j2
j3: lui $s7,0xffff	#s7:ffff0000
ori $s7,0xff	#s7:ffff00ff
subu $s7, $t2, $t1	#s7:1
ori $s7, $s7, 0x100	#s7:00000101
lui $s7, 0x101	#s7:01010000
subu $s7, $s7, $t1	#s7:0100fff