#!/bin/bash

#$ -cwd
#$ -V


cd  /storage/home/users/pjt6/project/Lindley_RNAseq_mapping/nanopore_genome

# conda to activate the software
echo $PATH
#conda activate pilon1.23


THREADS=32

echo $PATH

# this has been through one iteration. Now use the ouptu from iteration 1 for the new error correction. 
pigz --d *.gz


PREFIX=lindley_nanopore_run2_xont_S1_A.cns_raw.fa

PILITERNUM=1


##################################################
# pilon 1

PILITERNUM=1


#bwa index lindley_nanopore_run2_xont_S1_A.cns_raw.fa

#cp "/storage/home/users/pjt6/project/20180930_Gpallida_newton_genome/GPAL_Lindley/R1_paired_prinseq_good_NNgn.fastq.gz" R1_paired.fq.gz

#cp "/storage/home/users/pjt6/project/20180930_Gpallida_newton_genome/GPAL_Lindley/R2_paired_prinseq_good_86d2.fastq.gz" R2_paired.fq.gz

#pigz -d -p $THREADS R1_paired.fq.gz 
#pigz -d -p $THREADS R2_paired.fq.gz



##########
# pil actual 4
bwa index lindley_pilon_iter4.fasta

bwa mem -t $THREADS lindley_pilon_iter4.fasta R1_paired.fq R2_paired.fq > new.illumina.mapped.sam

samtools view -@ $THREADS -S -b -o new.illumina.temp.mapped.bam new.illumina.mapped.sam
samtools sort -@ $THREADS -o  new.illumina.mapped.bam new.illumina.temp.mapped.bam
samtools index new.illumina.mapped.bam

rm new.illumina.temp.mapped.bam new.illumina.mapped.sam

# this has been through one iteration. Now use the ouptu from iteration 1 for the new error correction. 
pilon --genome lindley_pilon_iter4.fasta --bam new.illumina.mapped.bam --changes --vcf --diploid --threads $THREADS --output lindley_pilon_iter5


###############
#pilon actual rep 5
bwa index lindley_pilon_iter5.fasta

bwa mem -t $THREADS lindley_pilon_iter5.fasta R1_paired.fq R2_paired.fq > new.illumina.mapped.sam

samtools view -@ $THREADS -S -b -o new.illumina.temp.mapped.bam new.illumina.mapped.sam
samtools sort -@ $THREADS -o  new.illumina.mapped.bam new.illumina.temp.mapped.bam
samtools index new.illumina.mapped.bam

rm new.illumina.temp.mapped.bam new.illumina.mapped.sam

# this has been through one iteration. Now use the ouptu from iteration 1 for the new error correction. 
pilon --genome lindley_pilon_iter5.fasta --bam new.illumina.mapped.bam --changes --vcf --diploid --threads $THREADS --output lindley_pilon_iter6


pigz -p $THREADS  R1_paired.fq 
pigz -p $THREADS  R2_paired.fq
