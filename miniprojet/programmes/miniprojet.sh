#!/bin/bash

if [ $# -ne 1 ] ;then
	echo "Erreur : Il faut entrer un argument svp."
	exit
fi

url_fichier="$1"

count=0
while read -r line;
do
	if ! echo "$line" | grep -qE '^https?://';then
		line="https://$line"
	fi

	((count++))

	code_HTTP=$(curl -I -s "$line" | head -n 1 | awk '{print $2}')
	if [ -z "$code_HTTP" ] ;then
		code_HTTP="none"
	fi

	nomb_mots=$(curl -s "$line" | wc -w)

	line_for_encodage=$line
	encodage_page=$(curl -I -s "$line_for_encodage" | grep content-type: | cut -d= -f2)
	if [ -z "$encodage_page" ] ;then
		encodage_page="none"
	fi


	echo -e -n "${count}\t${line}\t${code_HTTP}\t"
	echo "${nomb_mots}	${encodage_page}"
done < "$url_fichier"
