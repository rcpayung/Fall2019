program homework2
	! Riley Payung
	! CDS251
	! Assignment Homework 2
	! 02/06/2020
	! This program shows the limitations of a computer
	! by setting the initial condition. It is implied that
	! a real will be 1 already unless specified 0. Here
	! we can see that the iteration of 1.0e-7 will stop
	! when the value reaches 2. The reason that one still
	! continues counting is because of this implication
	! of 1 that the computer does. Otherwise, it would likely
	! also cease.
	implicit none

	real*4 :: one = 1.0 ! Initial value of ONE
	real*4 :: two = 2.0 ! Initial value of TWO
	integer*4 :: i = 0 ! Initial value of incrementer i.
	! I had to use *4 because there would be overflow error
	! if i hadnt.
	do
		if (i == 10000000) exit ! If we reach 10M, exit.
		one = one + 1.0e-7 ! This value will continually approach 2.
		two = two + 1.0e-7 ! This value will stop eventually when it
		! reaches 2 while 1 will still continue.
		i = i + 1 ! increment
	enddo
	
	write(*,*),"ONE: ",one
	write(*,*),"TWO: ",two

end program homework2