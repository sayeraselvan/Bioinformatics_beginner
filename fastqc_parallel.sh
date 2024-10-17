#!/bin/bash

# Set the base directory
base_dir=""
output_dir="" #output directory to store all the reports

# Create the output directory if it doesn't exist

mkdir -p "$output_dir"

# this is how the file structure looked like
#     base_dir
# 	  |-> folder1
#		  |-> *.fq.gz 
#	  |-> folder2
#		  |-> *.fq.gz

# Loop through each folder in the base directory

for folder in "$base_dir"/*; do
  if [ -d "$folder" ]; then
    echo "Finding FASTQ files in: $folder"
    
    # Find all FASTQ files and run FastQC on each in parallel
    find "$folder" -name "*.fq.gz" | \
    parallel -j 8 fastqc {} -o "$output_dir"  # Adjust -j to control the number of parallel jobs

    # Check if FastQC was run successfully
    if [[ $? -eq 0 ]]; then
        echo "FastQC analysis completed for files in $folder."
    else
        echo "Failed to run FastQC in $folder."
    fi
  fi
done

echo "All FastQC analyses completed!"

