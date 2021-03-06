from math import *

# Replace the given loop with another loop that
# does not use break or continue
def loop1(N):
	total = 0.0
	for i in range(N):
		if i % 2 == 1:
			total = cos(i)
	return total

# Replace the given loop with another loop that
# does not use break or continue
def loop2(N):
	total = 0.0
	for i in range(N):
		if not i == 7:
			total = cos(i)
	return total

# Replace the given loop with another loop that
# does not use break or continue
def loop3(N, F):
	total = 0.0
	flag = False
	for i in range(N):
		if F(i):
			flag = True
		if not flag:
			total = i
	return total

# Replace the following code with one that does not
# use the ternary operator
def expression(N):
	if N >= 0:
		return N
	else:
		return -1

print(loop1(5))
print(loop2(5))
print(loop3(10, lambda x : x >= 5))
print(expression(5))
