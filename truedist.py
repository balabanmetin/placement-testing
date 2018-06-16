import sys
import dendropy

if __name__ == "__main__":
	tree_fp = sys.argv[1]
	query = sys.argv[2]
	tree = dendropy.Tree.get(path=tree_fp, schema="newick", rooting="default-rooted")
	pdc = tree.phylogenetic_distance_matrix()
	t2 = None
	for i, t1 in enumerate(tree.taxon_namespace):
		if t1.label == query:
			t2 = t1
	for i, t1 in enumerate(tree.taxon_namespace):
		print("%s\t%s" % (t1.label, pdc(t1, t2)))
