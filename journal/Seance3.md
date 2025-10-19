correction feuille d'exercices

echo "argument donne : $1"

echo "nombre de lieux en 2016 :"
cat "$CHEMIN/2016/"* | grep location | xc -l 


CHEMIN= il faut donner le chemin vers les fichiers 

EXERCICE 2:

DATADIR = $1 
ANNEE = $2
TYPE = $3

cat $ANNEE/*.ann ??? | grep "$TYPE" | wc -l 

cd $DATADIR
echo "Nous sommes ici" :
pdw

créer des varibales pour stocker la variable pour récuperer les résultat
$() commande ou pipeline, va être stocker dans la variable. 
A=$(bash ./compte.sh $DATADIR 2016 $TYPE)

|| => "ou"
&& => "et"


EXERCICE 3. 

sort = trier, ordre alphabetique
uniq -c = evite la répetition 

1. vérifier le bon nombre d'arguments : et puis le tester

condition :

if [$# -ne 4] 'nombre d'arguments passé au programme'
then 
     echo "probleme !"
     exit
fi 

2. verifier que DATADIR est bien le fichier de données

if [ ! -d $DATADIR]
then 
    echo "$DATADIR n'est pas un dossier"
    exit
fi

3.

if [! -d $DATADIR/2016 ]
then
     echo "$DATADIR n'est probablement pas le bon dossier"
     exit
fi




B=$(bash ./compte.sh $DATADIR 2017 $TYPE)



Validation des arguments

Les boucles 

N=0

for ELEMENT in a b c d
do
   N=$(expr $N + 1)
   echo "le $N ieme élément est $ELEMENT"
done


commenter l'exercice 4 : 

dans la condition on donne un nombre d'arguments dans le programme, ici 1 argument
qui va affichier ensuite l'echo qui veut dire  ce programme demande un argument + le nombre d'arguments

dans le deuxième exercice 
 on lui a attribué une valeur à l'argument à FICHIER_URLS = $1
 enuite OK et NOK 
 
                              
