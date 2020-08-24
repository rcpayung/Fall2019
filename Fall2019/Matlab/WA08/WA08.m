% Riley Payung
% Oct 22, 2019
% WA08A Part 1-3

%clear workspace
clear;clc

% PART 1:
% variable declaration section
dog1 = 600; % dog 1 height
dog2 = 470; % dog 2 height
dog3 = 170; % dog 3 height
dog4 = 420; % dog 4 height
dog5 = 250; % dog 5 height
% computation section
mean = (dog1 + dog2 + dog3 + dog4 + dog5) / 5; % mean of all five dog heights
disp(mean) % display the mean of the dogs heights

% PART 2:
% variable declaration section
dogV = [dog1 dog2 dog3 dog4 dog5]; % Vectors of all dog heights
% computation section
summedV = sum(dogV); % summed value of dogV elements.
meanV = summedV / length(dogV); % sum of dog heights divided by the length of the dogV vector.
disp(meanV); % display the mean of the dogs heights using meanV.

% PART 3:
%variable Declaration section:
x = [dog1 dog2 dog3 dog4 dog5]; % Vectors of all dog heights
s = 0; % mean value for part 3, beginning from 0.
n = length(x); % n is the size of the vector x.
%computation section:
for i = 1:n
    s = s + x(i); % adds each value from the x vector.
end
s = s / n; % divides mean3 by the length of the vector.
disp(s); % Display the mean3 value.

% WA08B
summation = 0; % the value of the summation in part B.
for i = 1:n
   summation = summation + (x(i) - s)^2; % the summation adds the squared value of the elements - the mean.
end
ssd = sqrt(summation/(n-1)); % calculate the ssd.
disp(ssd) % display the ssd.

% WA08C
% The dog heights are all over the place since the standard deviation value
% is 172.5399. 

% WA08D

A = [1 3 100;
     6 6 66;
     5 7 6;];

n = size(A,1) * size(A,2);
m = 0;

for i = 1:size(A,1)
    for j = 1:size(A,2)
       m = m + A(i,j); 
    end
end
m = m / n; % mean calculating using itself and elements in matrix.
summation = 0; % initialization for summation.
for i = 1:size(A,1)
    for j = 1:size(A,2)
        summation = summation + (A(i,j) - m)^2;
    end
end
ssd = sqrt(summation/(n-1)); % standard deviation calculation.
fprintf("mean: %.2f ssd: %.2f",m,ssd);
