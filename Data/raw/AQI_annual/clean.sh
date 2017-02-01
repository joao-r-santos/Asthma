#!/bin/bash

FILEIN="${1}"
FILEOUT="${2}"

echo ${FILEIN}

cat ${FILEIN} | sed 's/\"//g' | sed 's/ County, CA//' | sed 's/,\.$/,0/g' | sed 's/,\.,/,0,/g' | sed 's/,\.,/,0,/g' | sed 's/,\.,/,0,/g' | cut -d',' -f2- > temp_aqi.tmp

touch ${FILEOUT}
rm ${FILEOUT}

cat county_cmp.csv | while read x ; do
  if [[ `grep "$x" temp_aqi.tmp` == "" ]] ; then
    #echo "$x not found"
    echo "${x},,,,,,,,,,,,,,," >> ${FILEOUT}
  else
    #echo "$x found"
    echo `grep "$x" temp_aqi.tmp` >> ${FILEOUT}
  fi ;
done


rm temp_aqi.tmp
