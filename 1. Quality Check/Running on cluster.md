# Running fastQC on HHMI cluster
First `gunzip` all of the files you copied on your directory:
`gunzip BI-F1-0-1-R1.fastq.gz`

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
Type `qstat` to check on it  

When it completes, check on the file put in your directory: 
`nano hostname.pbs.o46193`

To move fastqc reports to your Desktop:
`scp wheaton0X@147.73.20.125:~/*.html ~/Desktop`

Now rezip the .fastq files 
`gzip BI-F1-0-1-R2.fastq`  

## NOTE
Make sure .qsub file and fastq files (*.fq.gz, *.fastq.gz, *.fastq) are stored on the same directory. <br/>
Otherwise, modification must be made. 
