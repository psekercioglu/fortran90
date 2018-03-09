PROGRAM trajectoire
	IMPLICIT NONE
	
	REAL :: t=0.
	INTEGER ::i, n !nombre d'itération
	REAL, PARAMETER :: xa=0., ya=10., u0=2., v0=0., deltat=0.1
	INTEGER, PARAMETER :: nmax=100000
	REAL, PARAMETER :: g=9.81
	REAL, DIMENSION(0:nmax) ::u, v, y, x
	
	u(0)=u0
	v(0)=v0
	x(0)=xa
	y(0)=ya
	
	i=0
	DO WHILE(y(i)>0.)
		i=i+1 
		u(i)=u(i-1)
		v(i)=-g*deltat+v(i-1)
		x(i) = deltat*u(i)+x(i-1)
		y(i) = deltat*v(i)+y(i-1) 
	END DO 
	n = i 
	
	PRINT*, "ti     xi     yi"
	DO i=0,n
		PRINT*, i*deltat, x(i), y(i)
	END DO 

	PRINT*, "Le temps de chute est", n*deltat, "et la portée est", x(n)		
END PROGRAM trajectoire
		
		
	
