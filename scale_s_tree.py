import sys
import dendropy

if __name__ == "__main__":
	tree_fp = sys.argv[1]
	scale = float(sys.argv[2])
	tree = dendropy.Tree.get(path=tree_fp, schema="newick")
	tree.scale_edges(scale/2)
	tree.write(path=tree_fp + ".scaled", schema="newick")
