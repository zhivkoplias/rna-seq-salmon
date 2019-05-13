#!/bin/bash

echo "SRA-fastqc conversion"
wait

for i in *.sra
do
    while [ $(jobs | wc -l) -ge 2 ] ; do sleep 1; done
    echo "sample $i is processing.."
    ~/Desktop/sratoolkit.2.9.0-mac64/bin/./fastq-dump --split-files $i
done
wait

echo "II IS DONE!"
echo
echo
