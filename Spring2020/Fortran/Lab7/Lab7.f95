program Lab7
	implicit none;
	
	integer :: i, n = 200
	real :: x, y, x_bar = 0, y_bar = 0 
	real :: Sxx = 0, Sxy = 0, Syy = 0, B, M
	character*32 :: filename
	
	print*,"Please enter a filename"
	read(5,*) filename
	
	open(13, file=filename);
	
	do i = 1, n
		read(13,*) x, y
		
		Sxx = Sxx + float(i - 1) / float(i) * &
		 (x - x_bar)**2
		
		Sxy = Sxy + float(i - 1) / float(i) * &
		 ((x - x_bar) * &
		 (y - y_bar))
		 
		x_bar = x_bar + (x - &
		 x_bar) / float(i)
		
		y_bar = y_bar + (y - &
		 y_bar) / float(i)
		y_bar = log(y_bar)
	enddo
	
	close(13)
	
	M = log(Sxy / Sxx);
	B = log(y_bar - M * x_bar)
	
	print*, "y = ", M,"x + ",B

end program Lab7