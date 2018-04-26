#!/bin/bash
#PBS -l walltime=200:00:00
#PBS -l nodes=2:ppn=8
#PBS -k o
#PBS -N samtools_mpile_toll
#PBS -j oe
#PBS -V

module load openmpi-1.6.3
module load samtools1.19

mpirun hostname

DATA_FOLDER=/home/sharedData/wheaton/reference

samtools mpileup --no-BAQ -f ref/GCF_000826765.1_Fundulus_heteroclitus-3.0.2_genomic.fa \
${DATA_FOLDER}/filt_bams/BI-F1-0-1-star.genome_sorted.bam \
${DATA_FOLDER}/filt_bams/BI-F1-0-2_CGGCTATG-TAATCTTA_L001_star.genome_sorted.bam \
${DATA_FOLDER}/filt_bams/BI-F1-0-3_AGCGATAG-TAATCTTA_L001_star.genome_sorted.bam \
${DATA_FOLDER}/filt_bams/BI-F1-0-4_TCCGCGAA-CAGGACGT_L001_star.genome_sorted.bam \
${DATA_FOLDER}/filt_bams/BI-F1-0-5_CGGCTATG-GTACTGAC_star.genome_sorted.bam \
${DATA_FOLDER}/filt_bams/BI-F1-200-2_CGCTCATT-TAATCTTA_L001_star.genome_sorted.bam \
${DATA_FOLDER}/filt_bams/BI-F1-200-3_CGGCTATG-CAGGACGT_L001_star.genome_sorted.bam \
${DATA_FOLDER}/filt_bams/BI-F1-200-4-star.genome_sorted.bam \
${DATA_FOLDER}/filt_bams/BI-F1-200-5_TAATGCGC-GTACTGAC_L001_star.genome_sorted.bam >myData_toll_filt.mpileup
