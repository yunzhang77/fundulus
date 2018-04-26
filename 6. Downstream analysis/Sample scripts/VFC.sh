#!/bin/bash
#PBS -l walltime=200:00:00
#PBS -l nodes=2:ppn=8
#PBS -k o
#PBS -N variant_scan
#PBS -j oe
#PBS -V

module load openmpi-1.6.3
module load VarScan

mpirun hostname

java -jar /share/apps/Installs/walls/VarScan.v2.3.6.jar mpileup2cns myData_toll_filt.mpileup --output-vcf 1 >variants_filt.vcf
