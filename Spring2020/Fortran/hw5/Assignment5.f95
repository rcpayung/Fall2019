program Assignment5
	! Riley Payung
	! CDS 251
	! 02/27/2020
	! Assignment 5
	! This program is meant to ask the user for a file of numbers,
	! read in all of the numbers, and sort the numbers based on
	! indexing. This does not sort the actual list of numbers.
	
	implicit none;
	
	! Variable Declaration
	integer :: n, i, j, temp
	integer, allocatable :: index(:)
	real, allocatable :: A(:)
	! file names.
	character*24 :: textfile, outputfile="Output.txt"
	
	! Ask the user for the file name information.
	print*, "Please enter a file name: "
	read(5,*) textfile
	open(13,file=textfile)
	
	! read in the number of elements in the file:
	read(13,*) n
	
	! allocate the number of elements in A and index lists
	allocate(A(n))
	allocate(index(n))
	
	! Read in each element of the file and set the index
	! list's values.
	do i = 1, n
		read(13,*) A(i)
		index(i) = i;
	enddo
	! Close the user inputted text file.
	close(13)
	
	! Sort the indexing array based on the values
	! in the numbers array (A)
	do i = 1, n
		do j = 1, n-1
			if (A(index(j)) .gt. A(index(j+1))) then
				temp = index(j)
				index(j) = index(j+1)
				index(j+1) = temp
			endif
		enddo
	enddo
	! Create the output file if it does not already exist
	! and open it.
	open(42, file=outputfile)
	! Write out the number of elements in the lists.
	write(42,*) n
	! Write each element of the numbers array at the
	! index value where i is the index iterator
	do i = 1, n
		write(42,*) A(index(i))
	enddo
	
	! Close the file
	close(42)
	
	! Deallocate the arrays and free memory
	deallocate(index)
	deallocate(A)
	! print done.
	print*,"Done"
end program Assignment5