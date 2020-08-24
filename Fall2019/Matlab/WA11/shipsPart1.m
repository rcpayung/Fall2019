% Riley Payung
% 11/11/2019
% WA-11
% Weekly Assignment 11 Part 1

%clear workspace and screen
clc; clear;

%variable declaration
bases = 0:25:275;                   % bases, spaced 25 meters apart.
num_panels = length (bases) - 1;    % the number of panels (spaced 25 meters apart)
half_breath_area = 0;               % The total half breath area of the ship, initial.

for i = 1:num_panels                % For each panel,
    b1 = bases(i);                  % calculate base1
    b2 = bases(i+1);                % calculate base2
    
    area = 0.5 * 25 + (b2 + b1);    % calculate the area
    
    half_breath_area = half_breath_area + area;   % add the area calculated to the half breath area.
end

fprintf("Total Area: %d meters squared.",half_breath_area);

% The code works like this: The bases are spaced 25 meters apart, allowing
% for 11 total trapezoidal areas to be calculated. The total area is then
% added together in the for loop and the value is eventually printed after
% going through each of the individual trapezoidal figures.