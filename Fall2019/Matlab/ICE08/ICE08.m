% Riley Payung
% Oct 22 2019
% ICE08

% PART 1:
%clear workspace
clear; clc

%variable declaration

x = [1 4 6 9 2 3];
n = length(x);
m = 0;
%computation
for i = 1:length(x)
    m = m + x(i);
end
m = m / n;

fprintf("Part 1 mean: %.2f",m);

% PART 2:
%variable declaration
A = [1,4,6; 
    9,2,3];
%computation
m = 0; % reset mean to 0.
n = 0;
[r,c] = size(A);
for i = 1:r
    for j = 1:c
        m = m + A(i,j); % sum the values in A.
        n = n + 1;
    end
end
m = m / n; % calculate the mean value of A.

fprintf("\nPart 2 mean: %.2f",m);
