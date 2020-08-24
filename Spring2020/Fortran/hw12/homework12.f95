PROGRAM Homework12
	! Riley Payung
	! CDS 251
	! 05/07/2020
	! Homework 12
	! The purpose of this program is to simulate planetary motion
	! using Euler's Method and provide the follwing ouput:
	! Time step, Initial Kinetic Energy, Initial Potential Energy,
	! Initial Total Energy, Final Kinetic, Final Potential, Final Total.
	
	IMPLICIT NONE;
	
	! variable declaration
	INTEGER :: i, n;
	LOGICAL :: printData = .true.;
	REAL :: x0,y0,tstep,time,t,potential,kinetic,total,p0,k0,pf,kf,e0,ef;
	REAL :: M = 1.0, m_ = 1.0, G = 1.0;
	REAL :: planet(4), olds(4);
	CHARACTER(25) :: outfile, arg;
	
	! Get initial conditions from the user.
	print*,'Please enter an initial X Position:';
	read(5,*) planet(1);
	print*,'Please enter an initial Y Position:';
	read(5,*) planet(2);
	print*,'Please enter an initial X Velocity:';
	read(5,*) planet(3);
	print*,'Please enter an initial Y Velocity:';
	read(5,*) planet(4);
	
	print*,'Please enter Time Step:';
	read(5,*) tstep;
	print*,'Please enter Total Time:';
	read(5,*) time;
	
	! For more than 1 output file.
	print*,'Please enter File name for output:';
	read(5,*) outfile;
	
	! Get command line argument, if the argument is -none, the data will not be
	! printed out. I did this to drastically shorten the amount of time that
	! it would take to get the final initial conditions done, since it was
	! printing out 130,000 * 6 numbers, making the time taken to actually do
	! the computation unbearable. SO, this was born in order to prevent any
	! printing to the screen.
	CALL GET_COMMAND_ARGUMENT(1,arg);
	IF (arg .eq. '-none') printData = .false.;
	
	! Calculate the inital conditions of n and t.
	n = int(time / tstep);
	t = 0.0;
	! calculate the initial potential, kinetic, and total energies.
	p0 = potential(g,M,m_,planet(1),planet(2));
	k0 = kinetic(m_,planet(3),planet(4));
	e0 = total(p0,k0);
	! open the file for writing out.
	open(13, file=outfile);
	
	! write out the initial conditions
	write(13,*) planet(1), planet(2), p0, k0, e0, t;
	
	! loop through, starting at 1 and going to n.
	DO i = 1, n
		! set the old values.
		olds(1) = planet(1);
		olds(2) = planet(2);
		olds(3) = planet(3);
		olds(4) = planet(4);
		
		! Calculate new values of x, y, vx, vy
		planet(1) = olds(1) + tstep * olds(3);
		
		planet(3) = olds(3) + tstep * ((-g * M) / (sqrt(planet(1)**2 + &
			planet(2)**2)**3) * olds(1));
		
		planet(2) = olds(2) + tstep * olds(4);
		
		planet(4) = olds(4) + tstep * ((-g * M) / (sqrt(planet(1)**2 + &
			planet(2)**2)**3) * olds(2));
		
		! Calculate final potential, kinetic, and total energies
		pf = potential(g,M,m_,planet(1),planet(2));
		kf = kinetic(m_,planet(3),planet(4));
		ef = total(pf,kf);
		
		! SEE COMMANDLINE ARGS FOR THE INFORMATION ON PRINTDATA.
		IF (printData) THEN
			print*,'Initial Potential Energy:',p0;
			print*,'Initial Kinetic Energy:',k0;
			print*,'Initial Total Energy:',e0;
			print*,'';
			print*,'Final Potential Energy:',pf;
			print*,'Final Kinetic Energy:',kf;
			print*,'Final Total Energy:',ef;
			print*,'';
			print*,'';
		ENDIF
		! time step the current time.
		t = t + tstep;
		! write out the new conditions
		write(13,*) planet(1), planet(2), pf, kf, ef, t;
		
	ENDDO
	
	! close the file.
	close(13);

END PROGRAM Homework12

FUNCTION potential(g,M,m_,x,y) RESULT (pot)
	REAL :: g, M, m_, x, y, pot;
	
	pot = (-g * M * m_) / (sqrt(x**2 + y**2));
END FUNCTION potential

FUNCTION kinetic(m,vx,vy) RESULT (kin)
	REAL :: m, vx, vy, kin;
	
	kin = 0.5*m * (vx**2 + vy**2);
END FUNCTION kinetic

FUNCTION total(pot, kin) result (tot)
	REAL :: pot, kin, tot;
	
	tot = pot + kin;
END FUNCTION total