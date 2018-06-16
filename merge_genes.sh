for gene in $1/*.fas
do
	cat $gene |awk '/^>/ {if(N>0) printf("\n"); printf("%s\n",$0);++N;next;} { printf("%s",$0);} END {printf("\n");}' |\
	while read line
		do
		    if [[ ${line:0:1} == '>' ]]
		    then
			temp=${line#>}
			outfile=$1/genome_${temp%%_*}.fa
			if [[ ! -f $outfile ]]
			then
				echo ${line%%_*} > $outfile
			fi
		    else
			echo $line >> $outfile
		    fi
	done
done
