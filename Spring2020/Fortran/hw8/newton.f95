PROGRAM newton
	! Riley Payung
	! CDS 251
	! 04/02/2020
	! Assignment 8
	! The purpose of this is to find roots
	! using the bisection method and the
	! newton method.

	IMPLICIT NONE;
	
	! variable dec
	real*8 :: tolerance, a, b, x, y, m, n, bisect, newt;
	! tolerance close to 0
	tolerance = 1.0d-14;
	! get values from user for bisection method
	PRINT*,"Please enter a value for A (BISECTION):";
	READ(*,*) a;
	PRINT*,"Please enter a value for B (BISECTION):";
	READ(*,*) b;
	! find the values for a, b in bisection
	m = bisect(a,b,tolerance,'func');
	n = bisect(a,b,tolerance,'deriv');
	! get values from user for newtons method
	PRINT*,"Please enter a value for X (NEWTON'S):";
	READ(*,*) x;
	! find the values for x in newtons method
	x = newt(x,tolerance);

END PROGRAM newton

FUNCTION newt(x, tolerance) result(y)
	IMPLICIT NONE;
	! variable dec
	real*8 :: x, y, tolerance, myFunc, myDeriv;
	integer :: counter;
	DO
		! if we go too high or if the function value is less than
		! the tolerance, exit. Otherwise, set X and inc counter.
		IF (counter .ge. 50) EXIT;
		IF (abs(myFunc(x)) .lt. tolerance) EXIT;
		x = x - (myFunc(x) / myDeriv(x));
		counter = counter + 1;
	ENDDO
	y = x;
	! print out the values
	print*,"Root:",x
	print*,"Counter:",counter;
	
END FUNCTION newt

FUNCTION bisect(a,b, tolerance, func) result (m)
	IMPLICIT NONE;
	!variable dec
	CHARACTER(5) :: func;
	DOUBLE PRECISION :: a, b, tolerance, m, n, myFunc, myDeriv;
	INTEGER :: counter = 0;
	DO
		! if the counter gets too high, exit
		IF (counter .ge. 50) EXIT;
		! calculate midpoint
		m = (a + b) / 2.0;
		! if the function we want is derivative:
		IF (func .eq. 'deriv') THEN
			IF (abs(myDeriv(m)) .lt. tolerance) EXIT;
			IF (myDeriv(a) * myDeriv(m) .gt. 0.0) THEN
				a = m;
			ELSE
				b = m;
			ENDIF
		! if the function we want is not the derivative:
		ELSE
			! check tolerance level, if too low then exit,
			! otherwise calculate m.
			IF (abs(myFunc(m)) .lt. tolerance) EXIT;
			IF (myFunc(a) * myFunc(m) .gt. 0.0) THEN
				a = m;
			ELSE
				b = m;
			ENDIF
			
		ENDIF
		! increment counter
		counter = counter + 1;
	ENDDO
	! set n to the func(m) value based on
	! which function using.
	IF (func .eq. 'deriv') THEN
		n = myDeriv(m);
	ELSE 
		n = myFunc(m);
	ENDIF
	! print out values
	PRINT*,func;
	PRINT*,"func(M): ",n;
	PRINT*,"Root: ",m;
	PRINT*,"conv count: ",counter;
	
END FUNCTION bisect

function myFunc(x) result(si)
	IMPLICIT NONE
	!variable dec
	double precision :: si,x
	! set result value to function
	si = (sin(x) - (0.15 * x) + 1.5);
end function myFunc

function myDeriv(x) result(si)
	IMPLICIT NONE
	! variable dec
	double precision :: si,x
	! set result value to function
	si = (cos(x) - (0.15))
end function myDeriv