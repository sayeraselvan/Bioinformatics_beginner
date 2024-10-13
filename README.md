---
title: "Bioinformatics One-Liners"
description: "Revised Bioinformatics Linux Commands"
---

# Welcome to the Bioinformatics Cheatsheet

Hi all, this is me documenting some of the useful `awk` and `sed` commands that can be used in Linux-Ubuntu for bioinformatics tasks. My edition has modified and revised this. Thank you!

## Basic File Operations
Here are some fundamental commands for file operations:

- `wc -l` : Count the number of lines in a file.
- `ls | wc -l` : Count the number of files in the current working directory.
- `head $filename` : Display the first 10 lines of the file.
- `tail $filename` : Display the last 10 lines of the file.

### Concatenation and Merging:
- `cat file1 file2 > outputfile` : Concatenate files back to back.
- `paste file1 file2 > outputfile` : Merge two files horizontally.

## Sequence Grouping and Sorting
Commands to group and sort sequences:

```bash
grep '>' filenameA > list1  # Extract sequence names from a file.
grep '>' filenameB > list2  # Extract sequence names from another file.
cat list1 list2 > tmp       # Concatenate two lists.
sort tmp > sorted_list      # Sort the combined list.
uniq -u sorted_list > uniq  # Get unique entries.
uniq -d sorted_list > double # Get duplicates.

alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
(i add the alias command lines onto our respective bash_profile so that i dont have to use alias everytime when i open my terminal)


### References; 

* <http;//gettinggeneticsdone.blogspot.com/2013/10/useful-linux-oneliners-for-bioinformatics.html#comments>
* <http;//sed.sourceforge.net/sed1line.txt>
* <https;//github.com/lh3/seqtk>
* <http;//lh3lh3.users.sourceforge.net/biounix.shtml>
* <http;//genomespot.blogspot.com/2013/08/a-selection-of-useful-bash-one-liners.html>
* <http;//biowize.wordpress.com/2012/06/15/command-line-magic-for-your-gene-annotations/>
* <http;//genomics-array.blogspot.com/2010/11/some-unixperl-oneliners-for.html>
* <http;//bioexpressblog.wordpress.com/2013/04/05/split-multi-fasta-sequence-file/>
* <http;//www.commandlinefu.com/>

