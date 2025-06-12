
# Welcome to the Bioinformatics Cheatsheet

Hi all, this is me documenting some of the useful `awk` and `sed` commands that can be used in Linux-Ubuntu for bioinformatics tasks. Along with this, I will be adding all my bioinformtics command lines used for NGS data analysis for the process. My edition has modified and revised this. Thank you!

## Table of Contents

- [Basic File Operations](#basic-file-operations)
- [File Format Conversion & Counting](#file-format-conversion--counting)
- [Grouping & Sorting Sequences](#grouping--sorting-sequences)
- [awk & sed for Bioinformatics](#awk--sed-for-bioinformatics)
- [Aliases for Navigation](#aliases-for-navigation)
- [References](#references)

## Basic File Operations
Here are some fundamental commands for file operations:


wc -l filename                   # Count the number of lines in a file
ls | wc -l                       # Count the number of files in the current directory
tac filename                     # Print the file in reverse line order
rev filename                     # Reverse each line in the file
head filename                    # Print the first 10 lines of the file
tail filename                    # Print the last 10 lines of the file
cat filename                     # Print the entire file
cd /path/to/directory            # Change directory
cd ~                             # Go to the home directory
cat file1 file2 ... > out        # Concatenate files into one output file
paste file1 file2 > out          # Merge two files horizontally


---

## File Format Conversion & Counting

!!                                # Run the previous bash command
grep 'pattern' filename           # Print lines containing 'pattern' in the file
uniq -u inputfile > out           # Print only unique lines from a sorted input file
uniq -d inputfile > out           # Print only duplicate lines from a sorted input file
cat $file | sort -u | wc -l       # Count unique lines in a file
shuf file.txt | head -n 20        # Randomly shuffle lines and print the top 20


---

## Grouping & Sorting Sequences

grep '>' filenameA > list1                               # List sequence names from file A (e.g., FASTA headers)
grep '>' filenameB > list2                               # List sequence names from file B
cat list1 list2 > tmp                                    # Concatenate lists
sort tmp > tmp1                                          # Sort the combined list
uniq -u tmp1 > uniq                                      # Unique entries (A-B and B-A)
uniq -d tmp1 > double                                    # Intersection (A ∩ B)
cat uniq double > Union                                  # Union (A U B)
cat list1 double > tmp; sort tmp | uniq -u > list1uniq    # Entries unique to list1 (A - B)
cat list2 double > tmp; sort tmp | uniq -u > list2uniq    # Entries unique to list2 (B - A)


---

## awk & sed for Bioinformatics

### awk Examples

awk '{ print NF ";" $0 }'               # Print the number of fields per line, then the line
awk '{ print $NF }'                     # Print the last field of each line
awk 'NF > n'                            # Print lines with more than n fields
awk '$NF > n'                           # Print lines where the last field is greater than n
awk '{ print $1, $2 }' filename         # Print the first two fields of each line
awk '{tmp = $1; $1 = $2; $2 = tmp; print }'   # Swap the first two fields
awk '{ for (i=NF; i>0; i--) printf("%s ", $i); printf ("\n") }'   # Print fields in reverse order
awk '{ $2 = ""; print }'                # Delete the second field
awk '$5 == "cellvalue"'                 # Print lines where the 5th field equals "cellvalue"
awk '$5 != "cellvalue"'                 # Print lines where the 5th field does not equal "cellvalue"
awk '$6 ~ /^[a-f]/'                     # Print lines where the 6th field matches a regex
awk '$6 !~ /^[a-f]/'                    # Print lines where the 6th field does not match a regex
awk '$3>$5' file                        # Print rows where column 3 is greater than column 5
awk 'NR>1' input.txt                    # Print all lines except the first
awk 'NR>=20&&NR<=80' input.txt          # Print lines 20 to 80
awk '{print $0,$4+$5}' input.txt        # Add columns 4 and 5 and print the result at the end of each row



### sed Examples

sed -n '20p'                            # Print only line number 20
sed -n '20,24p'                         # Print lines 20 to 24 (inclusive)
sed 20q                                 # Print the first 20 lines


### cut Example

cut -f n1,n2,n3.. inputfile > out       # Extract specified columns (fields) from a file
cut -d ',' -f n1,n2.. inputfile > out   # Use a different delimiter (e.g., comma)




---

## Aliases for Navigation

alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias ......='cd ../../../../../'
alias fp='readlink -f'                  # For finding the path of all the files

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

