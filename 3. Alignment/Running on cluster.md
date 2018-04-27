# STAR through RSEM on cluster
1. Download the reference directory onto your own directory `cp -r /tmp/WH/ref/ ~`
1. Using **nano** to create a **.qsub** file <br/>
Type in the following code:
```bash
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

for d in samples/*R1_paired.fastq.gz; do

  FASTQ_BASE=$(echo $d | sed s/'R1_paired.fastq.gz'//)
  gzip -d $d
  gzip -d ${FASTQ_BASE}R2_paired.fastq.gz  

  rsem-calculate-expression --paired-end --star 
  
  ${FASTQ_BASE}R1_paired.fastq 
  ${FASTQ_BASE}R2_paired.fastq 
  ref/star_fund_rsem 
  ${FASTQ_BASE}star

  gzip ${FASTQ_BASE}R1_paired.fastq
  gzip ${FASTQ_BASE}R2_paired.fastq

Done
```
3. Submit the qsub job
4. After it is completed, move the .bam file to `/home/sharedData/wheaton/reference/bams`
# NOTE
* with this script need to make sure your .fq files are now called something like: <br/>
BI-F1-200-4-R1_paired.fastq and BI-F1-200-4-R2_paired.fastq 
* make sure your paths are edited according to your files
* ALSO MAKE SURE YOU COMPRESS YOUR FILES!! `gzip *_paired.fastq`


