#!/bin/bash

# To be run after read_pdf.sh


FILE1=${1}
FILE2=${2}

cat ${FILE1} ${FILE2} | sed 's/^[WE]\. //' | sort -t',' -k1 > join.tmp

cat join.tmp county_zero.csv | sort -t',' -k1 > input.tmp


cat header.csv > output.csv

cut -d',' -f1 input.tmp | sort -u | while read county ; do
	grep "${county}" input.tmp | cut -d',' -f2 > sum.tmp
	val=`paste -sd+ sum.tmp | bc`
	echo "${county},${val}" >> output.csv
done


rm join.tmp input.tmp sum.tmp
