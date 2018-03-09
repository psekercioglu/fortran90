PROGRAM calc_simple
	IMPLICIT NONE
	
	INTEGER :: a, b
	CHARACTER :: op
	
	PRINT *, 'Ecrivez un entier a='
	READ *, a
	PRINT *, 'Ecrivez un entier b='
	READ *, b
	PRINT *, 'Ecrivez un opérateur op='
	READ *, op
	
	IF(op=='+')THEN
		PRINT *, 'résultat =', a+b
	ELSE IF(op=='-')THEN
		PRINT *, 'résultat =', a-b
	ELSE IF(op=='*')THEN
		PRINT *, 'résultat =', a*b
	ELSE IF(op==':')THEN
		IF(b/=0) THEN
			PRINT *, 'résultat =', a/b
		ELSE
			PRINT *,'Division par zéro' 
		END IF
	ELSE
		PRINT *, 'Opérateur inconnu!'
	END IF
END PROGRAM calc_simple
