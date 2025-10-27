#!/bin/bash

CHEMIN="$HOME/cours/plurital/PPE1-2025/miniprojet"

# Validation des arguments
if [ $# -ne 2 ]
then
     echo "le nombre d'arguments est incorrect !"
     exit
fi


echo "arguments donnés" : $1 $2

#Chemin d'accès au fichier de données en entrée
FICHIER_URLS=$1
#Nom du fichier de sortie
FICHIER_TSV=$2

# Vérifions si le fichier d'entrée existe
if [ ! -f $CHEMIN/$FICHIER_URLS ]
then
    echo "le fichier n'existe pas !"
    exit
fi

#Variable OUT pointant vers le fichier tsv pour l'écriture des données
OUT="$CHEMIN/tableaux/$FICHIER_TSV"
: > "$OUT"

OK=0
NOK=0

#Lecture du fichier ligne à ligne
while read -r LINE;
do #Pour chaque ligne (URL) du fichier d'URLs courant
  if [[ $LINE =~ ^https?:// ]]; # Vérifie la validité de l'URL
  then
	# code HTTP de réponse à la requête
	HTTP_CODE="$(curl -s -I $LINE | grep "HTTP" | cut -d' ' -f2)"
	# encodage de la page, s’il est présent
	CONTENT_TYPE="$(curl -s -I $LINE | grep -i "charset" | cut -d'=' -f2| tr -d '\r[:space:]')"
	# nombre de mots dans la page
	NOMBRE_MOTS="$(lynx -dump  $LINE | wc -w | xargs | grep -v '^[A-Za-z]')"
	# écriture de la ligne dans le fichier tsv avec des tabulations et un retour à la ligne
	printf "%d\t%s\t%s\t%s\t%s\n" "$OK" "$LINE" "$HTTP_CODE" "$CONTENT_TYPE" "$NOMBRE_MOTS">> "$OUT"
	# additionne le comptage
    OK=$(expr $OK + 1)
  else
    NOK=$(expr $NOK + 1)
    continue
  fi
done < "$CHEMIN/$FICHIER_URLS"

echo "$OK URLs et $NOK lignes douteuses"

