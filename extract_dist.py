import pandas as pd
import sys


df = pd.read_csv(sys.argv[1], index_col = 0, delimiter = "\t")
df.rename(lambda x: x.split("_")[0], axis='columns')
df.rename(lambda x: x.split("_")[0], axis='index')
print(df)
#df.to_csv(sys.stdout, sep = "\t")
