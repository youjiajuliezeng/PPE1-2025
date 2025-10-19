#!/bin/bash

if [ $# -ne 3 ]; then
    echo "Erreur : Vous devez fournir trois arguments."
    echo "Usage : $0 <chemin_donnees> <script_precedent> <entite>"
    echo "Exemple : $0 ./data ./compte_entite.sh Location"
    exit 1
fi

DATADIR=$1
PRESCRIPT=$2
entite=$3

if [ ! -d "$DATADIR" ]; then
    echo "Erreur : Le dossier '$DATADIR' n'existe pas."
    exit 1
fi

if [ ! -f "$PRESCRIPT" ]; then
    echo "Erreur : Le script '$PRESCRIPT' n'existe pas."
    exit 1
fi

if [ ! -x "$PRESCRIPT" ]; then
    echo "Erreur : Le script '$PRESCRIPT' n'est pas exécutable."
    echo "Astuce : utilisez 'chmod +x $PRESCRIPT' pour le rendre exécutable."
    exit 1
fi

echo "2016 : $($PRESCRIPT $DATADIR 2016 $entite)"
echo "2017 : $($PRESCRIPT $DATADIR 2017 $entite)"
echo "2018 : $($PRESCRIPT $DATADIR 2018 $entite)"
