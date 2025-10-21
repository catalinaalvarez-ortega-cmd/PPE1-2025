#!/bin/bash

#Les fichiers attendus existent-ils ?
#Les arguments ont-ils le bon format ?
#Arrêter l’execution du script à tout moment avec la commande exit

CHEMIN="$HOME/cours/plurital/PPE1-2025/exercice_1/ann"

ANNEE=$1
MOIS=$2
NOMBRE=$3


if [ $# -ne 3 ]
then
     echo "probleme !"
     exit
fi

if [ ! -d $CHEMIN/$ANNEE/$MOIS ]
then
    echo "le dossier n'existe pas !"
    exit
fi


echo "Classement de $NOMBRE lieux les plus cités, années : $ANNEE, mois : $MOIS"
grep -r "Location" $CHEMIN/$ANNEE/$MOIS | cut -f3- | sort | uniq -c | sort -n| tail -n "$NOMBRE"


