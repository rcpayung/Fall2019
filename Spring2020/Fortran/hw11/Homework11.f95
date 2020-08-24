PROGRAM Homework11
	! Riley Payung
	! CDS 251
	! 04/23/2020
	! Homework 11
	! The purpose of this program is to solve ODEs with the
	! runge kutta method.
	
	IMPLICIT NONE;
	! variable dec
	REAL :: k1, k2, k3, k4, myfunc, y, y0, h, t0, tFinal, t;
	INTEGER :: n, i;
	CHARACTER(25) :: filename;
	! ask user for input.
	PRINT*,"What is the initial value of y. (y0):";
	read(*,*) y0;
	PRINT*,"Please enter an output file name:";
	read(*,*) filename;
	
	tFinal = 5.0;
	h = 0.05;
	
	! set y to its initial value:
	y = y0;
	! set the number of steps to take between 0 and tFinal:
	n = tFinal / h;
	! time initially 0:
	t = 0.0;
	! open the output file for writing.
	open (13, file=filename);
	! output initial values:
	write(13,*) t, y;
	! loop through all of the steps.
	do i = 1, n
		! calculate midpoints:
		k1 = myfunc(y,t);
		k2 = myfunc((y + h/2*k1), (t+h/2));
		k3 = myfunc((y + h/2*k2), (t+h/2));
		k4 = myfunc((y + h*k3), (t+h));
		
		! calculate the next y:
		y = y + ((h/6) * (k1 + (2*k2) + (2*k3) + k4));
		! increment t by step size:
		t = t + h;
		! write out values t and y:
		write(13,*) t, y;
	enddo
	
	close(13)
	print*,"Done, output in file=",filename;

END PROGRAM Homework11

FUNCTION myfunc(y, t) RESULT (res)
	IMPLICIT NONE;
	! variable dec
	REAL :: y, t, res;
	! calculate ODE:
	res = ((y ** 2) - (y ** 3 / 5) - t)
	
END FUNCTION myfunc