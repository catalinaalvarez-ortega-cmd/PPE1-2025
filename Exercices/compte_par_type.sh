#!/bin/bash

CHEMIN="$HOME/cours/plurital/PPE1-2025/exercice_1/ann"

TYPE=$1

if [ ! -d $CHEMIN ]
then
    echo "le dossier n'existe pas !"
    exit
fi

if [ $# -ne 1 ]
then
     echo "le nombre d'arguments est incorrect !"
     exit
fi

echo "Nombre de "$TYPE" en 2016:"
grep -r "$TYPE" $CHEMIN/2016/ | wc -l

