.text
	main:
		addi t0, zero, 5
		jal ra, jumpTest
		addi t1, zero, 10
		jal t6, jumpTest2
		addi t4, zero, 25
	jumpTest:
		addi t2, zero, 15
		jalr ra
	jumpTest2:
		addi t3, zero, 20
		jalr ra
		
		
		
