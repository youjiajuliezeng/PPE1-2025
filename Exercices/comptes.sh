#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Erreur : Vous devez fournir un chemin en argument."
    exit 1
fi

CHEMIN=$1

if [ ! -d "$CHEMIN" ]; then
    echo "Erreur : Le chemin '$CHEMIN' n'existe pas ou n'est pas un dossier."
    exit 1
fi

echo "chemin donne : $1"

for Annee in 2016 2017 2018
do
    echo "Nombre de lieux en $Annee : "
    cat ${CHEMIN}/${Annee}*.ann | grep Location | wc -l
done