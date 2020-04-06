using System;
namespace HW4 {
    public class MM {
        public static void Main(string[] args) {
            StreamReader input = new StreamReader(args[0]);
            while(!input.EndOfStream) {
                string line = input.ReadLine();
                Console.WriteLine(line);
            }
        }
    }
}