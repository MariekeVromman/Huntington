# Huntington
This repo consists of the all scripts and analyses performed for the Huntington project of Christian Neri and Lucile Megret.
For this project, the data was downloaded and quality control was performed. No further analyses were performed.  

The sequencing data comes from a published [paper](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5984042/),  Langfelder et al. . All data is available on SRA with accesion number [PRJNA274985](https://www.ncbi.nlm.nih.gov/bioproject/274985).
The data is pA, sequenced in 2 batches, 40M reads per sample, strand-specific (TruSeq), ~ 200 samples from Huntington mice.  

In total, 208 samples:
 
- 144 knock-in mice (8\*6*3)
  - 8 replicate mice in each group (often 4 male and 4 female with one exception, see plot)
  - 6 different repeat nr KI (Q20, Q80, Q92, Q111, Q140, Q175)
  - 3 different ages (2m, 6m, 10m)
 
- 64 wild type mice (8*6 + 8 + 8)
  - 8 replicate mice in each group (4 males and 4 females)
  - 6 different groups of mice to be housed with (repeat nr KI (Q20, Q80, Q92, Q111, Q140, Q175))
  - 3 different ages, but only age 6m has mice living with all the repeat groups. Age 2m and 10m only have mice living with the Q20 repeat group

Based on QC:
- substantially less hits for 195_2 compared to the other fastq screen results (see 03_fastq_screen/SRR1795195_2_screen.html); longer reads for SRR1795195_1, but not SRR1795195_2 ???? (see 01_fastqc/SRR1795195_1_fastqc.html and 01_fastqc/SRR1795195_2_fastqc.html) => after discussion with C. Neri, we decided to **exclude sample 195_2** as it is truncated, and there are 2 other replicates available from the same condition.

- high dups for SRR1795124_1 and SRR1795124_2

This repository contains 3 folders
1. **data**  
This folders contains the downloaded fastq files and the results from the quality control. As this is a big folder, it is not entirely included in the github repo itself, but it is present on the hard disk. 

2. **scripts**  
This folder contains al scripts used on the cluster to generate the data in the `data` folder. The pipelines are stored in a separate GitHub repo: [RNA_seq](https://github.com/MariekeVromman/RNA_seq).

    - the `download_data.bash` script was used to take download all the samples from SRA
    - the `run_QC.sh` script that was used to run the QC


4. **data-analysis**  
This folder contains the R scripts used to analyse the data further, and to generate the figures.



