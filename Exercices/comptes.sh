#!/bin/bash

echo "argument donné" : $1



CHEMIN="$HOME/cours/plurital/PPE1-2025/exercice_1/ann"

echo "location 2016 :"
grep -r "Location" $CHEMIN/2016 | wc -l

echo "location 2017 :"
cat $CHEMIN/2017/*/* | grep "Location" | wc -l

echo "location 2018 :" 
grep -r "Location" $CHEMIN/2018/ | wc -l
    


