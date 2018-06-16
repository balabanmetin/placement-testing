source activate three
for d in `seq 0 50`
do
	cat $1/query/dist-genome_$d.fa.fq.txt | sed 's/genome_\([0-9]\)/\1/'| sed 's/\([0-9]\).fa.fq/\1/' > $1/query/$d.dist
done
for rep in `seq 0 4`
do
        mkdir $1/query/$rep
        mkdir $1/query/$rep/{ME,LSE}
	rm $1/query/$rep/queries.txt
	for i in `seq 1 10`; do echo $(($i + 10 * $rep)) >> $1/query/$rep/queries.txt; done
        cat $1/subs_param.txt | xargs -I% python3 ~/placement/scale_s_tree.py $1/s_tree.trees %;
        paste -s -d ' ' $1/query/$rep/queries.txt | xargs nw_prune $1/s_tree.trees.scaled > $1/query/${rep}/backbone.tree
	cat $1/query/$rep/queries.txt | xargs -P 8 -I% sh -c "python3 ~/apples/least_squares_placement.py $1/query/${rep}/backbone.tree $1/query/%.dist 0 > $1/query/$rep/LSE/placement_%.nwk"
	cat $1/query/$rep/queries.txt | xargs -P 8 -I% sh -c "python3 ~/apples/least_squares_placement.py $1/query/${rep}/backbone.tree $1/query/%.dist 1 > $1/query/$rep/ME/placement_%.nwk"
done
#cat $1 | sed 's/genome_\([0-9]\)/\1/'| sed 's/\([0-9]\).fa.fq/\1/';
