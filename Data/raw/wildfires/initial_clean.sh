#!/bin/bash

FILEIN=$1

if [[ "${FILEIN##*.}" == "pdf" ]] ; then
  echo "${FILEIN} is a pdf file: converting to text"
  pdftotext -layout -eol unix ${FILEIN}
  FILEIN="${FILEIN%.*}.txt"
fi

cat ${FILEIN} | sed '/^$/d' | sed '/^\/d' | sed '/Statistics/d' | sed '/Shaded/d' | sed '/Northern/d' | sed '/Southern/d' | sed '/TOTAL/d' | sed '/[tT]otal/d' | sed '/Table/d' | sed '/REGION/d' | sed '/[Rr]egion/d' | sed 's/ernadino/ernardino/' | sed 's/E1 Dorado/El Dorado/' | sed 's/W \. /W\. /' | sed 's/E \. /E\. /' > temp_clean.tmp
