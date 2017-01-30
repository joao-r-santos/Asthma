#!/bin/bash

ls aqidaily2015_*.csv | while read filename ;
do
	echo $filename;
	sed -i 's/\"//g' $filename;
	sed -i 's/,\.,/,,/g' $filename;
	sed -i 's/,\.$/,/g' $filename;
done
