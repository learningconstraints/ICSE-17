#In this experiment we want data for three oracles sizes in the datasets and we step each 1% of the total number of configurations in the training set.

for f in ../datasets/*.csv
do
	a=($(wc $f))
	lines=${a[0]}
	if [ $(basename $f) == x264.csv ]
	then 
		for perf in Watt Energy SSIM PSNR Speed Size Time
		do
#				#echo $f $perf $oracle
				./helpers/sensitivity.py $f $perf 1 $lines $(( $lines/100 )) ./data/$perf-$(basename $f) &
		done
		wait
	elif [ $(basename $f) == SaC.csv ]
	then
#		for perf in maxoptcyc maxlur maxwlur maxprfur maxae initmheap initwheap compile-exit compile-real compile-user compile-ioin compile-ioout compile-maxmem compile-cpu compile-size run-exit run-real run-user run-maxmem run-cpu
#                do
#                               ./helpers/sensitivity.py $f $perf 1 $lines $(( $lines/100 )) ./data/$perf-$(basename $f) &
#                        	#echo $f $perf $oracle
#			wait
#                done
		echo "Sac"
	else
        	        ./helpers/sensitivity.py $f perf  1 $lines $(( $lines/100 )) ./data/$(basename $f) &

        fi
done
wait
