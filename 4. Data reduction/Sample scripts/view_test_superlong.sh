#!/bin/bash
#PBS -l walltime=200:00:00
#PBS -l nodes=1:ppn=8
#PBS -V

module load samtools1.19

SAMPLES_FOLDER=/home/sharedData/wheaton/reference/

for d in ${SAMPLES_FOLDER}sorted_bams/*.bam; do
  FILT_PATH=$(echo $d | sed s/'sorted_bams'/'filt_bams'/)

  samtools merge -f ${FILT_PATH} 
  <(samtools view -b $d NW_012234559.1) 
  <(samtools view -b $d NW_012224655.1) 
  <(samtools view -b $d NW_012227025.1) 
  <(samtools view -b $d NW_012224428.1) 
  <(samtools view -b $d NW_012234424.1) 
  <(samtools view -b $d NW_012234381.1) 
  <(samtools view -b $d NW_012234436.1) 
  <(samtools view -b $d NW_012234271.1) 
  <(samtools view -b $d NW_012225660.1) 
  <(samtools view -b $d NW_012224486.1) 
  <(samtools view -b $d NW_012234552.1) 
  <(samtools view -b $d NW_012224822.1) 
  <(samtools view -b $d NW_012234433.1) 
  <(samtools view -b $d NW_012234493.1) 
  <(samtools view -b $d NW_012225954.1) 
done  
