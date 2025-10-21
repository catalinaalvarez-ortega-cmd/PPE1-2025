#!/bin/bash

echo "argument donné" : $1

CHEMIN="$HOME/cours/plurital/PPE1-2025/exercice_1/ann"

if [ ! -d $CHEMIN ]
then
    echo "le dossier n'existe pas !"
    exit
fi

N=0
for ELEMENT in 2016 2017 2018
do
  N=$((N + 1))
  echo "Le ${N}ème élément est $ELEMENT"
  echo "location $ELEMENT :"
  cat $CHEMIN/$ELEMENT/*/* | grep "Location" | wc -l
done



#echo "location 2016 :"
#grep -r "Location" $CHEMIN/2016 | wc -l

#echo "location 2017 :"
#cat $CHEMIN/2017/*/* | grep "Location" | wc -l

#echo "location 2018 :" 
#grep -r "Location" $CHEMIN/2018/ | wc -l
    


