PROGRAM calculatrice2
	IMPLICIT NONE
	
	INTEGER :: i, ok, n, m !n etant le nb de composantes et m etant le nb de vecteurs
	CHARACTER :: op
	REAL :: somme=0., produit=1., norme1=0., norme2=0., norme_sup, maxi, produitsca !somme1=0., somme2=0., somme3=0.
	!somme1->somme de carre des composantes de v1, somme2->somme de carre des composantes de v2, somme3->somme de carre de (v1+v2)
	REAL, DIMENSION(:), ALLOCATABLE :: v1, v2, v3
	CHARACTER(LEN=2), DIMENSION(:), ALLOCATABLE :: res
	LOGICAL, DIMENSION(:), ALLOCATABLE :: logi
	
	PRINT*, "Vous voulez saisir 1 ou 2 vecteurs? (Tapez -1 pour quitter)" 
	READ*, m
	IF(m==-1)STOP "A bientot!"
	
	IF(m==1)THEN
		PRINT*, "Entrez le nombre de composantes du vecteur v1. (Tapez -1 pour quitter)"
		READ*, n
		IF(n==-1)STOP "A bientot!"
		
		ALLOCATE (v1(n), STAT=ok)
		IF(ok/=0)STOP "L'allocation a echoue"
	
		DO i=1,n
			PRINT*, "Entrez la composante", i, "de v1"
			READ*, v1(i)
		END DO
		
		PRINT*, "Entrez '+' pour la somme des composantes, '*' pour le produit des composantes"
		PRINT*,"'1' et '2' pour les normes 1 et 2, 's' pour la norme superieur."
		PRINT*, "(Tapez q pour quitter.)"
		READ*, op
		IF(op=='q')STOP "A bientot!"
		
		SELECT CASE(op)
			CASE('+')
				DO i=1,n
					somme=somme+v1(i)
				END DO
				PRINT*, "La somme des composantes de v1 est egale a", somme	
			CASE('*')
				DO i=1,n
					produit=produit*v1(i)
				END DO
				PRINT*, "Le produit des composantes de v1 est egale a", produit
			CASE('1')
				DO i=1,n
					norme1=norme1+ABS(v1(i))
				END DO
				PRINT*, "La norme1 du vecteur v1 est egale a", norme1
			CASE('2')
				DO i=1,n
					somme=somme+v1(i)**2
					norme2=SQRT(somme)
				END DO
				PRINT*, "La norme2 du vecteur v1 est egale a", norme2
			CASE('s')
				maxi=ABS(v1(1))
				DO i=2,n
					IF(maxi<ABS(v1(i)))THEN
						maxi=ABS(v1(i))
					END IF 
				END DO
				norme_sup=maxi
				PRINT*, "La norme superieur du vecteur v1 est egale a", norme_sup
			CASE DEFAULT
				PRINT*, "Operateur invalide" 
		END SELECT
	
	ELSE IF(m==2)THEN
		PRINT*, "Entrez le nombre de composantes des vecteurs v1 et v2.(Taper -1 pour quitter)"
		READ*, n
		IF(n==-1)STOP "A bientot!"
		
		ALLOCATE(v1(n), v2(n), v3(n), res(n), logi(n), STAT=ok)
		IF(ok/=0)STOP "L'allocation a echoue"
		
		DO i=1,n
			PRINT*, "Entrez la composante", i, "de v1"
			READ*, v1(i)
		END DO
		
		DO i=1,n
			PRINT*, "Entrez la composante", i, "de v2"
			READ*, v2(i)
		END DO
		
		PRINT*, "Entrez '+' pour la somme element par element," 
		PRINT*,"'*' pour le produit element par element,"
		PRINT*,"'s' pour le produit scalaire de v1 et v2,"
		PRINT*,"'c' pour la comparaison element par element de v1 et v2."
		PRINT*, "(Taper q pour quitter.)"
		READ*, op
		IF(op=='q')STOP "A bientot!"
		
		SELECT CASE(op)
			CASE('+')
				DO i=1,n
					v3(i)=v1(i)+v2(i)
				END DO
				PRINT*, "La somme element par element des deux vecteur est egale a", v3
			CASE('*')
				DO i=1,n
					v3(i)=v1(i)*v2(i)
				END DO
				PRINT*, "Le produit element par element des deux vecteurs est egale a", v3
			CASE('s')
				!DO i=1,n
					!somme1=somme1+v1(i)**2
					!somme2=somme2+v2(i)**2
					!v3(i)=v1(i)+v2(i)
					!somme3=somme3+v3(i)**2
				!END DO
				!somme1=SQRT(somme1)
				!somme2=SQRT(somme2)
				!somme3=SQRT(somme3)
				!produitsca=0.5*(somme3**2-somme1**2-somme2**2)
				!PRINT*, "Le produit scalaire de deux vecteur est egale a", produitsca
				DO i=1,n
					somme=somme+v1(i)+v2(i)
				END DO
				PRINT*, "Le produit scalaire de v1 et v2 est egale a", somme
			CASE ('c')
				DO i=1,n
					IF(v1(i)>=v2(i))THEN
						res(i)=">="
					ELSE
						res(i)="<"
					END IF
				END DO
				PRINT*, "Le vecteur resultat est", res
				!logi=v1<v2
				!WHERE (logi)
				!	res="<"
				!ELSEWHERE
				!	res=">="
				!END WHERE
				!PRINT*, res  
			CASE DEFAULT
				PRINT*, "Operateur invalide" 
		END SELECT
	ELSE
		PRINT*,"Invalide!"
	END IF		
	
	DEALLOCATE(v1, v2, v3, res)
END PROGRAM calculatrice2
