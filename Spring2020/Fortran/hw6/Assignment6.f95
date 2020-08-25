program Assignment6
	implicit none
	
	integer :: i, n
	real*4, allocatable :: A(:)
	character*32 :: inFile, outFile = "HW6Out.txt"
	
	print*, "Please enter a text file: "
	read(5,*) inFile
	open(13, file=inFile)
	read(13,*) n

	allocate(A(n))
	
	do i = 1, n
		read(13,*) A(i)
	enddo

	close(13)
	
	
	! Do stuff here.
	call quicksort(A,n,1,n)
	
	open(42, file=outFile)
	
	write(42,*) n
	
	do i = 1, n
		write(42,*) A(i)
	enddo
	
	close(42)
	
	deallocate(A)
end program Assignment6

recursive subroutine quicksort(A, n, lo, hi)
	implicit none
	integer :: n, lo, hi, p, partition
	real*4 :: A(n)
	if (lo .eq. hi) return
	if (lo .le. hi) then
		p = partition(A, n, lo, hi)
		call quicksort(A, n, lo, p-1)
		call quicksort(A, n, p+1, hi)		
	endif
end subroutine quicksort

function partition(A,n,lo,hi) result (p)
	implicit none
	
	integer :: p, pivot, lo, hi, n, i
	real*4 :: A(n), temp
	
	
	pivot = A(hi)
	p = lo
	
	do i = lo, hi - 1
		if (A(i) .le. pivot) then
			temp = A(p)
			A(p) = A(i)
			A(i) = temp
			p = p + 1
		endif
	enddo
	temp = A(p)
	A(p) = A(hi)
	A(hi) = temp
end function partition