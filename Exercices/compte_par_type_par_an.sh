#!/bin/bash

CHEMIN="$HOME/cours/plurital/PPE1-2025/exercice_1/ann"

TYPE=$1


if [ $# -ne 1 ]
then
     echo "probleme !"
     exit
fi


N=0

for ELEMENT in 2016 2017 2018
do
  N=$((N + 1))
  echo "Le ${N}ème élément est $ELEMENT"

    if [ ! -d $CHEMIN/$ELEMENT ]
    then
        echo "le dossier $ELEMENT n'existe pas !"
        exit
    fi
done


echo "Nombre de "$TYPE" en 2016:"
grep -r "$TYPE" $CHEMIN/2016/ | wc -l
echo "Nombre de "$TYPE" en 2017:"
grep -r "$TYPE" $CHEMIN/2017/ | wc -l
echo "Nombre de "$TYPE" en 2018:"
grep -r "$TYPE" $CHEMIN/2018/ | wc -l
