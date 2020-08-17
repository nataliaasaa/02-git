#!/usr/bin/env bash
source functions.sh
file="$2"
while getopts ":dtn" opt; do
    case ${opt} in
        d ) # process option h
            shift # Removes de First Argument from the queue
            download_datasets $1
        ;;
        t ) # numero de vôos com atraso
            awk -F "\"*,\"*" '$15>0' $file.csv | wc -l
	;;
	n ) # lista de aeroportos com atraso
	    a=`awk -F "\"*,\"*" '{ if ($15 > 0) print $18 }' $file.csv | sort | uniq -w 3` 
	    b=`awk -F "\"*,\"*" '{ print $1 }' airports.csv`
	    echo "Lista de aeroportos com atraso no ano indicado: "
	    awk -F "\"*,\"*" '{ if ($a == $b) print $2 }' airports.csv
	;;
        \? ) echo "Usage: flight-delays.sh [-d] [-t] [-n]"
        ;;
  esac
done

