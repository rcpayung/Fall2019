PROGRAM Lab10
	! Riley Payung
	! CDS 251
	! 4/16/2020
	! Lab 10
	! This lab calculates the value of pi through simulation
	IMPLICIT NONE;
	
	!variable dec
	
	INTEGER :: I,N,C,SEED;
	REAL :: X,Y,PI,R=1.d0;
	
	PRINT*,"Please enter the number of iterations to estimate with:";
	READ(*,*) N;
	PRINT*,"Please enter an iteration seed:";
	READ(*,*) SEED;
	
	CALL SRAND(SEED);
	
	DO I = 1, N
		X = RAND();
		Y = RAND();
		IF (X**2+Y**2 .LE. R) C = C + 1;
	ENDDO
	
	PI = 4.0d0 * FLOAT(C) / FLOAT(N);
	PRINT*,PI;
	
END PROGRAM Lab10