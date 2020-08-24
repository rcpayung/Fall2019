% Riley Payung
% 11/25/2019
% WA13 Part 2

clear;clc

% Variable assignment
X = [1, 7, 9, 5, 2]; % list of x coordinates
Y = [4, 2, 7, 9, 8]; % list of y cooridnates

X2 = 0:length(X)-1; % Due to the nature of using this algorithm, the total number of elements subtracts 1.
Y2 = 0:length(Y)-1; % Due to the nature of using this algorithm, the total number of elements subtracts 1.
sumX = 0;           % Sum of elements in X, used later.
sumY = 0;           % Sum of elements in Y, used later.

total_area = 0; % Initialize total area

for i = 1:length(X)-1
    X2(i) = X(i)*Y(i+1); % Calculate the values for the X2 array, Mulitply X(i) by Y(i+1)
    Y2(i) = Y(i)*X(i+1); % Calculate the values for the Y2 array, Mulitply Y(i) by X(i+1)
end
% Sum the elements in the created arrays:
sumX = sum(X2);
sumY = sum(Y2);
% calculate the total area, divided by 2.
total_area = (sumX - sumY) / 2;
% print the total area: 
fprintf("Total Area: %.2f meters^2",total_area);