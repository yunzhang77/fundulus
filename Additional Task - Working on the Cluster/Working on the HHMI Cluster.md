## Working on the HHMI Cluster:

**To get on the Cluster:**
`ssh 147.73.20.125 -l wheaton02`

(change password using `passwd`)

**To get Files from shared folder to your personal directory:**  
`/home/sharedData/wheaton/FheData`  
(copy your files from path above)  
`cp /home/sharedData/wheaton/FheData/BI-F1-0-1_AGCGATAG-AGGCGAAG_L001_R1_001.fastq.gz BI-F1-0-1-R1.fastq.gz`

**Type nano something.qsub and write a script with the following format:**
```
#!/bin/bash
#PBS -k o
#PBS -l walltime=200:00:00
#PBS -l nodes=1:ppn=4
(OR #PBS -l nodes=2:ppn=8,walltime=01:00)
#PBS -N pbs
#PBS -j oe
#PBS -V
module load openmpi-1.6.3
module load open64
module load fastqc
mpirun fastqc *.fastq
```

**Then type:**
`qsub fastqc.qsub`  

`qstat` to check on it

When it completes, check on the file put in your directory: 
`nano hostname.pbs.o46193`
