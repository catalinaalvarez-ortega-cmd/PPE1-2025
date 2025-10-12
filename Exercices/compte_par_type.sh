#!/bin/bash

echo "argument donné : $1"

TYPE=$1

echo "Nombre de "$TYPE" en 2016:"
grep -r "$TYPE" 2016/ | wc -l

