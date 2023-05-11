.data
	A: .word

.text
	main:
		addi s0, zero, 1 #Numero de discos
		lui s1, %hi(A) #Guarda la parta alta del arreglo