---
Title: "Bioinformatics One-Liners"
Description: "Revised Bioinformatics Linux Commands"
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

## References

* [Useful Linux Oneliners for Bioinformatics](http://gettinggeneticsdone.blogspot.com/2013/10/useful-linux-oneliners-for-bioinformatics.html#comments)
* [SED Command Cheatsheet](http://sed.sourceforge.net/sed1line.txt)
* [SeqTK GitHub](https://github.com/lh3/seqtk)
* [BioUnix by Heng Li](http://lh3lh3.users.sourceforge.net/biounix.shtml)
* [Genomics Array Bash Oneliners](http://genomespot.blogspot.com/2013/08/a-selection-of-useful-bash-one-liners.html)
* [Bioinformatics Gene Annotations Magic](http://biowize.wordpress.com/2012/06/15/command-line-magic-for-your-gene-annotations/)
* [Unix/Perl Oneliners for Bioinformatics](http://genomics-array.blogspot.com/2010/11/some-unixperl-oneliners-for.html)
* [BioExpress: Split Multi-FASTA](http://bioexpressblog.wordpress.com/2013/04/05/split-multi-fasta-sequence-file/)
* [Command Line Fu](http://www.commandlinefu.com/)

