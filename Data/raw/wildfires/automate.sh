#!/bin/bash

FILE1="${1}"
FILE2="${2}"

./read_pdf.sh ${FILE1} temp1.csv
./read_pdf.sh ${FILE2} temp2.csv

./join_csv.sh temp1.csv temp2.csv

mv output.csv wildfires_${FILE1%%_*}.csv
