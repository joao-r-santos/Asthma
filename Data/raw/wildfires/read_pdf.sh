#!/bin/bash

FILEIN=$1
FILEOUT=$2

if [[ "${FILEIN##*.}" == "pdf" ]] ; then
  echo "${FILEIN} is a pdf file: converting to text"
  pdftotext -layout -eol unix ${FILEIN}
  FILEIN="${FILEIN%.*}.txt"
fi

cat ${FILEIN} | sed '/^$/d' | sed '/^\/d' | sed '/Statistics/d' | sed '/Shaded/d' | sed '/Northern/d' | sed '/Southern/d' | sed '/TOTAL/d' | sed '/Table/d' | sed '/REGION/d' | sed '/^[0-9]/d' | sed '/^ \{15\}/d' > temp_read.tmp

cat temp_read.tmp | sed 's/,//g' | sed 's/^ *//' | sed 's/     */,/g' | cut -d',' -f1,2 > ${FILEOUT}

rm temp_read.tmp
