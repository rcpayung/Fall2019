PROGRAM Homework10_3
	! Riley Payung
	! CDS 251
	! 04/16/2020
	! Homework 10 (Part 3)
	! The purpose of this program is to simulate brownian motion
	
	IMPLICIT NONE;
	
	! variable dec
	INTEGER :: X = 0, Y = 0, I, N, SEED;
	
	! Ask for the random generation seed
	PRINT*,"Please enter a random generation seed:";
	READ(*,*) SEED;
	
	! Set the seed
	CALL SRAND(SEED);
	
	! Ask for the number of simulations
	PRINT*,"Please enter the number of simulations:";
	READ(*,*) N;
	
	! Open a new file called Brownian.txt
	OPEN(42, FILE = "Brownian.txt");
	
	! Write the initial values.
	WRITE(42,*) X, Y;
	
	! Loop through the number of simulations and write to the file.
	DO I = 1, N
		X = INT(RAND() * 200);
		Y = INT(RAND() * 200);
		
		WRITE(42,*) X, Y;
	ENDDO
	
	! Close the file
	CLOSE(42);
	! Let the user know were done.
	PRINT*,"Done. Output is in Brownian.txt";

END PROGRAM Homework10_3