class ltMatrix:
    def __init__(self, N):
        self.arr = [None]*(((1+N) * N)//2)
        self.N = N
    
    def length(self):
        return len(self.arr)

    def size(self):
        return self.N

    def oneDArray(self):
        return self.arr

    def twoDToOneDIndex(self, row, column):
        if row < column:
            raise Exception('row should be >= column')
        else:
            index = (row*(row+1))//2 + column
            return index

    def set(self, row, column, V):
        if row > (self.N - 1) and column > (self.N - 1):
            raise Exception('out of bounds')
        else:
            index = self.twoDToOneDIndex(row, column)
            #print("row: %d column: %d index: %d", row, column, index)
            self.arr[index] = V
    
    def get(self, row, column):
        if row <= (self.N - 1) and column <= (self.N - 1) and row < column:
            return 0
        else:
            index = self.twoDToOneDIndex(row, column)
            return self.arr[index]

    def __add__(self, other):
        if not (other.N == self.N):
            raise Exception('cannot add different sized matrices')
        else:
            result = ltMatrix(self.N)
            for i in range(0,self.N):
                for j in range(0, self.N):
                    value = self.get(i,j) + other.get(i,j)
                    result.set(i,j,value)
            return result