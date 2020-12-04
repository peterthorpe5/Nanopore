#!/bin/bash
#$ -cwd
cd /storage/home/users/pjt6/project/20200303_Newton_RNAseq_female_seb

#java -jar /shelf/training/Trimmomatic-0.38/trimmomatic-0.38.jar PE -summary trim_summary.txt  -threads 8 -phred33 A1_1.fq.gz A1_2.fq.gz R1.fq.gz crap1.fastq.gz R2.fq.gz crap2.fastq.gz ILLUMINACLIP:/shelf/training/Trimmomatic-0.38/adapters/TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:39


#gunzip -c reads.fq.gz | awk 'NR % 4 == 2' | sort | gzip > reads.sorted.txt.gz
#gunzip -c reads.sorted.txt.gz | tr NT TN | ropebwt2 -LR | tr NT TN | fmlrc-convert comp_msbwt.npy

#python ~/public_scripts/convert_file_format/convert_fq_to_fa.py -i 

#cat R1.fq.gz R1.fq.gz > reads.fq.gz
#gunzip -c reads.fq.gz | awk 'NR % 4 == 2' | sort | tr NT TN | ropebwt2 -LR | tr NT TN | fmlrc-convert /path/to/output/comp_msbwt.npy


#gunzip -c out.extendedFrags.fastq.gz | awk 'NR % 4 == 2' | sort | tr NT TN | ropebwt2 -LR | tr NT TN | fmlrc-convert comp_msbwt.npy

#./fmlrc -v -p 16 comp_msbwt.npy <long_reads.fa> <corrected_reads.fa>

fmlrc -k 55 -m 2  -p 24 comp_msbwt.npy all_direct_RNA_Newton_reads.fasta all_direct_RNA_Newton_reads.error_corr.fasta

fmlrc -k 55 -m 2 -p 24 comp_msbwt.npy all_direct_RNA_Newton_reads_run2.fasta all_direct_RNA_Newton_reads_run2.error_corr.fasta

