#!/bin/bash
for fn in data/SRR10301{44..44};
do
samp=`basename ${fn}`
echo "Processing sample ${samp}"
DYLD_FALLBACK_LIBRARY_PATH=/Users/zhivkopliasek/Desktop/RNAseq/Salmon-0.8.2_macOX_10.12/lib ~/Desktop/RNAseq/Salmon-0.8.2_macOX_10.12/bin/salmon quant -i ~/Desktop/RNAseq/salmon-0.10.0_linux_x86_64/bin/musculus_index -l A \
         -1 ${fn}/${samp}_1.fastq.gz.trimmed1.fastq.gz \
         -2 ${fn}/${samp}_2.fastq.gz.trimmed2.fastq.gz \
         -p 8 -o quants/${samp}_quant
done
