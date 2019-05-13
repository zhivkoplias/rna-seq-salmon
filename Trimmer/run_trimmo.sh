#!/bin/bash

for f1 in *_1.fastq.gz
do
    while [ $(jobs | wc -l) -ge 2 ] ; do sleep 1; done
    echo "sample $f1 is processing.."
    f2=${f1%%_1.fastq.gz}"_2.fastq.gz"
    java -jar ~/Desktop/RNAseq/Trimmed/Trimmomatic-0.38/trimmomatic-0.38.jar PE -phred33 $f1 $f2 $f1.trimmed1.fastq.gz output_forward_unpaired.fq $f2.trimmed2.fastq.gz output_reverse_unpaired.fq LEADING:30 TRAILING:30 SLIDINGWINDOW:4:15 MINLEN:36
done
wait

echo "ALL trimming IS DONE!"
echo
echo
