#!/bin/bash

if [ $# -ne 1 ] ;then
	echo "Erreur : Il faut entrer un argument svp."
	exit
fi

url_fichier="$1"
output="../tableaux/tableau-fr.tsv"

echo -e "Nomb\tURL\tcode_HTTP\tnomb_mots\tencodage_page">"$output"

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

	echo -e "${count}\t${line}\t${code_HTTP}\t${nomb_mots}\t${encodage_page}" >> "$output"

done < "$url_fichier"
