#!/bin/bash

for d in Desktop/fastq/*.fastq; do
  fastqc $d
done

