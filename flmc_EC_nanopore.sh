#!/bin/bash
#$ -cwd
cd /storage/home/users/pjt6/project/20200303_Newton_RNAseq_female_seb

#java -jar /shelf/training/Trimmomatic-0.38/trimmomatic-0.38.jar PE -summary trim_summary.txt  -threads 8 -phred33 A1_1.fq.gz A1_2.fq.gz R1.fq.gz crap1.fastq.gz R2.fq.gz crap2.fastq.gz ILLUMINACLIP:/shelf/training/Trimmomatic-0.38/adapters/TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:39

# reads have had U changed for T so they should map

#gunzip -c reads.fq.gz | awk 'NR % 4 == 2' | sort | gzip > reads.sorted.txt.gz
#gunzip -c reads.sorted.txt.gz | tr NT TN | ropebwt2 -LR | tr NT TN | fmlrc-convert comp_msbwt.npy

#cat R1.fq.gz R1.fq.gz > reads.fq.gz
#gunzip -c reads.fq.gz | awk 'NR % 4 == 2' | sort | tr NT TN | ropebwt2 -LR | tr NT TN | fmlrc-convert /path/to/output/comp_msbwt.npy

# reads have been merged with flash
#gunzip -c out.extendedFrags.fastq.gz | awk 'NR % 4 == 2' | sort | tr NT TN | ropebwt2 -LR | tr NT TN | fmlrc-convert comp_msbwt.npy

#./fmlrc -v -p 16 comp_msbwt.npy <long_reads.fa> <corrected_reads.fa>

# reads have had U changed for T so they should map

values="1 2 3 4 5 6 7 8 9 10"
echo "i here"
for v in ${values}
do
    i=$((v+1))
    echo ${v}
    echo ${i}
    cmd1="fmlrc -V -p 40 -K 45 -m 2 
    comp_msbwt.npy 
    all_direct_RNA_Newton_reads.error_corr_${v}.fasta
    all_direct_RNA_Newton_reads.error_corr_${i}.fasta"
    echo ${cmd1}
    eval ${cmd1}
    cmd2="fmlrc -V -p 40 -K 45 -m 2 
    comp_msbwt.npy 
    all_direct_RNA_Newton_reads_run2.error_corr_${v}.fasta
    all_direct_RNA_Newton_reads_run2.error_corr_${i}.fasta"
    echo ${cmd2}
    eval ${cmd2}
done
