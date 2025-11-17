#!/bin/bash

if [ $# -ne 2 ] ;then
	echo "Erreur : Il faut entrer deux argument (le chemin vers le fichier d'urls & le chemin vers le tsv de sortie) svp."
	exit
fi

url_fichier="$1"
output="$2"

echo -e "
<html>
<head>
<body>
<table>
	<tr>
	<th>numéro</th>
	<th>URL</th>
	<th>HTTP code</th>
	<th>nombre de mots</th>
	<th>encodage de page</th>
	</tr>
" > tableaux/resultats.html

if [ ! -f "$url_fichier" ]; then
	echo "Ce programme demande un fichier."
	exit
fi


echo -e "Nomb\tURL\tcode_HTTP\tnomb_mots\tencodage_page">"$output"

count=0
while read -r line;
do
	if ! echo "$line" | grep -qE '^https?://';then
		line="https://$line"
	fi

	((count++)) #count=$(expr $count + 1)

	tmpfile=$(mktemp)

	code_encodage=$(curl -s -L -i -o "$tmpfile" -w "%{http_code}\n%{content_type}" "$line")

	code_HTTP=$(echo "$code_encodage" | head -n 1)
	if [ -z "$code_HTTP" ] ;then
		code_HTTP="none"
	fi

	encodage_page=$(echo "$code_encodage" | grep -E -o "charset=[^;[:space:]]*" | cut -d= -f2)
	if [ -z "$encodage_page" ] ;then
		encodage_page="none"
	fi

	nomb_mots=$(cat "$tmpfile" | lynx -dump -stdin -nolist | wc -w)

	rm -f "$tmpfile"

	echo -e "${count}\t${line}\t${code_HTTP}\t${nomb_mots}\t${encodage_page}" >> "$output"  #-e + \t

	echo -e "\t<tr>\n\t<td>${count}</td>\n\t<td><a href=\"${line}\" target=\"_blank\">${line}</a></td>\n\t<td>${code_HTTP}</td>\n\t<td>${nomb_mots}</td>\n\t<td>${encodage_page}</td>\n\t</tr>" >> tableaux/resultats.html

done < "$url_fichier"

echo -e "
</table>
</body>
</html>
" >> tableaux/resultats.html

