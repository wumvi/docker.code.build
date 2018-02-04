#!/bin/bash

cd $1

##### Сжатие Gzip
for i in `find ./* -type f -name '*.js'`; do echo $i; gzip -c -9 $i > $i.gz; touch -r $i $i.gz; done;
for i in `find ./* -type f -name '*.css'`; do echo $i; gzip -c -9 $i > $i.gz; touch -r $i $i.gz; done;
for i in `find ./* -type f -name '*.svg'`; do echo $i; gzip -c -9 $i > $i.gz; touch -r $i $i.gz; done;

##### Сжатие Brotli
for i in `find ./* -type f -name '*.js'`; do echo $i; /usr/sbin/bro --input ${i} --force --output ${i}.br; done;
for i in `find ./* -type f -name '*.css'`; do echo $i; /usr/sbin/bro --input ${i} --force --output ${i}.br; done;
for i in `find ./* -type f -name '*.svg'`; do echo $i; /usr/sbin/bro --input ${i} --force --output ${i}.br; done;
