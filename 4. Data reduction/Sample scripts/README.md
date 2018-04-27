# Data Reduction Scripts

## rsem_trans2genome.sh
**Description:** Converts transcript .bam files to genome .bam files  
**Parameters:** reference - `rsem-tbam2gbam`  
                sample - `ref/star_fund_rsem`  
                output - `$d ${FILT_PATH}.genome.bam`  
**Input:** transcript .bam files  
**Output:** genome .bam files  

## index_test.sh
**Description:** Indexes the genome .bam files to allow calling of coordinates  
**Parameters:** samtools - `samtools`  
                samples we want to index - `index $d`  
**Input:** genome .bam files  
**Output:** indexed genome .bam files  

## view_test_superlong.sh
**Description:** Refining and reducing .bam files to scaffolds and contigs of interest.  
      *samtools: merges indexed genome .bam files into one .bam  
                 views each individual scaffold/contig of interest  
**Parameters:** 
      * piping views into single merge - `samtools merge -f ${FITH_PATH}`  
      *each view for different chromosomes - `<(samtools view `  
                    *.bam file - `-b`  
                    *sample file - `$d`  
                    *scaffold of interest - i.e. `NW_012234559.1)`  
**Input:** indexed genome .bam files  
**Output:** one merged .bam file  
                   
