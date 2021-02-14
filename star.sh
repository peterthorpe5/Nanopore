#!/bin/bash
cd /storage/home/users/pjt6/project/20200817_Lindley_nanopore_genomic/




module load samtools
mkdir star_indicies

# index the genome
/shelf/apps/pjt6/apps/STAR-master/bin/Linux_x86_64_static/STAR --runMode genomeGenerate --runThreadN 55 --limitGenomeGenerateRAM 259760745173 \
--genomeDir ./star_indicies --genomeFastaFiles Gp_Lind_nanoore_v1.0.softmasked.fasta


/shelf/apps/pjt6/apps/STAR-master/bin/Linux_x86_64_static/STAR --genomeDir star_indicies/ --limitGenomeGenerateRAM 285554136874 \
--runThreadN 55 --readFilesCommand zcat --outSAMtype BAM SortedByCoordinate --readFilesIn  /storage/home/users/pjt6/project/20180930_Gpallida_newton_genome/Gp_lifestages_RNAseq/R1.fq.gz \
 /storage/home/users/pjt6/project/20180930_Gpallida_newton_genome/Gp_lifestages_RNAseq/R2.fq.gz --outFilterMultimapNmax 3 \
 --outFileNamePrefix ppen --outFilterMismatchNmax 7 --alignIntronMax 4000 --alignEndsType EndToEnd --limitBAMsortRAM 285554136874 
wait
