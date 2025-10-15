#!/bin/bash

echo "chemin donne : $1"

CHEMIN=$1

echo "Nombre de lieux en 2016 : "
cat ${CHEMIN}/2016*.ann | grep Location | wc -l
echo "Nombre de lieux en 2017 : "
cat ${CHEMIN}/2017*.ann | grep Location | wc -l
echo "Nombre de lieux en 2018 : "
cat ${CHEMIN}/2018*.ann | grep Location | wc -l
