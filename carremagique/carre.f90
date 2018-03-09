PROGRAM carre_magique
	USE matrices
	IMPLICIT NONE
	
	INTEGER, DIMENSION(:,:), ALLOCATABLE :: mat
	INTEGER :: n, ok, il, ic, k
	
	PRINT*, 'Saisie de la matrice:'
	CALL saisit_impair(n)
	
	ALLOCATE(mat(n,n), STAT=ok)
	IF(ok/=0)STOP "L'allocation a echoue"
	mat=0
	
	il=n
	ic=n/2+1
	mat(il, ic)=1
	
	DO k=2,n**2
		IF(mat(plus_un(il,n), plus_un(ic,n))==0)THEN
			il=plus_un(il,n)
			ic=plus_un(ic,n)
		ELSE
			il=moins_un(il,n)
		END IF
		mat(il,ic)=k
	END DO
	
	PRINT*, 'Affichage de la matrice:'
	CALL affiche(mat)
	
DEALLOCATE(mat)
END PROGRAM carre_magique
