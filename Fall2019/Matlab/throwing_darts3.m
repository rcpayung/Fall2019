%PROGRAM:  throwing_darts3.m
%AUTHOR:  Joseph A. Marr
%DATE OF LAST MODIFICATION:  7 November 2011

%PURPOSE:  throwing_darts3.m was written to demonstrate a basic
%Monte Carlo simulation technique known as "hit or miss".  In
%this program, we compute an approximate value for pi using
%a  randomized computation.  Thus, we "harness" randomness, 
%and put it to work for us.

%The concept is straightforward:  circumscribe a unit
%circle with a bounding square.  Each side of the square is therefore
%two units in length, meaning that the square has four square units
%of area.  The area of the circle is pi*r^2.  Since r = 1, we know
%that the area of the circle is equal to pi.  Now, the ratio
%of the area of the circle to the area of the square is pi/4.  Knowing
%this number, we then conduct a numerical experiment whereby we randomly
%"throw darts" at the square.  Some of these darts will fall inside
%the boundary of the circle, and some will not.  If we throw
%enough darts (perhaps a million or more), and then taken the ratio
%of the number of darts falling inside the circle to the total
%number of darts thrown at the box, this ratio will be an increasingly
%good approximation to pi/4.  Thus, we can compute an increasingly
%good approximation to pi by multiplying that ratio by 4.

%NOTE:  This program continues your exposure to good software
%engineering practice.  Note the liberal use of white space.  This
%dramatically enhances readability -- vitally important when
%your're trying to read SOMEONE ELSE'S code!  Note also that the
%program's functional sections are clearly demarcated.  This
%is also important, so the reader knows where he/she is inside
%your program, and, what the specific code he/she is looking at
%is designed to do.  Finally, note the variable names:  these
%names are "self-documenting", meaning that just by reading
%the variable name, you pretty much know what value that variable
%is intended to contain.  So, "darts_inside_circle" must be
%a count of how many darts are actually inside the circle.
%Similarly, "total_darts" is probably the total number of darts
%we can throw at the square; "pi_estimate" is likely the
%estimated value of pi that's produced by the simulation.  In
%each of these cases, the answer is a resounding "YES"!  Good
%computer code should speak for itself.  That's what self-
%documenting variable names are designed to do.

%CHANGELOG:

%DATE           MODIFICATION                         PROGRAMMER
%===========    ==================================   ==========
%07 NOV 2011    ORIGINAL CODE, DEBUG AND COMMENTS       JAM
%08 NOV 2011    ADDITIONAL DEBUGGING; TESTS OK          JAM
%25 JUL 2012    ADDED RNG('SHUFFLE')                    JAM



%****************** BEGIN PROGRAM *****************************

%------------------ SYSTEM BOOKEEPING -------------------------
clear;clc


%------------------ USER INPUT --------------------------------
total_darts = input('Enter the number of darts to throw:  ');


%------------------ INITIALIZE PARAMETERS ---------------------
rng('shuffle')                                        %initialize random generator
darts_inside_circle = 0;                              %count of darts inside circle
dart_count = 0;                                       %darts thrown so far


%------------------ THROW "DARTS" -----------------------------
while dart_count <= total_darts                       %Note:  WHILE loop!
   dart_xcoord = 2.0*rand - 1.0;                      %dart's random x coordinate [-1.0,1.0]
   dart_ycoord = 2.0*rand - 1.0;                      %dart's random y coordinate [-1.0,1.0]
   if (dart_xcoord^2 + dart_ycoord^2 <= 1.0)          %test:  dart inside circle?
      darts_inside_circle = darts_inside_circle + 1;  %if yes, then record this fact
   end
   dart_count = dart_count + 1;                       %record one more dart thrown
end


%------------------ ESTIMATE PI -----------------------------
pi_estimate = 4.0*(darts_inside_circle/total_darts);  %estimate pi from dart data


%------------------ PRINT RESULTS TO CONSOLE WINDOW ---------
fprintf('\nMonte Carlo estimated value for pi:  %8.6f',pi_estimate)
fprintf('\n             Accepted value for pi:  %8.6f',pi)
fprintf('\n                    Relative error:  %6.4f percent\n\n',...
   100.0*(abs(pi_estimate - pi)/pi));


%****************** END PROGRAM *****************************