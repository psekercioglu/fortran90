PROGRAM tab_dyn
	IMPLICIT NONE 
	
	INTEGER :: n, imax, ok, i
	REAL, DIMENSION(:), ALLOCATABLE :: tab
	
	PRINT*, "Entrez le nombre d'element de votre tableau"
	READ*, n
	ALLOCATE(tab(n), STAT=ok)
	IF (ok/=0)STOP "Echec d'allocation memoire"
		
	DO i=1,n
		PRINT*, "Entrez l'element", i, "de votre tableau:" 
		READ*, tab(i)
	END DO
	imax=tab(i)

	DO i=2,n
		IF(tab(i)>tab(imax))THEN
			imax=tab(i)
		END IF
	END DO
	PRINT*, "Valeur max du tableau est", tab(imax)
END PROGRAM tab_dyn
