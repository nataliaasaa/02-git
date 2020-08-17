#!/usr/bin/env bash
source functions.sh
file="$2"
while getopts ":dtns" opt; do
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
        s ) #Lista o nome do aeroporto na col1 e o número de atrasos na col2
	    echo "Numero de atrasos | Sigla do aeroporto"
	    awk -F "\"*,\"*" '{ if ($15 > 0) print $18 }' $file.csv | sort | uniq -c
	;;
	\? ) echo "Usage: flight-delays.sh [-d] [-t] [-n] [-s]"
        ;;
 esac
done

