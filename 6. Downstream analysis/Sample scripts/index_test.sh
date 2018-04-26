#!/bin/bash
#PBS -l walltime=200:00:00
#PBS -l nodes=1:ppn=8
#PBS -V

module load samtools1.19

SAMPLES_FOLDER=/home/sharedData/wheaton/reference/

for d in ${SAMPLES_FOLDER}sorted_bams/*.bam; do
  FILT_PATH=$(echo $d | sed s/'sorted_bams'/'filt_bams'/)

  samtools index $d
done
