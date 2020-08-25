program homework2
	! Riley Payung
	! CDS251
	! Assignment Homework 2
	! 02/06/2020
	! Demonstrates the limitations of computers based on the
	! data type that was specified. This program runs the algorithm
	! SUM(1/n) for all n = [1,inf)
	implicit none

	real*4 :: res = 1.0 ! Current Result
	real*4 :: prev = 1.0 ! Previous Result
	real*8 :: i = 1 ! Counter
	
	do while ((prev .LT. res) .OR. (i == 1))
	! Continue iteration until the result stops increasing.
	! Needed to use i == 1 to make sure it passes the initial
	! condition.
		prev = res ! Set previous to be the last result.
		res = res + (1 / i) ! continue summation
		i = i + 1 ! iterate
	enddo
	
	write(*,*),"ANSWER:",res ! Print result
	write(*,*),"1 / i:",(1/i) ! Print 1/i where i stopped.
	write(*,*),"Executions:",i ! print i.
end program homework2