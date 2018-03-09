PROGRAM nbentiersimpairs
	IMPLICIT NONE 
	
	INTEGER :: a
	INTEGER :: x=0 !le nombre des entiers impairs
	
	PRINT *, 'Saisir des entiers non nuls'
	
	DO
		PRINT *, 'a='
		READ *, a
		IF (a<1.E-6) EXIT
		IF(MOD(a,2)==1)THEN 
			x=x+1
		END IF
	END DO
	
	PRINT *, 'le nombre des entiers impairs =', x
	
END PROGRAM nbentiersimpairs
