program Lab9
	! Riley Payung
	! CDS 251
	! 04/09/2020
	! Lab 9
	! The purpose of this program is to evaluate the
	! integral using the central difference algorithm

	implicit none;
	
	! variable dec
	real :: y_pri, x, h, prime;
	integer :: i;
	character(20) :: outfile = "output.txt";
	
	! get user input for x and h
	print*,"Please enter a value for X:";
	read(*,*) x;
	print*,"Please enter a value for h:";
	read(*,*) h;
	
	! print the prime of that number.
	print*,prime(x,h);
	! open the output file for printing
	open(13,file=outfile);
	! loop for the values of x, and evaluate prime of y at x and h.
	do i = 1, int(4.0/h)
		x = float(i) * h;
		y_pri = prime(x,h);
		! write out to the file.
		write(13,*) x, y_pri;
	enddo
	! close the file.
	close(13);
	
end program Lab9

function func(input) result(output)
	implicit none;
	! variable dec
	real :: input, output;
	! set result
	output = cos(input) * ((input ** 3) - (3 * (input ** 2)));
end function func

function prime(x, h) result(y_pri)
	implicit none;
	! variable dec
	real :: x, h, y_pri, func;
	! set result
	y_pri = ((func(x+h)-func(x-h)) / (2*h))
end function prime