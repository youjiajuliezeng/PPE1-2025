#!/bin/bash

echo "chemin donne : $1"

CHEMIN=$1

for Annee in 2016 2017 2018
do
    echo "Nombre de lieux en $Annee : "
    cat ${CHEMIN}/${Annee}*.ann | grep Location | wc -l
done
