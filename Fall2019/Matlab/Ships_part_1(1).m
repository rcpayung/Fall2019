%% HEADER SECTION
%
% NAME: Riley Payung
% DATE: 11/11/2019
% ASSIGNMENT: WA11
% PURPOSE: Weekly Assignment 11 Part 1


%% CLEAR THE SCREEN AND WORKSPACE
%
clc; clear


%% VARIABLE ASSIGNMENTS
bases = % <Add code here. HINT: Don't forget to add measurements for the bow at stern of the ship>; % <Comment your code here.>
num_panels = length (bases) - 1; % <Comment your code here>
half_breath_area = 0; % <Comment your code here>
h = 25; % <Comment your code here>


%% COMPUTATIONS
%
for x = 1:num_panels
    b1 = bases(x); % <Comment your code here>
    b2 = bases(x+1); % <Comment your code here>
    
    area = 0.5 * h * (b1 + b2); % <Comment your code here>
    
    half_breath_area = half_breath_area + area; % <Comment your code here>
     
end
% Total_area = <Add  code here> % <Comment your code here> % HINT: Remember
% half_breath_area' calculates the area for one half of the shp's deck

%% OUTPUTS
%
% <use the fprintf command to display the final output to the user here>
