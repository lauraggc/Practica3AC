.data
	A: .word

.text
	main:
		add zero, zero, zero
		addi a0, zero, 5
		addi a1, zero, 6
		addi a2, zero, 7
		addi t6, zero, 8
		lui s1, %hi(A) #Guarda la parta alta del arreglo
		
		sw a0, 0(s1)
		sw a1, 4(s1)
		sw a2, 8(s1)
		
		lw t1, 0(s1)
		lw t2, 4(s1)
		lw s0, 8(s1)
