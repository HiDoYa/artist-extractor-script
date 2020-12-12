#!/bin/bash
mkdir cat_songs
awk -f split.awk songs.txt

mkdir titles
for i in {0..12}; do awk -f compl.awk cat_songs/cat_song${i}.txt > titles/titles${i}.txt; done

mkdir authors
for i in {0..12}; do awk -f authors.awk titles/titles${i}.txt > authors/temp_authors${i}.txt; done

for i in {0..12}; do cat authors/temp_authors${i}.txt | uniq -c | sort -r | sed "s/^ *[0-9]\{1,\} //" > authors/authors${i}.txt; done
