# Running fastQC on HHMI cluster
Using **nano** to create a **.qsub** file <br/>
Type in following code:
```bash
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
```
Then, type `qsub nameOfThisFile.qsub` on the terminal to submit the job.
## NOTE
Make sure .qsub file and fastq files (*.fq.gz, *.fastq.gz, *.fastq) are stored on the same directory. <br/>
Otherwise, modification must be made. 
