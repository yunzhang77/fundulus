# Running Trimmomatic on HHMI Cluster
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

# Another way to run Trimmomatic on HHMI Cluster
```
#!/bin/bash
#PBS -k o
#PBS -l nodes=2:ppn=8,walltime=200:00:00
#PBS -N trim
#PBS -j oe
#PBS -V
module load openmpi-1.6.3
module load open64
module load Trimmomatic

mpirun
java -jar /share/apps/Installs/walls/Trimmomatic-0.33/trimmomatic-0.33.jar PE -phred33 BI-F1-200-3_CGGCTATG-CAGGACGT_L001_R1_001.fastq.gz BI-F1-200-3_CGGCTATG-CAGGACGT_L001_R2_001.fastq.gz output_forward_paired.fq.gz output_forward_unpaired.fq.gz output_reverse_paired.fq.gz output_reverse_unpaired.fq.gz ILLUMINACLIP:TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36

```
**NOTE:** If you run more than these 2 files (a forward and reverse file) you either must run this bash script again with the new file names and a different name for the output files (so they don’t write over the output files you just made) OR copy and paste another of the following into your script for each additional foward and reverse files:
```
mpi
java -jar /share/apps/Installs/walls/Trimmomatic-0.33/trimmomatic-0.33.jar PE -phred33 BI-F1-200-3_CGGCTATG-CAGGACGT_L001_R1_001.fastq.gz BI-F1-200-3_CGGCTATG-CAGGACGT_L001_R2_001.fastq.gz output_forward_paired.fq.gz output_forward_unpaired.fq.gz output_reverse_paired.fq.gz output_reverse_unpaired.fq.gz ILLUMINACLIP:TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36

```


# Third way to run Trimmomatic on HHMI Cluster
```
#!/bin/bash
#PBS -k o
#PBS -l nodes=2:ppn=8,walltime=200:00:00
#PBS -N trim
#PBS -j oe
#PBS -V
module load openmpi-1.6.3
module load open64
module load Trimmomatic

for d in BI-F1-0-2*R1_merged.fastq.gz; do

  FASTQ_BASE=$(echo $d | sed s/'R1_merged.fastq.gz'//)

  java -jar /share/apps/Installs/walls/Trimmomatic-0.33/trimmomatic-0.33.jar PE ${FASTQ_BASE}R1_merged.fastq.gz ${FASTQ_BASE}R2_merged.fastq.gz ${FASTQ_BASE}R1_paired.fastq.gz ${FASTQ_BASE}R1_unpaired.fastq.gz ${FASTQ_BASE}R2_paired.fastq.gz ${FASTQ_BASE}R2_unpaired.fastq.gz ILLUMINACLIP:TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3

done
```
**NOTE:** This script only handles two files at a time, add different files and different output names to get trimmomatic to run twice in the same script!

## Now...
unzip the paired forward and reverse files that were output (use gunzip) and run FastQC again on those paired files!
**Note:** change .fastq to .fq in your bash script to run FastQC
(You don’t necessarily need to gunzip files to run FastQC.)

