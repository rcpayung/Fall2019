PROGRAM homework9
	! Riley Payung
	! CDS 251
	! 04/09/2020
	! Homework 9
	! The purpose of this program is to calculate the area
	! under a curve of the integral in the integral function below
	! The program also calculates absolute and relative error.

	IMPLICIT NONE;
	
	! variable dec
	REAL :: a,b,h,x, sum = 0.0, tArea, exact, actual;
	INTEGER :: i,n;
	! ask user for input on limits of integration and increment
	PRINT*,"Please enter the lower limit of integration";
	READ(*,*) a
	PRINT*,"Please enter the upper limit of integration";
	READ(*,*) b
	PRINT*,"Please enter the increment";
	READ(*,*) h
	
	! set the number of rectangles to find the area for.
	n = int((b - a) / h);
	
	! loop through each rectangle/trapezoid and find/sum the area
	do i = 1, n
		x = a + float(i - 1) * h + 0.5 * h;
		sum = sum + tArea(h,x)
	enddo
	
	! find the actual value of the integral at the limits of integration
	actual = (exact(b)-exact(a));
	
	! print out the calculated area, absolute error, and relative error
	! as a percentage.
	print*,"calculated: ",sum;
	print*,"Abs Error: ",(actual - sum);
	print*,"Relative: ",((actual - sum) / actual) * 100,"%";
	
END PROGRAM homework9

FUNCTION tArea(h,x) RESULT(area)
	IMPLICIT NONE;
	! variable dec
	REAL :: h, x, area, integral;
	! calculate the area of this trapezoid using the integral.
	area = ((h / 2) * (integral(x) + integral(x+h)));
	
END FUNCTION tArea

FUNCTION integral(x) result (y)
	IMPLICIT NONE;
	! variable dec
	REAL :: x, y;
	! calculate the value of the integral at x.
	y = exp(-x) * (sin(x) ** 2);
	
END FUNCTION integral

FUNCTION exact(x) result (y)
	IMPLICIT NONE;
	! variable dec
	REAL :: x, y;
	! calculate the exact area of the integral after integration
	! at the limits of integration.
	y = (exp(-x)/10)*((cos(2*x)) + (2 * sin(2*x)) - 5)
END FUNCTION exact