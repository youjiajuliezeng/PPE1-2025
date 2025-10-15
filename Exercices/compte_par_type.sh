#!/bin/bash

annee=$1
entite=$2

cat "$annee"*.ann | grep "$entite" | wc -l
