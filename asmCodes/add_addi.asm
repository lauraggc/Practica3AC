.text
main:
	nop
	addi t0, zero, 1
	addi t0, t0, 1
	
	and t3, zero, zero
	addi t1, zero, 2
	and t4, zero, zero
	
	add  t2, t1, t0
	add  t1, t1, t2
	
	add  t2, t1, t2
	add  t1, t2, t2

	add  t2, t1, t2
	add  t2, t2, t1	
	
