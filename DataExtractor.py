A = [1,2,2]

def fun(A):
	mini = 0
	currmin = A[0]
	n = len(A)
	B = [0 for i in range(n)]

	for i in range(n):
		if A[i] < currmin:
			mini = i
			currmin = A[i]
	print(mini)
	B[mini] = currmin

	if(mini + 1 - n < 0):
		for i in range(mini+1,n):
			if(A[i] > B[i-1]):
				B[i] = B[i-1] +1
			else:
				B[i] = 1

	if(mini-1 >= 0):
		for i in range(mini - 1, -1, -1):
			if(A[i] > B[i+1]):
				B[i] = B[i+1] +1
			else:
				B[i] = 1

	sumu = 0
	for x in B:
		sumu += x
	print(B)
	return sumu

print(fun(A))