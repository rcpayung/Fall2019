program MainProgram

   implicit none
   
   integer :: n
   real, allocatable :: Matrix1(:,:)
   real :: detM, Determinant
   
   ! NOTE how the function name 'Determinant' has to be declared with a type.
   ! This is so the program knows what kind of variable it returns.
      
   ! Compute the determinant of a 2x2 matrix.
   n = 2
   allocate(Matrix1(n,n))
   Matrix1(1,1:2) = (/  3.0, 4.0 /)
   Matrix1(2,1:2) = (/ -1.0, 3.0 /)
   print*,'2x2 Determinant is: ', Determinant(Matrix1,n)
   deallocate(Matrix1)
   
   ! Compute the determinant of a 3x3 matrix.
   n = 3
   allocate(Matrix1(n,n))
   Matrix1(1,1:3) = (/  1.0,  4.0,  3.0 /)
   Matrix1(2,1:3) = (/ -1.0,  2.0,  1.0 /)
   Matrix1(3,1:3) = (/  2.0,  2.0,  3.0 /)
   print*,'3x3 Determinant is: ', Determinant(Matrix1,n)
   deallocate(Matrix1)
      
end program MainProgram

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
