program Decryptor
	! Riley Payung
	! Assignment 4 Program 1
	! CDS 251
	! Due: 2/20/2020
	! Descrip: This program takes in matricies of the specified
	! file and decrypts them into a message.
	! Each matrix is 2 characters of the message.
	implicit none
	
	integer, allocatable :: Matrix(:,:), Inverse(:,:)
	integer :: stat, currentInt1, currentInt2, DET, n = 2, Determinant, i = 1
	character*32 :: message
	character(LEN=10) :: textFile
	character :: char1, char2
	
	allocate(Matrix(n,n))
	allocate(Inverse(n,n))
	
	read(5,*) textFile
	
	open(13, file=textFile)
	
	read(13,*) Matrix(1,1), Matrix(1,2)
	read(13,*) Matrix(2,1), Matrix(2,2)

	! determinant
	DET = Determinant(Matrix,n)
	if (DET == 0) return
	Inverse(1,1) =    Matrix(2,2) / DET
	Inverse(1,2) = -(Matrix(1,2)) / DET
	Inverse(2,1) = -(Matrix(2,1)) / DET
	Inverse(2,2) =    Matrix(1,1) / DET
	
	do
		read(13, *) currentInt1
		read(13, *) currentInt2
		
		char1 = char((Inverse(1,1) * currentInt1 + &
				Inverse(1,2) * currentInt2))
		char2 = char((Inverse(2,1) * currentInt1 + &
				Inverse(2,2) * currentInt2))
		message(i:i) = char1
		i = i + 1
		message(i:i) = char2
		if (i == 32) exit
		i = i + 1
	enddo
	close(13)
	
	print*, message
	

end program Decryptor

function Determinant(M, n) result(Det)
	! Write this function so that it can compute the determinant of a 2x2 or
	! 3x3 matric depending on the value of n.
	implicit none;
	
	integer :: n
	integer :: M(n,n), Det
	
	
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
