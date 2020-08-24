PROGRAM Lab11
	! Riley Payung
	! CDS 251
	! 04/23/2020
	! Lab 11
	! The purpose of this lab is to use the forward Euler method to
	! solve for 1st ODEs. The ouput is labeled in seperate files,
	! and the graph is exact.
	
	IMPLICIT NONE;
	! variable dec
	REAL :: h, t, y, myfunc, tFinal, y0;
	INTEGER :: n, i;
	CHARACTER(25) :: filename;
	! ask user for input.
	PRINT*,"What is the initial value of y. (y0):";
	read(*,*) y0;
	PRINT*,"What is the step size:";
	read(*,*) h;
	PRINT*,"How long would you like to run for:";
	read(*,*) tFinal;
	PRINT*,"Please enter an output file name:";
	read(*,*) filename;
	! calculate number of total steps between 0 and tFinal 
	! based on the step size.
	n = int(tFinal / h);
	! set y to its initial value.
	y = y0;
	! open file for reading
	open (13, file = filename);
	! t is initally 0;
	t = 0.0;
	! write out initial values.
	write(13,*) t, y;
	do i = 1, n
		! solve the ODE
		y = y + (h * myfunc(t,y));
		! increment time by the step size.
		t = t + h;
		! write out the time and values of ODE:
		write(13,*) t, y;
	enddo
	! close the file
	close(13);

END PROGRAM Lab11

FUNCTION myfunc (t,y) result (res)
	IMPLICIT NONE;
	! variable dec
	REAL :: t, y, res;
	! evaluate function at t and y.
	res = (1 - (2 * (y ** 2)) + (5 * t) - (t ** 2))
END FUNCTION myfunc