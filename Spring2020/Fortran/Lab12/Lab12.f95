PROGRAM Lab12
	! Riley Payung
	! CDS 251
	! 04/23/2020
	! Lab 12
	! The purpose of this program is to simulate the time
	! taken for a cannonball to hit the ground from its
	! initial position on the ground after being shot.
	IMPLICIT NONE;
	! variable declaration
	REAL :: g = 9.8, x = 0.0, y = 0.0, h, tV, angle, vx, vy, t, pi = acos(-1.0);
	
	! Ask user for input
	print*,"Please enter a timestep: ";
	read(*,*) h
	print*,"Please enter a total velocity";
	read(*,*) tV;
	print*,"Please enter an angle in degrees";
	read(*,*) angle;
	
	! calculate initial velocities
	vx = tV * cos(pi * angle / 180)
	vy = tV * sin(pi * angle / 180)
	! open file for writing
	open(13, file="Output.txt");
	! write out initial values of x and y
	write(13,*) x, y;
	! loop through, calculating 2nd ODEs and writing
	! out the positional values x and y. Update the total
	! time taken.
	do
		y = y + h * vy;
		vy = vy - h * g;
		x = x + h * vx;
		t = t + h;
		write(13,*) x, y;
		if (y .le. 0.0) exit;
	enddo
	! close file.
	close(13);
	! print total distance x and time aloft t to terminal.
	write(*,*) "X Distance: ",x, "Time Aloft: ",t;
END PROGRAM Lab12