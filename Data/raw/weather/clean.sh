#!/bin/bash

FILEIN="${1}"
FILEOUT="${2}"

cat ${FILEIN} | sed 's/\"//g' | sed 's/, [A-Z][A-Z] US//' > temp_GSOY.csv

mv temp_GSOY.csv "${FILEOUT}"


#TAVG, average temperature
#TMAX, avg max temp
#TMIN, avg min temp
#EMXT, extreme highest temp
#EMNT, extreme min temp

#PRCP, total precipitation
#EMXP, highest daily precipitation


