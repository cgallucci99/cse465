using System;
namespace HW4 {
    public class LTMatrix {
        private int[] arr;
        private int n;
        
        public LTMatrix(int N) {
            int numElements = (int) ((1+N)*N)/2;
            arr = new int[numElements];
            n = N;
        }

        public int Length() {
            return arr.Length;
        }

        public int Size() {
            return n;
        }

        public int[] OneDArray() {
            return arr;
        }

        public int TwoDToOneDIndex(int row, int column) {
            if (row < column) {
                throw new Exception("row should be >= column");
            } else {
                int index = (row*(row+1))/2 + column;
                return index;
            }
        }

        public void Set(int row, int column, int V) {
            if (row > (n - 1) && column > (n - 1)) {
                throw new Exception("out of bounds");
            } else{
                int index = this.TwoDToOneDIndex(row, column);
                arr[index] = V;
            }
        }

        public int Get(int row, int column) {
            if(row <= (n - 1) && column <= (n - 1) && row < column) {
                return 0;
            } else {
                int index = this.TwoDToOneDIndex(row, column);
                return arr[index];
            }
        }

        public static LTMatrix operator+ (LTMatrix lt1, LTMatrix lt2) {
            if (lt1.Size() != lt2.Size()) {
                throw new Exception("cannot add different sized matrices");
            } else {
                LTMatrix result = new LTMatrix(lt1.Size());
                for (int i = 0; i < lt1.Size(); i++) {
                    for (int j = 0; j < lt1.Size(); j++) {
                        int value = lt1.Get(i,j) + lt2.Get(i,j);
                        result.Set(i,j, value);
                    }
                }
                return result;
            }
        }
    }
}
