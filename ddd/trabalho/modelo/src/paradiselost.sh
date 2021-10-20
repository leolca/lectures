#!/bin/bash

data_folder=$( cd "$(dirname "${BASH_SOURCE[0]}")"; cd ../data/; pwd -P )  
imgs_folder=$( cd "$(dirname "${BASH_SOURCE[0]}")"; cd ../imgs/; pwd -P )  
FILE="$data_folder/paradiselost.txt"
# download data from Gutenberg
URL='https://www.gutenberg.org/files/20/20-0.txt'
if [ ! -f "$FILE" ]; then
  wget -q $URL -O $FILE
fi

# find start and end of book
STARTLINE=$(grep -n "*** START OF THE PROJECT GUTENBERG EBOOK PARADISE LOST ***" $FILE | cut -d: -f1)
STARTLINE=$((STARTLINE+1))
ENDLINE=$(grep -n "*** END OF THE PROJECT GUTENBERG EBOOK PARADISE LOST ***" $FILE | cut -d: -f1)
ENDLINE=$((ENDLINE-1))

# get list of words with counts (reverse sorted by count and alphabetically sorted within the same count)
LISTWORDS="$data_folder/listwords.txt"
tail -n +$STARTLINE $FILE | head -n $((ENDLINE-STARTLINE)) |
tr 'A-Z' 'a-z' | tr -dc "a-z \n'" | tr ' ' '\n' | sed -E '/^$/d' | sort | uniq -c | sort -k1,1nr -k2,2 > $LISTWORDS

# create a log-log plot of rank vs frequency
IMG_WCOUNT="$imgs_folder/wordcound.svg"
nl <(cat $LISTWORDS | tr -dc '0-9\n') | 
gnuplot -e "set terminal svg; set output '$IMG_WCOUNT'; set xlabel 'rank'; set logscale x; set ylabel 'frequency'; set logscale y; set title 'word count'; plot '-' using 1:2 with lines title 'Paradise Lost'"

# convert to pdf
cat $IMG_WCOUNT | inkscape --pipe --export-filename=${IMG_WCOUNT%%svg}pdf 2>/dev/null


