#!/bin/bash

FILENAME="Asthma_ED_Visit_Rates__LGHC_Indicator_07_.csv"

YEAR="2015"
OUTFILE="Asthma_EDVisitRates_${YEAR}.csv"

echo 'County,Number of ER visits,Rate of ER visists' > $OUTFILE
grep ",$YEAR," $FILENAME | grep ',Total Population,' | cut -d',' -f2,7,8 >> $OUTFILE
