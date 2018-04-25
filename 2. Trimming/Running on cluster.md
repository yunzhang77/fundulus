# Running Trimmomatic on HHMI cluster
Using **nano** to create a **.qsub** file<br/>
Type in the following code:
```bash
#!/bin/bash
#PBS -l walltime=200:00:00
#PBS -l nodes=1:ppn=4

module load Trimmomatic

for d in BI-F1-0-2*R1_merged.fastq.gz; do
  FASTQ_BASE=$(echo $d | sed s/'R1_merged.fastq.gz'//)
 
  java -jar /share/apps/Installs/walls/Trimmomatic-0.33/trimmomatic-0.33.jar PE 
  ${FASTQ_BASE}R1_merged.fastq.gz 
  ${FASTQ_BASE}R2_merged.fastq.gz 
  ${FASTQ_BASE}R1_paired.fastq.gz 
  ${FASTQ_BASE}R1_unpaired.fastq.gz 
  ${FASTQ_BASE}R2_paired.fastq.gz 
  ${FASTQ_BASE}R2_unpaired.fastq.gz 
  ILLUMINACLIP:TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3
done
```
