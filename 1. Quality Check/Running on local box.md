# Running fastQC on local linux box
Create a .sh file and type:
```
#!/bin/bash

for d in Desktop/fastq/*.fastq; do
  fastqc $d
done
```
## NOTE
If using this script, all .fastq files should be stored in a folder called 'fastq' on the desktop. 
OR filepath could be changed to adapt to new file location.

