program Lab08
	! Riley Payung
	! CDS 251
	! 04/02/2020
	! Lab 08: Bisection method with single precision

	implicit none
	! variable dec
	real :: a = 0.0, b = 0.0, tolerance, m = 0.0, myFunc
	integer :: counter = 0
	! set tolerance value
	tolerance = 1.00e-14;
	! set values for a and b
	PRINT*,"Please enter a value for A:";
	READ(*,*) a;
	PRINT*,"Please enter a value for B:";
	READ(*,*) b;
	
	DO
		! if counter too high, exit.
		IF (counter .ge. 50) EXIT;
		! set midpoint
		m = (a + b) / 2.0;
		! check tolerance level, if too low then exit,
		! otherwise calculate m.
		IF (abs(myFunc(m)) .lt. tolerance) EXIT;
		IF (myFunc(a) * myFunc(m) .gt. 0.0) THEN
			a = m;
		ELSE
			b = m;
		ENDIF
		!increment counter
		counter = counter + 1;
	ENDDO
	! print values
	PRINT*,"Root: ", m
	PRINT*, "function(M):", myFunc(m)
	
end program Lab08

function myFunc(x) result(si)
	implicit none;
	! variable dec
	real :: si,x
	! set result for function:
	si = (sin(x) - (0.15 * x) + 1.5);
end function myFunc