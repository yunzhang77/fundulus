# Step 2. Trimming
![Screenshot](https://github.com/yunzhang77/fundulus/blob/master/Materials/Trimmomatic.png)
## Description
If raw fastq data have poor quality (per base sequence or GC content) or still have adapters attached, these sequence will be removed to improve overall read quality.

## INPUT
Raw fastq file. 
## OUTPUT
Paired end: 4 trimmed fastq file (forward paired, unpaired, reverse paired, unpaired).
## NOTE
This step could be run on either local Linux box or HHMI cluster. 
