# Running Trimmomatic on local Linux box
Type directly on Teminal:
```
java -jar /usr/share/java/trimmomatic-0.35.jar PE -phred33 

BI-F1-0-1_AGCGATAG-AGGCGAAG_L001_R1_001.fastq.gz BI-F1-0-1_AGCGATAG-AGGCGAAG_L001_R2_001.fastq.gz 

output_forward_paired.fq.gz output_forward_unpaired.fq.gz output_reverse_paired.fq.gz output_reverse_unpaired.fq.gz

LEADING:3 TRAILING:3
```
## Instruction on modifying code
The first line: run Trimmomatic <br/>
The second line: fastq files of interest<br/>
The third line: output file names/layout<br/>
The forth line: Trimming specification

## OUTPUT
After running, the following output should appear on the terminal
```
TrimmomaticPE: Started with arguments:
 -phred33 BI-F1-0-1_AGCGATAG-AGGCGAAG_L001_R1_001.fastq.gz BI-F1-0-1_AGCGATAG-AGGCGAAG_L001_R2_001.fastq.gz 
 output_forward_paired.fq.gz output_forward_unpaired.fq.gz output_reverse_paired.fq.gz output_reverse_unpaired.fq.gz 
 LEADING:3 TRAILING:3
 
Multiple cores found: Using 4 threads

Input Read Pairs: 2606633 Both Surviving: 2559506 (98.19%) Forward Only Surviving: 46328 (1.78%) 
                          Reverse Only Surviving: 759 (0.03%) Dropped: 40 (0.00%)
                          
TrimmomaticPE: Completed successfully
```
## NOTE
* Discard unpaired reads files & extract paired reads files
* Re-run FastQC on these paired reads files to verfify improved result
