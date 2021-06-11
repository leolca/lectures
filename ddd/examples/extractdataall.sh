#!/bin/bash
FILE=$1
{
while read apto; do
  ./extractdataapto.sh $apto $FILE
done < unidades.txt 
} | column -t
