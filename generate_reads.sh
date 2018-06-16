cov=1
echo 'ref query' | xargs -n1 echo | xargs -I%  mkdir $1/%
#cat $2 | xargs -P 6 -I%  mv $1/genome_%.fa $1/query
cp $1/genome_*.fa $1/ref/
ls $1/ref/genome_*.fa   | xargs -P 6 -n1 echo | xargs -P 6 -I% art_illumina -na -i % -l 100 -f $cov -rs 42 -o $(basename %)
ls $1/ref/genome_*.fq   | xargs -P 6 -n1 echo | xargs -P 6 -I% mv % %.fastq
rm $1/ref/genome_*.fa
