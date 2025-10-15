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



