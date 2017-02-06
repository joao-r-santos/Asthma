#!/bin/bash

FILEIN="${1}"
FILEOUT="${2}"

cat ${FILEIN} | sed 's/\"//g' | sed 's/, [A-Z][A-Z] US//' > temp_GSOY.csv

if [[ "${FILEIN#*GSOY}" == ".csv" ]] ; then
  cut -d',' -f1,2,6- temp_GSOY.csv > "${FILEOUT}"
  rm temp_GSOY.csv
else
  mv temp_GSOY.csv "${FILEOUT}"
fi


#TAVG, average temperature
#TMAX, avg max temp
#TMIN, avg min temp
#EMXT, extreme highest temp
#EMNT, extreme min temp

#PRCP, total precipitation
#EMXP, highest daily precipitation


