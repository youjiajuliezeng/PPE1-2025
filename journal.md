# Journal de bord du projet encadré


## Travail 4 octobre 2025
J'ai réappris le git pull.


## Travail 5 octobre 2025
Aujourd'hui, j'ai réappris à utiliser git pull, git add, git commit, git push pour créer et modifier des files sur mon système et les synchroniser pour le github.


## Travail 14 octobre 2025
### 1.Format des caractères
Lors de l’écriture de la ligne shebang dans un script, il est important de veiller à ce que le caractère « ! » soit en demi-chasse (caractère ASCII) et non en pleine chasse (utilisé en chinois).

### 2.Sauvegarde du script avant exécution
L’énoncé demandait d’afficher la réponse sur la sortie standard, soit sur l’écran, mais dans un premier temps, j’avais configuré le script pour écrire le résultat dans un fichier texte (.txt).

Après modification, j’ai constaté qu’aucun résultat ne s’affichait encore dans le terminal. Je me suis ensuite rappelée qu’il fallait enregistrer le script avant de l’exécuter, afin que les modifications soient bien prises en compte.

### 3.Le « / » après le nom du dossier : e.g. mv  ~/Downloads/diapo_1  ~/Document_1/

### 4.Variables
####  (1)Affectation : e.g. annee=$1
####  (2)Utilisation : e.g. $annee ou ${annee}
####  (3)Stockage du résultat de commande dans un variable 命令替换: la syntaxe $() permet de transformer le résultat d’une commande en variable. e.g.fichier=$(ls ./data_exercices)
####  (4)Points d’attention :
①Aucune espace ne doit apparaître autour du signe « = » lors de l’affectation.

②Lorsque la variable risque d’être concaténée avec d’autres caractères, il est préférable d’utiliser des accolades {}.

③Pour afficher la valeur d’une variable, ne pas oublier de la précéder du signe $, par exemple $fichier.

### 5.À propos de la commande cut
- (1)(.tsv) Si le séparateur est une tabulation : simplement cut -f3 (pour la 3ᵉ colonne) ou cut -d $'\t' -f3 (“$” pour être distingué de le pur string '\t')
- (2)(.csv) Si le séparateur est le point-virgule « ; » : cut -d ";" -f3

### 6.Astérisque *
Il est nécessaire de placer “*” entre guillemets(“”) pour indiquer à Bash de ne pas l’interpréter prématurément.

Exemple :
annee=$1
mois=$2
nombre=$3
fichier=$(ls ./${annee}_${mois}*.ann)

Si les arguments saisis sont : 2017 * 10, l’astérisque sera remplacé par tous les fichiers du répertoire courant, ce qui donnera une commande du type :
	
ls ./2017_2016_01_01-001.ann*.ann
	
En revanche, en saisissant 2017 "*" 10, l’astérisque est correctement interprété comme “02”, “09”, etc.

### 7.Caractères interdits dans les noms de fichiers “/” et “:”
En voulant enregistrer un fichier nommé Exercices/comptes sur GitHub, j’ai remarqué que la plateforme affichait le nom du fichier comme Exercices:comptes.

En effet, le caractère « / » n’est pas autorisé dans un nom de fichier, car il est interprété comme un séparateur de répertoire. GitHub le remplace donc automatiquement par un « : ».

Solution : recréer directement un dossier Exercices à l’aide de la commande mkdir, puis déplacer et renommer le fichier avec mv.

### 8.Mise à jour sur GitHub
Toutes les modifications effectuées localement doivent être manuellement synchronisées avec GitHub selon la procédure suivante :

 (1)Ajouter les fichiers à la zone de préparation (staging area) avec git add.

 (2)Enregistrer les modifications localement avec git commit (-m).

(3)Envoyer les changements sur GitHub avec git push.

Après ces étapes, les mises à jour deviennent visibles sur le site GitHub.

### 9. Il faut un espace après le “#” pour l'hiérarchie des titres dans le git ficher .md


## Travail 19 octobre 2025
### Explication des script codes
#!/usr/bin/bash #la ligne shebang pour dire à l'ordi qu'il faut utiliser le programme /bin/bash  
if [ $# -ne 1 ] #Si le nombre des paramètres n'est pas égal à 1  
then #Excuter les étapes suivantes  
echo " ce programme demande un argument " #Afficher la phrase sur le terminal  
exit #terminer le boucle "if" et retourner l'exit valeur  
fi  
FICHIER_URLS = $1 #définir le paramètre comme FICHIER_URLS  
OK =0 #initialiser le premier variable OK  
NOK =0 #initialiser le deuxième variable NOK  
while read -r LINE ; #Lire le fichier ligne par ligne et stocke chaque ligne dans la variable LINE  
do#Exécuter les étapes suivantes(dans le boucle while)  
echo " la ligne : $LINE " #Afficher la ligne lue 
if [[ $LINE =∼ ^ https ?:// ]] #Tester si la ligne commence par “http://” ou “https://”.  
then #Si oui  
echo " ressemble à une URL valide " #Afficher " ressemble à une URL valide "  
OK =$( expr $OK + 1) #executer OK=OK+1  
else #Sinon  
echo " ne ressemble pas à une URL valide " #Afficher " ne ressemble pas à une URL valide "  
NOK =$ ( expr $NOK + 1) ##executer NOK=NOK+1  
fi #terminer le boucle if  
done < $FICHIER_URLS #terminer le boucle while et indiquer les lignes à lire proviennent du $FICHIER_URLS  
echo " $OK URLs et $NOK lignes douteuses " #Afficher le nombre total d’URLs valides (OK) et de lignes douteuses (NOK).  


## Travail 22 octobre 2025
### git
C'est possible de faire un seul commit après avoir fini tous les 'git add'
### bash script
- = : Lors d’une affectation, ne pas mettre d’espace avant ni après le signe =
-  [  ] & ;then : Dans une structure if [ condition ]; then … fi, il faut :
  	1. mettre des espaces avant et après les crochets [ ],
  	2. placer then soit sur la ligne suivante, soit le séparer par un ;
- "$1" : Ajouter des guillemets autour des variables lorsque cela est nécessaire (par exemple pour un nom de fichier), afin d’éviter les problèmes liés aux caractères spéciaux. Exemple : url_fichier="$1"
- ((a++)) ou a+=1 ? : En bash, l’expression a+=1 n’est pas valable pour les calculs numériques (elle fait une concaténation de chaînes, comme 0, 01, 011, 0111…). Utiliser plutôt ((a++))
- -e \t pour un tab : Pour insérer une tabulation dans bash, utiliser la combinaison -e \t, où -e permet l’interprétation des caractères d’échappement
### http
bash   
bash-3.2$ curl -I https://fr.wikipedia.org/wiki/Atlas_(robot)  
bash: syntax error near unexpected token `('  
#les parenthèses "()" sont des caractères illégals dans le syntax bash, il est nécessaire par conséquent ici de mettre des guillemets autour de l'argument d'url, comme suivant :  
curl -I 'https://fr.wikipedia.org/wiki/Atlas_(robot)'  
- !Rappel : substitution de commande $()
 On peut utiliser awk pour extraire un colonne dans une line, et cut pour une certaine partie dans ce field  
- Problème dûr :
  J'ai entrée 'nomb_mots=$(curl -s "$line" | wc -w)  
	echo -e "${count}\t${line}\t${code_HTTP}\t${encodage_page}\t${nomb_mots}";'  
Mais  
le nombre est collé au début de l'URL à la place du 'http'  
e.g. 1        13920//fr.wikipedia.org/wiki/Robot     200     UTF-8  
2        4124://fr.wikipedia.org/wiki/Robot_de_cuisine  200     UTF-8

## Travail 6 novembre 2025
Dans le bash, un\ bash signifie "un bash"  
Conversion d'un fichier texte/tabulaire en fichier HTML en y intégrant les balises appropriées :  
Pour ce travail, j’ai saisi le code manuellement, ce qui m’a permis de mieux comprendre la structure et la hiérarchie d’un document HTML. Nous aborderons probablement par la suite l’écriture de scripts permettant d’automatiser ce processus, mais je ne maîtrise pas encore cette compétence.  
Au cours d'extraire les infos d'un HTML, pour éviter la mélange de l'entête et les contenus, on peut ajouter un fichier temporaire dans le script et le supprimer après.  
Ex.  
tmpfile=$(mktemp)  
code_encodage=$(curl -s -L -i -o "$tmpfile" -w "%{http_code}\n%{content_type}" "$line")
..."$code_encodage"...
rm -f "$tmpfile"

## Travail 17 novembre 2025
Quand il y a trop de "" dans le echo, il existera des interruptions. On peut remplacer le "" à l'extérieur par ''














