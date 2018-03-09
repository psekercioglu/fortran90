MODULE matrices
	IMPLICIT NONE 
	CONTAINS
	
	INTEGER FUNCTION plus_un(i,n)
		INTEGER, INTENT(IN) :: i, n
		IF(n>i)THEN
			plus_un=i+1
		ELSE
			plus_un=1
		END IF
	END FUNCTION plus_un
	
	INTEGER FUNCTION moins_un(i,n)
		INTEGER, INTENT(IN) :: i, n
		IF(i>1)THEN
			moins_un=i-1
		ELSE
			moins_un=n
		END IF
	END FUNCTION moins_un
	
	SUBROUTINE saisit_impair(n)
		INTEGER, INTENT(OUT)::n
		DO
			PRINT*, "Entrez l'ordre impair et positif n du carre magique"
			READ*, n
			IF(MODULO(n,2)==1 .AND. n>0)EXIT
			PRINT*, "Recommencez!"
		END DO
	END SUBROUTINE saisit_impair
	
	SUBROUTINE affiche(A)
		INTEGER, DIMENSION(:,:), INTENT(IN):: A
		INTEGER:: i, nl
		nl = SIZE(A,1)
		DO i=1, nl
			PRINT*, A(i,:)
		END DO
	END SUBROUTINE affiche
END MODULE matrices
