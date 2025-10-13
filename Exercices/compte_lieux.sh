#!/bin/bash
annee=$1
mois=$2
nombre=$3
fichier=$(ls ./${annee}_${mois}*.ann)

echo "classement des lieux les plus cités: "
cat $fichier | grep Location | cut -f3 | sort | uniq -c | sort -nr | head -n $nombre
