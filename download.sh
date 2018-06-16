for i in `seq -w 1 10`
do
  mkdir $i
  scp calab:~/../mrabiee/Placement/Placement-100K/$i/s_tree.trees.scaled ./$i
  scp -r calab:~/../mrabiee/Placement/Placement-100K/$i/query ./$i
done
