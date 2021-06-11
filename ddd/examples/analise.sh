#!/bin/bash

# usage
# ./analise.sh > data.csv

echo -e "apto,\tdata,\ttx_cond,\tfundo_res,\tagua_m3,\tagua,\tgas_aq_m3,\tgas_aq,\tgas_m3,\tgas"
for file in *.xls; 
  do  
  libreoffice --headless --convert-to csv "$file" > /dev/null
  FILENAME="${file%xls}csv"
  ./extractdataall.sh $FILENAME
done 
