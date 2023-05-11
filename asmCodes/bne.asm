.text 
	main:
		addi t0, zero, 4
		addi t1, zero, 4
		addi t2, zero, 5
		beq t0, t1, branchTest
		addi a1, zero, 1
		sub t3, t2, t1
	
	branchTest:
		add a0, zero, t0

