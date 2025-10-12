
#!/bin/bash

echo "argument donné : $1"

TYPE=$1

echo "Nombre de "$TYPE" en 2016:"
grep -r "$TYPE" 2016/ | wc -l
echo "Nombre de "$TYPE" en 2017:"
grep -r "$TYPE" 2017/ | wc -l
echo "Nombre de "$TYPE" en 2018:"
grep -r "$TYPE" 2018/ | wc -l
