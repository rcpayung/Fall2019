clear;clc

A = [0	1	0	1	0;
     1	0	0	0	1;
     0	0	1	0	0;
     1	0	1	0	1;
     0	1	1	1	0];
for i = 1:3
    for j = 1:5
        if ( A(i,j) == 1 && A(i+1,j) == 1 && A(i+2,j) == 1)
            fprintf('Found pattern at: %d,%d', i , j)
        end
    end
end