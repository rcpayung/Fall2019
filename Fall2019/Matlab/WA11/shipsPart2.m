% Riley Payung
% 11/11/2019
% WA-11
% Weekly Assignment 11 Part 1

%clear workspace and screen
clc; clear;

%variable declaration
bases = 0:25:275;                                   % bases, spaced 25 meters apart.
num_panels = length (bases) - 1;                    % the number of panels (spaced 25 meters apart)
half_breath_area = 0;                               % The total half breath area of the ship, initial.
a_vec = 0:num_panels - 1;
b_vec = a_vec;

for i = 1:num_panels                                % For each panel,
    b1 = bases(i);                                  % calculate base1
    b2 = bases(i+1);                                % calculate base2
    
    area = 0.5 * 25 + (b2 + b1);                    % calculate the area
    
    half_breath_area = half_breath_area + area;     % add the area calculated to the half breath area.
    
    a_vec(i) = area;                                 % Set the cumulative area of each panel.
end

for i = 1:length(a_vec)
    area = a_vec(i);
    if (i == 1)
        b_vec(i) = area;
    end
    if (i ~= 1)
        b_vec(i) = b_vec(i-1) + area;
    end
end

plot(num_panels,b_vec);
view()

% The value of plotting the cumulative sum graph is to see how the area of
% the required material increases as we increase in the number of panels.