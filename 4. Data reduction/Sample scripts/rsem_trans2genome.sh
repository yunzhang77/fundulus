#!/bin/bash
#PBS -l walltime=200:00:00
#PBS -l nodes=2:ppn=8
#PBS -k o
#PBS -N rsem_convert
#PBS -j oe
#PBS -V

module load pythonShared
module load perlShared
module load STAR
module load openmpi-1.6.3
module load RSem1.3

mpirun hostname

SAMPLES_FOLDER=/home/sharedData/wheaton/reference/

for d in ${SAMPLES_FOLDER}bams/*.bam; do
  BAM_BASE=$(echo $d | sed s/'.transcript.bam'//)
  FILT_PATH=$(echo $BAM_BASE | sed s/'bams'/'filt_bams'/)
 
  rsem-tbam2gbam ref/star_fund_rsem $d ${FILT_PATH}.genome
done
