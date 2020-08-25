program assignment3
	implicit none
	
	real*4, allocatable :: array(:)
	real*4 :: mu = 0., sig = 0.
	integer*4 :: n, i
	
	open(13,file='Numbers1.txt')
	read(13,*), n
	
	allocate(array(n))
	
	do i = 1, n
		read(13,*), array(i)
		mu = mu + array(i)
	enddo
	mu = mu / n
	do i = 1, n
		sig = sig + (array(i) - mu)**2
	enddo
	sig = sqrt(sig)
	close(13)
	
	write(*,*),'MU:', mu
	write(*,*),'SIG:',sig
	
	deallocate(array)

end program assignment3