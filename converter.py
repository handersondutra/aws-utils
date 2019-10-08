directory_search=$1
for entry in "$directory_search/"*.json
do
          python converter.py $entry
  done
root@DESKTOP-3BBDABE:~/auto_capacity# cat converter.py

import json
import csv
import sys

print ('converting fie '+str(sys.argv[1]))

source_file = str(sys.argv[1])
target_file = source_file.replace('.json', '.csv')
print ('csv file '+target_file)


f = open(source_file)

employee_parsed = json.load(f)

emp_data = employee_parsed['Datapoints']

# open a file for writing

employ_data = open(target_file, 'w')

# create the csv writer object

csvwriter = csv.writer(employ_data)

count = 0

for emp in emp_data:
    if count == 0:
        header = emp.keys()
        csvwriter.writerow(header)
    count += 1
    csvwriter.writerow(emp.values())
employ_data.close()
