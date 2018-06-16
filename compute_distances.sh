source activate two
cd $1
skmer reference -t -p 6 -s 1000000 ref
#rm ref/*.aln ref/*.fastq
ls ref/genome_*.fastq | xargs -P 6 -n1 echo | xargs -P 6 -I% skmer query -t -p 6 % library
rm ref/*.fastq
rm -r library
mv dist* query/
mv ref-dist* ref/

