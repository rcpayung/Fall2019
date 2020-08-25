program CramersRule

	! System of equations. 2x2, 3x3
	! The main program is written for you. Read through the comments and
	! see how the main program works.
	! 2 Special Notes!!!!!
	! 1: Take note of how the logial variable 'Success' will either write
	!    the solution or 'No Solution' to the output file.
	! 2: Take note of how inside the do loop, allocating and deallocating
	!    memory for the arrays Matrix1, b, and x are done so the amount of
	!    memory allocated changes for each system. You cannot allocate more
	!    memory for an array until currently allocated memory is deallocated.

	implicit none

	! Declare varialble
	integer :: n, row, col, i
	real, allocatable :: Matrix1(:,:), b(:), x(:)
	real :: detA, detM, determinant
	logical :: Success

	! Open the input and output files.
	open(42,file='Data2.txt')
	open(43,file='Data2Out.txt')

	! Solve each system in the input files.
	do
		! Read in size of first system.
		read(42,*) n
		if (n .eq. 0) exit  ! Quit if zero.

		! Allocate memory for system, right hand side, and solution vector.
		allocate(Matrix1(n,n), b(n), x(n))

		! Read in the system. Ask if you do not understand how this works!
		do row = 1, n
			read(42,*) (Matrix1(row, col), col = 1, n), b(row)
		enddo

		! Use cramers rule to get solution.
		call Cramer(Matrix1, b, n, x, Success)
	  
		if (Success) then
			! Write solution to file
			do row = 1, n
				write(43,*) x(row)
			enddo
			write(43,*)
		else ! This happens when there is no unique solution.
			write(43,*) 'No Solution'
			write(43,*)
		endif
	  
	  ! clean up memory and go back up to top for next system.
	  deallocate(Matrix1, b, x)
	  
	enddo

	! close files
	close(42)
	close(43)

end program CramersRule

subroutine Cramer(M, b, n, x, Success)

	! This subroutine does Cramer's Rule
	! Declare and initialize your variables first.
	integer :: i, n
	real :: detM, detSol, ithSol, b(n), x(n)
	real, allocatable :: W(:,:)
	logical :: Success
	! Find the determinant of M first. print it to screen.
	detM = Determinant(M,n)
	print*, detM
	! If it is zero, set the Success logical variable and quit.
	if (detM == 0) then
		Success = .false.
		return
	else
		Success = .true.
	endif
	! Allocate memory for a working matrix for column substituion. Then, for each
	! column, i, substitute column i with vector b and get that determinant. 
	! Compute the ith solution.
	allocate(W(n,n))
	W = M
	do i = 1, n
		call ColumnInsert(M,b,n,i,W)
		detSol = Determinant(W,n)
		x(i) = detSol
	enddo

	! deallocate memory for the working matrix.
	deallocate(W)
end subroutine Cramer

subroutine ColumnInsert(M, b, n, col, MatOut)

	! This subroutine takes vector b and inserts in into matrix M at column col.
	! Don't forget to set MatOut = M before you substitute the column in.
	integer :: i, n, col
	real :: M(n,n), MatOut(n,n), b(n)
	
	MatOut = M
	do i = 1, n
		MatOut(i,col) = b(i)
	enddo

end subroutine ColumnInsert

function Determinant(M, n) result(Det)
	! Write this function so that it can compute the determinant of a 2x2 or
	! 3x3 matric depending on the value of n.
	implicit none;
	
	integer :: n
	real :: M(n,n), Det
	
	if (n == 2) then
		Det = M(1,1) * M(2,2) - M(1,2) * M(2,1)
		return
	else if (n == 3) then
		Det = &
		(M(1,1) * M(2,2) * M(3,3)) + &
		(M(1,2) * M(2,3) * M(3,1)) + &
		(M(1,3) * M(2,1) * M(3,2)) - &
		(M(1,3) * M(2,2) * M(3,1)) - &
		(M(1,2) * M(2,1) * M(3,3)) - &
		(M(1,1) * M(2,3) * M(3,2))
	endif
      
end function Determinant
