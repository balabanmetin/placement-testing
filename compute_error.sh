for i in `seq -w 1 10`
do 
  for j in `seq 0 4`
  do
    for k in `seq 1 10`
    do
      taxa=$(($j * 10 + $k))
      echo -n "2000 $i $taxa ";  compareTrees.missingBranch $i/query/$j/LSE/placement_$taxa.nwk $i/s_tree.trees.scaled --simplify
    done
  done
done
