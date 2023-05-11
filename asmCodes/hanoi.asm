#MENDEZ SANTANA JAZMIN NAHIL 734043
#GONZALEZ CAMACHO LAURA GRISELDA 734049
.data
	dir: .word
	A: .word

.text
	main:
		add zero, zero, zero
		addi s0, zero, 3 #Numero de discos
		add zero, zero, zero
		add zero, zero, zero
		add zero, zero, zero
		lui s1, %hi(A) #Guarda la parta alta del arreglo
		add zero, zero, zero
		add zero, zero, zero
		add zero, zero, zero
		addi s1, s1, 12 #Guarda parte baja del arreglo
		add zero, zero, zero
		add zero, zero, zero
		add zero, zero, zero
		lui s3, %hi(dir)#Guarda la parta alta del arreglo
		add zero, zero, zero
		add zero, zero, zero
		add zero, zero, zero
		addi s3, s3, %lo(dir)#Guarda parte baja del arreglo
		add s2, zero, s0 #copia de n
		addi a4, zero, 1 #valor 1
		add a7, zero, zero #bandera para saber si hacemos return normal o con sp/ra
		add t0, zero, zero #Contador para saltar memoria
		jal t6, initialize #inicializamos las torres
		add zero, zero, zero
		add zero, zero, zero
		add zero, zero, zero
		
	initialize:
		add zero, zero, zero
		add zero, zero, zero
		add zero, zero, zero
		sw s2, 0(s1) #llenamos la torre A de n a 1
		add zero, zero, zero
		add zero, zero, zero
		add zero, zero, zero
		addi s1, s1, 4 #nos movemos 4 en el arreglo
		addi t0, t0, 4 #aumentamos el contador
		addi s2, s2, -1 #Disminuye n
		add zero, zero, zero
		add zero, zero, zero
		add zero, zero, zero
		bne s2, zero, initialize #llenamos torre A de n discos
		add zero, zero, zero
		add zero, zero, zero
		addi s1, s1, -4 #colocamos s1 en el ultimo elemento de la torre A
		add t1, zero, s1 # -> TORRE A
		add zero, zero, zero
		add zero, zero, zero
		add zero, zero, zero
		sw t1, 0(s3) #Guadamos en el arreglo
		addi t2, t1, 4 #->TORRE B -> el siguiente lugar de la torre A
		add t3, t2, t0 # ->TORRE C -> dejamos el espacio en memoria suficiente para n discos en B y empezamos la torre C
		addi t3, t3, -4 #Al saber que el primer movimiento es un push a B y/o C restamos un lugar...
		addi t2,t2, -4#para al momento de realizar push quedar en el ultimo elemento de la torre
		add zero, zero, zero
		add zero, zero, zero
		add zero, zero, zero
		sw t2, 4(s3)#Guardamos en el arreglo
		add zero, zero, zero
		add zero, zero, zero
		add zero, zero, zero
		sw t3, 8(s3)#Guadamos en el arreglo
		add zero, zero, zero
		add zero, zero, zero
		add zero, zero, zero
		add s2, zero, s0 #Volvemos a copiar n
		add zero, zero, zero
		add zero, zero, zero
		add zero, zero, zero
		jal ra, hanoi #saltamos a la funcion recursiva
		add zero, zero, zero
		add zero, zero, zero
		add zero, zero, zero
		jal t6 end
		add zero, zero, zero
		add zero, zero, zero
		add zero, zero, zero
	hanoi:
		addi sp, sp, -4 #Guardo el valor de ra en el stack
		add zero, zero, zero
		add zero, zero, zero
		add zero, zero, zero
		sw ra, 0(sp)
		add zero, zero, zero
		add zero, zero, zero
		add zero, zero, zero
		addi sp, sp, -4 #Solicito otro espacio y guardo n
		add zero, zero, zero
		add zero, zero, zero
		add zero, zero, zero
		sw s2, 0(sp)	#De ser n == 1 realizamos un Pop y despues un Push
		add zero, zero, zero
		add zero, zero, zero
		add zero, zero, zero
		beq s2, a4, PopPush #POP-> A(a1) PUSH->C(a3)
		add zero, zero, zero
		add zero, zero, zero
		add zero, zero, zero
		addi s2, s2, -1	#de no ser 1, llamamos a la funcion con n-1 y un orden diferente de las torres
		add zero, zero, zero
		add zero, zero, zero
		add zero, zero, zero
		jal ra Intercambio_CB	#Orden-> (A, C, B) -> (a1, a3, a2) 
		add zero, zero, zero
		add zero, zero, zero
		add zero, zero, zero
		jal ra hanoi	#Con esos nuevos datos de entrada volvemos a llamar a la funcion
		add zero, zero, zero
		add zero, zero, zero
		add zero, zero, zero
		addi a7, zero, 1 #Activamos nuestra bandera, para saber se realizara un return normal es decir sin utilizar valores del stack
		add zero, zero, zero
		add zero, zero, zero
		add zero, zero, zero
		jal ra Intercambio_CB #Ordenamos de regreso nuestas torres
		add zero, zero, zero
		add zero, zero, zero
		add zero, zero, zero
		jal ra PopPush #Realizamos un pop y un push (siempre un pop a la torre A y un push a la C)
		add zero, zero, zero
		add zero, zero, zero
		add zero, zero, zero
		add a7, zero, zero
		add zero, zero, zero
		add zero, zero, zero
		add zero, zero, zero
		jal ra Intercambio_AB #Ahora, volvemos a llamar a la funcion pero con el orden ( B, A, C)
		add zero, zero, zero
		add zero, zero, zero
		add zero, zero, zero
		jal ra hanoi
		add zero, zero, zero
		add zero, zero, zero
		add zero, zero, zero
		jal ra Intercambio_AB
		add zero, zero, zero
		add zero, zero, zero
		add zero, zero, zero
		jal ra return_hanoi #Realizamos un return a una direccion del stack
		add zero, zero, zero
		add zero, zero, zero
		add zero, zero, zero
	
	Intercambio_CB:
		add zero, zero, zero
		add zero, zero, zero
		add zero, zero, zero
		lw t1, 4(s3)#Obtenemos B
		add zero, zero, zero
		add zero, zero, zero
		add zero, zero, zero
		lw t2, 8(s3)#Obtenemos C
		add zero, zero, zero
		add zero, zero, zero
		add zero, zero, zero
		sw t2, 4(s3)#Intercambiamos valores
		add zero, zero, zero
		add zero, zero, zero
		add zero, zero, zero
		sw t1, 8(s3)
		add zero, zero, zero
		add zero, zero, zero
		add zero, zero, zero
		jalr ra #Regresamos
		add zero, zero, zero
		add zero, zero, zero
		add zero, zero, zero
		
	Intercambio_AB:
		add zero, zero, zero
		add zero, zero, zero
		add zero, zero, zero
		lw t1, 4(s3)#Obtenemos B
		add zero, zero, zero
		add zero, zero, zero
		add zero, zero, zero
		lw t2, 0(s3)#Obtenemos A
		add zero, zero, zero
		add zero, zero, zero
		add zero, zero, zero
		sw t1, 0(s3) #Intercambiamos valores
		add zero, zero, zero
		add zero, zero, zero
		add zero, zero, zero
		sw t2, 4(s3)
		add zero, zero, zero
		add zero, zero, zero
		add zero, zero, zero
		jalr ra #Regresamos
		add zero, zero, zero
		add zero, zero, zero
		add zero, zero, zero
		
	PopPush:
		add zero, zero, zero
		add zero, zero, zero
		add zero, zero, zero
		lw t0, 0(s3) #Guardamos el dato de a1 -> Torre A
		add zero, zero, zero
		add zero, zero, zero
		add zero, zero, zero
		lw t1, 0(t0)#Valor de la torre A
		add zero, zero, zero
		add zero, zero, zero
		add zero, zero, zero
		sw zero, 0(t0) #Ponemos un cero en dicha Torre y posicion
		add zero, zero, zero
		add zero, zero, zero
		add zero, zero, zero
		addi t0, t0, -4 #Disminuimos la longitud de la torre
		add zero, zero, zero
		add zero, zero, zero
		add zero, zero, zero
		sw t0, 0(s3)
		add zero, zero, zero
		add zero, zero, zero
		add zero, zero, zero
		lw t3, 8(s3) #Obtenemos la torre C
		add zero, zero, zero
		add zero, zero, zero
		add zero, zero, zero
		addi t3, t3, 4 #Aumentamos la longitud de la Torre C
		add zero, zero, zero
		add zero, zero, zero
		add zero, zero, zero
		sw t1, 0(t3)#Guardamos en la Torre C el valor de la Torre A
		add zero, zero, zero
		add zero, zero, zero
		add zero, zero, zero
		sw t3, 8(s3)
		add zero, zero, zero
		add zero, zero, zero
		add zero, zero, zero
		beq a7, zero, return_hanoi #Si se trata de un PopPush activado por la condicional n == 1, realizaremos un return con uso de ra
		add zero, zero, zero
		add zero, zero, zero
		add zero, zero, zero
		jal t6 normal_ret #Si se trata de un PopPush que no depende de la condicional, se hara un return normal, regresando a la funcion
		add zero, zero, zero
		add zero, zero, zero
		add zero, zero, zero
		
	return_hanoi:
		add zero, zero, zero
		add zero, zero, zero
		add zero, zero, zero
		lw s2, 0(sp)#Obtenemos el valor de la ultima n
		add zero, zero, zero
		add zero, zero, zero
		add zero, zero, zero
		sw zero, 0(sp)
		add zero, zero, zero
		add zero, zero, zero
		add zero, zero, zero
		addi sp, sp, 4
		add zero, zero, zero
		add zero, zero, zero
		add zero, zero, zero
		lw ra, 0(sp) #Obtenemos el valor del salto dentro de la funcion hanoi
		add zero, zero, zero
		add zero, zero, zero
		add zero, zero, zero
		sw zero, 0(sp)
		add zero, zero, zero
		add zero, zero, zero
		add zero, zero, zero
		addi sp, sp, 4 #nos volvemos a posicionar en el siguiente valor de n
		add zero, zero, zero
		add zero, zero, zero
		add zero, zero, zero
		jalr ra #saltamos a en medio de la funcion
		add zero, zero, zero
		add zero, zero, zero
		add zero, zero, zero
		
	normal_ret:
		jalr ra #Regresa a la funcion
		add zero, zero, zero
		add zero, zero, zero
		add zero, zero, zero
		
	end: #final
