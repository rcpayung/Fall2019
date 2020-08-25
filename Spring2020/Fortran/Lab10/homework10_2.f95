PROGRAM Homework10_2
	! Riley Payung
	! CDS 251
	! 04/16/2020
	! Homework 10 (Part 2)
	! The purpose of this program is to read in the 20k numbers
	! from the first part of homework 10 and create a histogram
	
	INTEGER :: I, N, nBoxes, BadCount = 0;
	REAL :: HistStart, HistEnd, HistRange, iHist, Num, BoxWidth;
	REAL, ALLOCATABLE :: Hist(:);

	open(42,file="Bumps.txt");
	read(42,*) N;
	! Setting the histogram's values
	HistStart = 10;
	HistEnd = 30;
	HistRange = HistEnd - HistStart;
	nBoxes = 100;
	BoxWidth = HistRange / nBoxes;
	! allocate the histogram with the number of boxes
	ALLOCATE(HIST(nBoxes));
	! loop through the numbers in our list
	DO I = 1, N
		read(42,*) Num;
		! calculate the index in which to increase the value of.
		iHist = Int((Num-Histstart) * float(NBoxes) / HistRange)
		! if the index is greater than 1 and less than the total 
		! number of boxes, increment.
		if (iHist .ge. 1 .and. iHist .le. nBoxes) then
			Hist(iHist) = Hist(iHist) + 1
		else
		! Not in the range. Increase the bad number counter
			BadCount = BadCount + 1
		endif
	ENDDO
	! close the file for reading
	close(42)
	! open the new histogram file for writing.
	open(42,file="BumpsHist.txt");
	! look through and calculate x and write out both x and the histogram value
	do I = 1, nBoxes
		x = (float(i) - 0.5) * BoxWidth + HistStart
		write(42,*) x, Hist(i)
	enddo
	! close the file for writing
	close(42);
	! deallocate allocated memory.
	DEALLOCATE(Hist)
	! print the bad number counter.
	print*,"BadCount",BadCount;
	
END PROGRAM Homework10_2