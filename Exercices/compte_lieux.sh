#!/bin/bash

ANNEE=$1
MOIS=$2
NOMBRE=$3

echo "Classement de $NOMBRE lieux les plus cités, années : $ANNEE, mois : $MOIS"
grep -r "Location" $ANNEE/$MOIS | cut -f3- | sort | uniq -c | sort -n| tail -n "$NOMBRE"
