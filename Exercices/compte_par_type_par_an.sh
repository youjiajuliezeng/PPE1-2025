#!/bin/bash

DATADIR=$1
PRESCRIPT=$2
entite=$3

cd $DATADIR
echo "Nous sommes ici."
pwd

echo "2016 : $($PRESCRIPT 2016 $entite)"
echo "2017 : $($PRESCRIPT 2017 $entite)"
echo "2018 : $($PRESCRIPT 2018 $entite)"
