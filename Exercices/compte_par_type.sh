#!/bin/bash

if [ $# -ne 3 ]; then
    echo "Erreur : Vous devez fournir trois arguments."
    echo "Usage : <chemin> <annee> <entite>"
    echo "Exemple : ./data 2018 Location"
    exit 1
fi

chemin=$1
annee=$2
entite=$3

if [[ "$annee" != "2016" && "$annee" != "2017" && "$annee" != "2018" ]]; then
    echo "Erreur : L'année doit être 2016, 2017 ou 2018."
    exit 1
fi

cat "${chemin}/${annee}"*.ann | grep "$entite" | wc -l