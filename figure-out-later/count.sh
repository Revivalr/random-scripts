a=0 n=0; until [ $a == 10 ]; do if [ $n -lt 10 ]; then ((n=n+1)); echo $n; elif [ $n == 10 ]; then ((a=a+1)); n=0; fi; done
