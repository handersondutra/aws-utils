directory_search=$1
for entry in "$directory_search/"*.json
do
          python converter.py $entry
  done
