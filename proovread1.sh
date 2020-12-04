#!/bin/bash
#$ -cwd
cd /storage/home/users/pjt6/project/20200303_Newton_RNAseq_female_seb

/storage/home/users/pjt6/shelf_apps/apps/bwa-mem2-2.0pre2_x64-linux/bwa-mem2 index all_direct_RNA_Newton_reads.fasta

/storage/home/users/pjt6/shelf_apps/apps/bwa-mem2-2.0pre2_x64-linux/bwa-mem2 mem -t 16 all_direct_RNA_Newton_reads.fasta  R1.fq R2.fq > N1.sam

proovread --long-reads all_direct_RNA_Newton_reads_run2.fq -s N1.sam --prefix run1_EC -t 16 

