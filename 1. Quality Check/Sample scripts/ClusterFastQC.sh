#!/bin/bash
#PBS -k o
#PBS -l nodes=1:ppn=4,walltime=200:00:00
#PBS -N fastqc
#PBS -j oe
#PBS -V
module load openmpi-1.6.3
module load open64
module load fastqc
mpirun fastqc *.fq.gz
