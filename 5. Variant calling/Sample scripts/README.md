# Variant Analysis Scripts

## samtools_mpile_toll2.sh
**Description:** Builds the mpileup file for VCF calling out of the filtered .bam files from data reduction (step 4)  
**Parameters:**  
      * `samtools mpileup`  
      * To prevent strict measure for quality of alignment from messing up indels - `--no-BAQ`   
      * genome - `-f ref/GCF_000826765.1_Fundulus_heteroclitus-3.0.2_genomic.fa \`   
      * inputs - i.e. `${DATA_FOLDER}/filt_bams/BI-F1-0-1-star.genome_sorted.bam \`    
**Input:** Refined and reduced .bams of scaffolds and contigs wanted  
**Output:** mpileup file (multiple .bams)  

## VCF.sh
**Description:** Makes the VCF file from mpileup file  
**Parameters:**  
      * call jar by path - `java -jar /share/apps/Installs/walls/VarScan.v2.3.6.jar`  
      * cns (indels & SNPs) - `mpileup2cns myData_toll_filt.mpileup`  
      * output as vcf - `--output-vcf 1 >variants_filt.vcf`  
**Input:** mpileup file  
**Output:** VCF file  

