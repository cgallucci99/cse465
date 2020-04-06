using System;
using System.IO;
using System.Linq;
namespace HW4 {
    public class MM {
        public static void Main(string[] args) {
            StreamReader input = new StreamReader(args[0]);
            string[] headers = input.ReadLine().Split(',');
            Dictionary<string, int> cols = new Dictionary<string, int>();
            for (int i = 0; i < headers.Length; i++) {
                cols.Add(headers[i], i);
            }
            List<string[]> data = new List<string[]>();
            while(!input.EndOfStream) {
                string line = input.ReadLine();
                data.Add(line.Split(','));
            }
            input.Close();
            input = new StreamReader(args[1]);
            string temp = input.ReadToEnd();
            for (int i = 0; i < data.Count; i++) {
                StreamWriter output = new StreamWriter(data[i][cols["ID"]] + ".txt");
                string result = temp;
                foreach (var column in cols) {
                    string search = "<<"+column.Key+">>";
                    int index = result.IndexOf(search);
                    int length = search.Length;
                    result = result.Substring(0,index) + data[column.Value] + result.Substring(index+length);
                }
                output.Write(result);
            }
        }
    }
}