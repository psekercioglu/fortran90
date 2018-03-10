# Fortran 90
Il s'agit des TP de la programmation scientifique pour la mécanique.

## Détermination du nombre d'occurences d'entiers impairs dans une saisie 
Le programme appelé "<samp>nbentiersimpairs</samp>" demande à l'utilisateur de saisir au clavier des entiers non nuls. Il arrête la saisie quand l'utilisateur entre 0 au clavier. Il affiche ensuite le nombre d'entiers impairs entrés précédemment par l'utilisateur. 

Pour compiler:
```
g95 -o nbentiersimpairs nbentiersimpairs.f90
```
Pour éxecuter:
```
./nbentiersimpairs
```

## Calculatrice simple 
Le programme appelé "<samp>calc_simple</samp>" calcule et affiche le résultat d'une opération élémentaire entre deux entiers. D'abord, il demande à l'utilisateur de saisir les deux entiers a et b, ainsi que l'opérateur arithmétique. Ce programme suit le modèle suivant:

1: Lire les deux entiers *a* et *b*

2: Lire le caractère *car* de l'opération artihmétique à effectuer

3: **Selon** (*car*)
    
4: **cas** **+** => *res* = *a* + *b*

5: **cas** **-** => *res* = *a* - *b*

6: **cas** **\*** => *res* = *a* + *b*

7: **cas** **:** => **Si** *b*≠0 **Alors** *res* = *a* / *b* **Sinon** afficher "Division par zero" **Fin si**

8: **défaut** : afficher "Opérateur inconnu"

9: **Fin selon**

Pour compiler:
```
g95 -o calc_simple calc_simple.f90
```
Pour éxecuter:
```
./calc_simple
```


## Trajectoire 
Le programme appelé "<samp>trajectoire</samp>" permet de simuler la chute libre d'un corps, ici une balle, dans le champ de gravité terrestre. On se place dans le plan vertical (*x0y*), où x est l'horizontale et y la verticale ascendante, de telle sorte que le champ de gravité s'écrit **g** = - *g***e<sub>y</sub>**. La balle supposée ponctuelle est de masse *m*, est soumise à une seule force: son poids **P** = -*mg***e<sub>y</sub>**. La vitesse instatanée de la balle est **V**(*t*) = *u*(*t*)**e<sub>x</sub>** + *v*(*t*)**e<sub>y</sub>**. On suppose ici que la balle est lancée à *t*=0 avec une vitesse horizontale *U<sub>0</sub>* donnée. 

Le programme montre la simulation de trajectoire de la balle avec les conditions suivantes:

à *t* = 0 : (*x<sub>A</sub>* , *y<sub>A</sub>*) ; *U<sub>0</sub>* = 2

J'ai utilisé le pas de temps égale à 0,1. 

Le programme 
- initalise les tableaux déclarés à l'aide des conditions initiales
- avance en temps tant que la balle est située au-dessous du sol (*y* > 0)
- affiche ensuite à l'écran pour chaque instant entre *t<sub>0</sub>* et *t<sub>n</sub>* , le temps *t<sub>i</sub>* et la position de la balle associée *x<sub>i</sub>* et *y<sub>i</sub>* 
- affiche le temps de chute et la portée (distance parcourue suivant *x*.)

Pour compiler:
```
g95 -o trajectoire trajectoire.f90
```
Pour éxecuter:
```
./trajectoire
```

## Recherche de maximum dans un tableau dynamique 
Le programme appelé "<samp>tab_dyn</samp>" recherche le maximum des valeurs d'un tableau. Ces valeurs auront été entrées au clavier par l'utilisateur.

Pour compiler:
```
g95 -o tab_dyn tab_dyn.f90
```
Pour éxecuter:
```
./tab_dyn
``` 

## Calculatrice sur des vecteurs
Le programme appelé "<samp>calc_vecteur</samp>" permet à l'utilisateur d'effectuer des opérations scalaires ou vectorielles sur un ou plusieurs ensembles de scalaires ou vecteurs. 

Le programme demande à l'utilisateur s'il veut effectuer des opérations faisant intervenir un vecteur ou bien deux. 

#### si l'utilisateur fait intervenir un vecteur: 
Le programme demande à l'utilisateur de saisir les *N* éléments d'un vecteur *V<sub>1</sub>* , et propose différents types d'opérations:
- La somme et le produit des éléments du vecteur *V<sub>1</sub>* .
- Les normes 1, 2 et supérieur du vecteur *V<sub>1</sub>* .
#### si l'utilisateur fait intervenir deux vecteur: 
Le programme demande à l'utilisateur de saisir les *N* éléments des vecteurs *V<sub>1</sub>* et *V<sub>2</sub>* , et propose différents types d'opérations:
- La somme et le produit élément par élément des deux vecteurs
- Le produit scalaire des deux vecteurs
- Le produit scalaire des deux vecteurs
- La comparaison élément par élémént des deux vecteurs

Pour compiler:
```
g95 -o calculatrice2 calculatrice2.f90
```
Pour éxecuter:
```
./calculatrice2
```

## Carré Magique normal d'ordre n **impair**
Un carré magique est un tableu carré de nombres entiers strictement positifs et disposés de sorte que leurs sommes sur chaque rangée, sur chaque colonne et sur chaque diagonale principale soient égales. 

La méthode dite *siamoise* consiste à remplir le tableau en plaçant successivement 1, 2, 3 etc. dans les cases en suivant un chemin bien précis. Le premier entier 1 est placé au centre de la dernière ligne. On remplit ensuite le tableau en se déplaçant en diagonale dans la direction Sud-Est. Si on sort du tableau par un bord, on y rentre par le bord opposé. Si la case située au Sud-Est est déjà occupée, le déplacement devra se faire non pas vers le Sud-Est, mais d'une case vers le Nord car cette case est forcément libre. On reprend ensuite le chemin vers le Sud-Est. 

Le programme principal demande à l'utilisateur de saisir l'ordre n du carré magique jusqu'à ce que l'utilisateur entre un entier impair strictement positif, alloue le tableau dynamique, le remplit et l'affiche. Dans le module, il y a deux fonctions et deux subroutines. 

Pour compiler:
```
g95 carremagique.f90 carre.90 -o carremagique 
``` 
Pour éxecuter:
```
./carremagique
```