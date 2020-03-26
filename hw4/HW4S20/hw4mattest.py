import sys
from ltmatrix import *

def display2D(mat):
	print("2D Matrix info ================")
	print("The N in NxN: " + str(mat.size()))
	N = mat.size()
	for r in range(N):
		for c in range(N):
			print(mat.get(r, c), end=' ')
		print()
	print("Length of 1D array: " + str(mat.length()))
	print("1D array mappings: ")
	for r in range(N):
		for c in range(r+1):
			print(mat.twoDToOneDIndex(r, c), end=" ")
	print()
	print("1D array contents: ", end="")
	ary = mat.oneDArray()
	for i in range(len(ary)):
		print(ary[i], end=" ")
	print()

def display3D(mat):
	print("3D Matrix info ================")
	N = mat.size()
	print("The N in NxNxN: " + str(N))
	print("1D length: " + str(mat.length()))
	print("1D array mappings: ", end="")
	for r in range(N):
		for c in range(r+1):
			for d in range(c+1):
				print(mat.threeDToOneDIndex(r, c, d), end=" ")
	print()

def demoLTMatrix2D():
	m4a = ltMatrix(4)
	m4b = ltMatrix(4)
	m6a = ltMatrix(6)

	for r in range(4):
		for c in range(r+1):
			m4a.set(r, c, r + c)
			m4b.set(r, c, r * c)

	for r in range(6):
		for c in range(r+1):
			m6a.set(r, c, r + c)
	display2D(m4a)
	display2D(m4b)
	display2D(m6a)

def demoLTMatrix3D():
	for i in range(4):
		mat = ltMatrix3D(i)
		display3D(mat)

demoLTMatrix2D()
demoLTMatrix3D()

##################### OUTPUT #####################
#2D Matrix info ================
#The N in NxN: 4
#0 0 0 0 
#1 2 0 0 
#2 3 4 0 
#3 4 5 6 
#Length of 1D array: 10
#1D array mappings: 
#0 1 2 3 4 5 6 7 8 9 
#1D array contents: 0 1 2 2 3 4 3 4 5 6 
#2D Matrix info ================
#The N in NxN: 4
#0 0 0 0 
#0 1 0 0 
#0 2 4 0 
#0 3 6 9 
#Length of 1D array: 10
#1D array mappings: 
#0 1 2 3 4 5 6 7 8 9 
#1D array contents: 0 0 1 0 2 4 0 3 6 9 
#2D Matrix info ================
#The N in NxN: 6
#0 0 0 0 0 0 
#1 2 0 0 0 0 
#2 3 4 0 0 0 
#3 4 5 6 0 0 
#4 5 6 7 8 0 
#5 6 7 8 9 10 
#Length of 1D array: 21
#1D array mappings: 
#0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 
#1D array contents: 0 1 2 2 3 4 3 4 5 6 4 5 6 7 8 5 6 7 8 9 10 
#3D Matrix info ================
#The N in NxNxN: 0
#1D length: 0
#1D array mappings: 
#3D Matrix info ================
#The N in NxNxN: 1
#1D length: 1
#1D array mappings: 0 
#3D Matrix info ================
#The N in NxNxN: 2
#1D length: 4
#1D array mappings: 0 1 2 3 
#3D Matrix info ================
#The N in NxNxN: 3
#1D length: 10
#1D array mappings: 0 1 2 3 4 5 6 7 8 9 
