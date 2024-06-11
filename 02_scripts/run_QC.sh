nextflow run \
	RNA_seq/qc/qc.nf \
	-w /Users/marieke/Documents/work \
	-profile local \
	--out_dir /Volumes/INTENSO/05_HD/QC \
	--in_reads '/Volumes/INTENSO/05_HD/data/*_{1.fastq.gz,2.fastq.gz}'