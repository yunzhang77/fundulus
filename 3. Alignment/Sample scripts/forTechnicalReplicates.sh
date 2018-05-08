#!/bin/bash
#PBS -l walltime=200:00:00
#PBS -l nodes=2:ppn=8
#PBS -k o
#PBS -N star_rsem_run
#PBS -j oe
#PBS -V
module load pythonShared
module load perlShared
module load STAR
module load openmpi-1.6.3
module load RSem1.3
mpirun hostname
for d in samples/lane1/*L001_R1_paired.fastq.gz; do
  FASTQ_BASE=$(echo $d | sed s/'L001_R1_paired.fastq.gz'//)
  FASTQ_BASE2=$(echo $FASTQ_BASE | sed s/'lane1'/'lane2'/)
  gzip -d $d
  gzip -d ${FASTQ_BASE}L001_R2_paired.fastq.gz
  gzip -d ${FASTQ_BASE2}L002_R1_paired.fastq.gz
  gzip -d ${FASTQ_BASE2}L002_R2_paired.fastq.gz
  rsem-calculate-expression --paired-end --star ${FASTQ_BASE}L001_R1_paired.fastq,${FASTQ_BASE2}L002_R1_paired.fastq ${$
  gzip ${FASTQ_BASE}L001_R1_paired.fastq
  gzip ${FASTQ_BASE}L001_R2_paired.fastq
  gzip ${FASTQ_BASE2}L002_R1_paired.fastq
  gzip ${FASTQ_BASE2}L002_R2_paired.fastq
done
