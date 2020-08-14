#!/usr/bin/env bash
source functions.sh
file="$2"
while getopts ":dt" opt; do
    case ${opt} in
        d ) # process option h
            shift # Removes de First Argument from the queue
            download_datasets $1
        ;;
        t ) # process option t
            awk -F "\"*,\"*" '$15>0' $file.csv | wc -l
	;;
        \? ) echo "Usage: flight-delays.sh [-d] [-t]"
        ;;
  esac
done

