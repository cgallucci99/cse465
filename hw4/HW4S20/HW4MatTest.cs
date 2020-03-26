using System;
using HW4;

namespace HW4Test {
	public class LTMatrixDriver {
		public static void Display(LTMatrix mat) {
			Console.WriteLine("2D Matrix info ================");
			Console.WriteLine("The N in NxN: " + mat.Size());
			int N = mat.Size();
			for (int r=0; r<N; r++) {
				for (int c=0; c<N; c++) {
					Console.Write(mat.Get(r, c) + " ");
				}
				Console.WriteLine();
			}
			Console.WriteLine("Length of 1D array: " + mat.Length());
			Console.Write("1D array mappings: ");
			for (int r=0; r<N; r++) {
				for (int c=0; c<=r; c++) {
					Console.Write(mat.TwoDToOneDIndex(r, c) + " ");
				}
			}
			Console.WriteLine();
			Console.Write("1D array contents: ");
			int [] ary = mat.OneDArray();
			for (int i=0; i<ary.Length; i++) {
				Console.Write(ary[i] + " ");
			}
			Console.WriteLine();
		}
		public static void Display(LTMatrix3D mat) {
			Console.WriteLine("3D Matrix info ================");
			int N = mat.Size();
			Console.WriteLine("The N in NxNxN: " + N);
			Console.WriteLine("1D length: " + mat.Length());
			Console.Write("1D array mappings: ");
			for (int r=0; r<N; r++) {
				for (int c=0; c<=r; c++) {
					for (int d=0; d<=c; d++) {
						Console.Write(mat.ThreeDToOneDIndex(r, c, d) + " ");
					}
				}
			}
			Console.WriteLine();
		}
		public static void DemoLTMatrix2D() {
			LTMatrix m4a = new LTMatrix(4);
			LTMatrix m4b = new LTMatrix(4);
			LTMatrix m6a = new LTMatrix(6);

			for (int r=0; r<4; r++) {
				for (int c=0; c<=r; c++) {
					m4a.Set(r, c, r + c);
					m4b.Set(r, c, r * c);
				}
			}

			for (int r=0; r<6; r++) {
				for (int c=0; c<=r; c++) {
					m6a.Set(r, c, r + c);
				}
			}
			Display(m4a);
			Display(m4b);
			Display(m6a);
		}
		public static void DemoLTMatrix3D() {
			for (int N=1; N<=4; N++) {
				LTMatrix3D m = new LTMatrix3D(N);
				Display(m);
			}
		}
		public static void Main(string [] args) {
			DemoLTMatrix2D();
			DemoLTMatrix3D();
		}
	}
}

/*
2D Matrix info ================
The N in NxN: 4
0 0 0 0 
1 2 0 0 
2 3 4 0 
3 4 5 6 
Length of 1D array: 10
1D array mappings: 0 1 2 3 4 5 6 7 8 9 
1D array contents: 0 1 2 2 3 4 3 4 5 6 
2D Matrix info ================
The N in NxN: 4
0 0 0 0 
0 1 0 0 
0 2 4 0 
0 3 6 9 
Length of 1D array: 10
1D array mappings: 0 1 2 3 4 5 6 7 8 9 
1D array contents: 0 0 1 0 2 4 0 3 6 9 
2D Matrix info ================
The N in NxN: 6
0 0 0 0 0 0 
1 2 0 0 0 0 
2 3 4 0 0 0 
3 4 5 6 0 0 
4 5 6 7 8 0 
5 6 7 8 9 10 
Length of 1D array: 21
1D array mappings: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 
1D array contents: 0 1 2 2 3 4 3 4 5 6 4 5 6 7 8 5 6 7 8 9 10 
3D Matrix info ================
The N in NxNxN: 1
1D length: 1
1D array mappings: 0 
3D Matrix info ================
The N in NxNxN: 2
1D length: 4
1D array mappings: 0 1 2 3 
3D Matrix info ================
The N in NxNxN: 3
1D length: 10
1D array mappings: 0 1 2 3 4 5 6 7 8 9 
3D Matrix info ================
The N in NxNxN: 4
1D length: 20
1D array mappings: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 
*/
