program Homework7
	! Riley Payung
	! CDS 251
	! Homework 7
	! Due: 03/26/2020
	! The following program caluclates the line
	! of best fit for an exponential regression
	! This translates the linear regression to a
	! exponential regression.

	implicit none;
	
	! define characters
	integer :: i, n = 200
	real :: x, y, x_bar = 0, y_bar = 0 
	real :: Sxx = 0, Sxy = 0, Syy = 0, B, M
	character*32 :: filename
	
	! Ask the user for the file name as input
	print*,"Please enter a filename"
	read(5,*) filename
	! open the file
	open(13, file=filename);
	! loop through the numbers in the file
	do i = 1, n
		! input x and y.
		read(13,*) x, y
		! exponential: take log of y.
		y = log(y)
		! calculate Sxx
		Sxx = Sxx + float(i - 1) / float(i) * &
		 (x - x_bar)**2
		! Calculate Sxy
		Sxy = Sxy + float(i - 1) / float(i) * &
		 ((x - x_bar) * &
		 (y - y_bar))
		! Calculate the change in x:
		x_bar = x_bar + (x - &
		 x_bar) / float(i)
		! calculate the change in y:
		y_bar = y_bar + (y - &
		 y_bar) / float(i)
	enddo
	! close the file
	close(13)
	! calculate equation characteristics:
	M = Sxy / Sxx;
	B = exp(y_bar - M * x_bar)
	! print ouput of equation:
	print*, "Exponent: ", M
	print*, "Coefficient: ", B

end program Homework7