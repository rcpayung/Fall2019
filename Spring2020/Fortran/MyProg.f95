program MyProg
	implicit none;
	integer :: i, userIn
	
	do i = 2, 42, 2
		if (mod(i,2) == 0) print*,i
	enddo
	i = 0
	
	print*,"Please enter a number: "
	read*,userIn

	do i = userIn, 1, -1
		print*, i
	enddo
	
	print*,"Blast-off"
	
	do
		print*,"Please enter a number between 1 and 100 "
		read*,userIn
		
		if (userIn == 42) exit
	enddo
	print*,"Good Job!"

	

end program MyProg