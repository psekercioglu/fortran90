PROGRAM tab_dyn
	IMPLICIT NONE 
	
	INTEGER :: n, maxi, ok, i
	REAL, DIMENSION(:), ALLOCATABLE :: tab
	
	PRINT*, "Entrez le nombre d'element de votre tableau"
	READ*, n
	ALLOCATE(tab(n), STAT=ok)
	IF (ok/=0)STOP "Echec d'allocation memoire"
		
	DO i=1,n
		PRINT*, "Entrez l'element", i, "de votre tableau:" 
		READ*, tab(i)
	END DO
	maxi=tab(i)

	DO i=2,n
		IF(tab(i)>maxi)THEN
			maxi=tab(i)
		END IF
	END DO
	PRINT*, "Valeur max du tableau est", maxi
END PROGRAM tab_dyn
