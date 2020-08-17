#!/usr/bin/env bash

function download_datasets {
    if [[ -d "$1" ]]; then
        echo "Baixando arquivo de 2006"
        wget -q 'https://dataverse.harvard.edu/api/access/datafile/:persistentId?persistentId=doi:10.7910/DVN/HG7NV7/EPIFFT' -O "${1}/2006.csv.bz2"
	bzip2 -d 2006.csv.bz2
	echo "Baixando arquivo de 2007"
        wget -q 'https://dataverse.harvard.edu/api/access/datafile/:persistentId?persistentId=doi:10.7910/DVN/HG7NV7/2BHLWK' -O "${1}/2007.csv.bz2"
        bzip2 -d 2007.csv.bz2
	echo "Baixando lista de aeroportos com atraso"
	wget -q 'https://dataverse.harvard.edu/api/access/datafile/:persistentId?persistentId=doi:10.7910/DVN/HG7NV7/XTPZZY'
	exit 0
    else
        echo "Destino do download não existe"
        exit 1
    fi
}
