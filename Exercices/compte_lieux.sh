#!/bin/bash

if [ $# -ne 4 ]
then
        echo "arguments incorrectes, il en faut 4"
        exit 1
fi

annee=$1
mois=$2
nombre=$3
datadir=$4
fichier=$(ls ${datadir}/${annee}_${mois}*.ann)

if ! [[ "$annee" =~ ^(2016|2017|2018)$ ]]; then
    echo "Erreur : L'année doit être 2016, 2017 ou 2018."
    exit 1
fi

if ! [[ "$mois" =~ ^(0[1-9]|1[0-2])$ ]]; then
    echo "Erreur : Le mois '$mois' n'est pas valide (doit être entre 01 et 12)."
    exit 1
fi

if ! [[ "$nombre" =~ ^[0-9]+$ ]]; then
    echo "Erreur : Le nombre '$nombre' doit être un entier positif."
    exit 1
fi

if [ ! -d "$datadir" ]; then
    echo "Erreur : Le dossier '$datadir' n'existe pas."
    exit 1
fi

echo "Voici les locations les $nombre plus fréquentes dans les données du $mois/$annee dans le répertoire $datadir."

echo "classement des lieux les plus cités: "
cat $fichier | grep Location | cut -f3 | sort | uniq -c | sort -nr | head -n $nombre
