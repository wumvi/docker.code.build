#!/bin/bash

cd $1

##### Сжатие Gzip
#for i in `find ./* -type f \( -iname \*.svg -o -iname \*.js -o -iname \*.css \)`; do echo $i; gzip -c -9 $i > $i.gz; touch -r $i $i.gz; done;
for i in `find ./* -type f \( -iname \*.svg -o -iname \*.js -o -iname \*.css \)`; do echo $i; zopfli -c --i1000 $i > $i.gz; touch -r $i $i.gz; done;

##### Сжатие Brotli
for i in `find ./* -type f \( -iname \*.svg -o -iname \*.js -o -iname \*.css \)`; do echo $i; brotli --force --output=${i}.br --quality=11 ${i}; done;
