# Setting up SRA Toolkit on Ubuntu

## Downloading SRA Toolkit:

1. To download the current version of SRA Toolkit on your Linux, go to:
  
       http://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/current/sratoolkit.current-ubuntu64.tar.gz

2. Extract the tar file on your desktop  
`tar -vxzf sratoolkit.tar.gz` 

## Two ways of running SRA Toolkit on Linux
### By setting up PATH variable
In your terminal, type  
`export PATH=$PATH:$PWD/sratoolkit.2.4.0-1.mac64/bin`
  
Then, you could check if it is in the PATH variable by  

`echo $PATH`
`which fastq-dump`  

  
### By visiting SRA toolkit directory  
`cd sratoolkit.2.8.2-1-ubuntu64/bin`    

## Testing SRA Toolkit  
You could check if SRA Toolkit is currently working on your Linux by  
  
`fastq-dump --stdout SRR390728 | head -n 8`  
  
It should give you an output exactly like this:  
>@SRR390728.1 1 length=72
>CATTCTTCACGTAGTTCTCGAGCCTTGGTTTTCAGCGATGGAGAATGACTTTGACAAGCTGAGAGAAGNTNC  
>+SRR390728.1 1 length=72  
>;;;;;;;;;;;;;;;;;;;;;;;;;;;9;;665142;;;;;;;;;;;;;;;;;;;;;;;;;;;;;96&&&&(  
>@SRR390728.2 2 length=72 
>AAGTAGGTCTCGTCTGTGTTTTCTACGAGCTTGTGTTCCAGCTGACCCACTCCCTGGGTGGGGGGACTGGGT  
>+SRR390728.2 2 length=72   
>;;;;;;;;;;;;;;;;;4;;;;3;393.1+4&&5&&;;;;;;;;;;;;;;;;;;;;;<9;<;;;;;464262    
  
## Downloading RNAseq Data from SRA Database  
1. Go to https://www.ncbi.nlm.nih.gov/sra/  
2. Search for specific species name (e.g. fundulus heteroclitus)  
3. Click the one you would like to download  
4. Find the RUN# (e.g. SRR4431245) and write down this number  
5. On terminal,   
        `fastq-dump SRR4431245`  
   Then, the data should be downloaded to your current directory automatically.   
  
# Acknowledgements   
This document is modified based on the Wiki page of NCBI GitHub site (https://github.com/ncbi/sra-tools/wiki)  
