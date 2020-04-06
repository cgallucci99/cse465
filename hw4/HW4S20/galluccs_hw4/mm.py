import sys

#open files from command line args
data = open(sys.argv[1])
template = open(sys.argv[2])

#put lines of data file into a list
lines = data.readlines()

#split the first line at the commas and subtract the last newline char
headers = lines[0][0:len(lines[0])-1].split(',')

#extract template from file
temp = template.read()

#make dictionary of all columns
cols = {}
for i in range(0, len(headers)):
    cols[headers[i]] = i

#loop through each line of CSV file
for i in range(1, len(lines)):
    line = lines[i][0:len(lines[i])-1].split(',')
    filename = line[cols["ID"]] + ".txt"
    userFile = open(filename, "w")
    result = temp
    for col in cols.keys():
        index = result.find("<<" + col + ">>")
        length = len("<<" + col + ">>")
        result = result[0:index] + line[cols[col]] + result[index+length:]
    userFile.write(result)
