PROGRAM homework10_1
	! Riley Payung
	! CDS 251
	! 04/16/2020
	! Homework 10
	! This program generates numbers using the gaussian (normal)
	! distribution. The first 13000 numbers use a std. dev of 2.5 
	! and mean of 22.0, The last 7000 numbers use a std. dev. of 1.0
	! and a mean of 15.5
	
	IMPLICIT NONE;
	! variable dec
	
	REAL :: SI, MU, gaussian;
	INTEGER :: SEED, I, N;
	! Ask user for input.
	PRINT*,"Please enter a random generation seed:";
	! set seed
	READ(*,*) SEED;
	! set the seed in generator
	CALL SRAND(SEED);
	! open the output file
	OPEN(13,file ="Bumps.txt");
	! Write out total numbers for proper reading.
	WRITE(13,*) 20000;
	
	! set the first 13000 numbers
	SI = 2.5;
	MU = 22.0;
	N = 13000;
	
	DO I = 1, N
		WRITE(13,*) gaussian(SI,MU);
	ENDDO
	! set the next 7000 numbers
	SI = 1.0;
	MU = 15.5;
	N = 7000;
	
	DO I = 1, N
		WRITE(13,*) gaussian(SI,MU);
	ENDDO
	
	! close the output file.
	CLOSE(13);

END PROGRAM homework10_1

FUNCTION gaussian(SI, MU) RESULT (R1)
	IMPLICIT NONE;
	!variable dec
	REAL :: X1, X2, W, R1, R2, transform, SI, MU;
	
	! Loop through box-muller.
	DO ! Infinite do loop until no rejection
		! Generate 2 numbers between -1 and 1
		x1 = 2.d0 * rand() - 1.d0;
		x2 = 2.d0 * rand() - 1.d0;
		w = x1**2 + x2**2;
		IF (w .lt. 1.d0) EXIT; ! Valid numbers
	ENDDO
		
	W = sqrt((-2.0 * log(W))/W);
	
	! Ive chosen to just return the transform of R1.
	R1 = transform((x1 * w),SI,MU);
	R2 = transform((x2 * w),SI,MU);

END FUNCTION gaussian

FUNCTION transform(R,SI,MU) RESULT (R1)
	! Box-muller transformation
	
	IMPLICIT NONE;
	! variable dec
	
	REAL :: SI, MU, R, R1;
	! transformation
	R1 = R * SI + MU;
END FUNCTION transform