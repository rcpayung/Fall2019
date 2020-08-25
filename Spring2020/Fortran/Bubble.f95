program Bubble
	
	implicit none
	
	real, allocatable :: A(:)
	character*16 :: fileName, fixed
	real :: temp = 0.0
	integer :: i, j, k, n = 0
	
	write(6,*), "Please Enter a Text File"
	read(5,*), fileName
	
	open(13,file=fileName)
	read(13,*), n
	
	allocate(A(n))
	
	do k = 1, n
		read(13,*), A(k)
	enddo
	close(13)
	
	do i = 1, n
		do j = 1, n - 1
			if (A(j) .gt. A(j+1)) then
				temp = A(j+1)
				A(j+1) = A(j)
				A(j) = temp
			endif
		enddo
	enddo
	
	open(42, file=fileName)
		write(42,*), n
	do i = 1, n
		write(42,*), A(i)
	enddo
	close(42)
	
end program Bubble