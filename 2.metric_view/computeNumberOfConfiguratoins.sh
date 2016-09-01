#In this experiment we want data for three oracles sizes in the datasets and we step each 1% of the total number of configurations in the training set.
echo file,configurations
for f in ../datasets/*.csv
do
	a=($(wc $f))
	lines=${a[0]}
	if [ $(basename $f) == x264.csv ]
	then 
		for perf in Watt Energy SSIM PSNR Speed Size Time
		do
			for oracle in 0.2 0.5 0.8
			do
 				echo $oracle-$perf-$(basename $f), $lines
			done
		done
		wait
	elif [ $(basename $f) == SaC.csv ]
	then
		for perf in maxoptcyc maxlur maxwlur maxprfur maxae initmheap initwheap compile-exit compile-real compile-user compile-ioin compile-ioout compile-maxmem compile-cpu compile-size run-exit run-real run-user run-maxmem run-cpu
                do
                        for oracle in 0.2 0.5 0.8
                        do      

				echo $oracle-$perf-$(basename $f), $lines
			done
			wait
                done
	else
	        for oracle in 0.2 0.5 0.8
                do
                                echo $oracle-$(basename $f), $lines
                done
		wait
        fi
done
wait
