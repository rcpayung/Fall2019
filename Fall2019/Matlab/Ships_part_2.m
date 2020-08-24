%% HEADER SECTION
%
% NAME: <Add relevant comment here>
% DATE: <Add relevant comment here>
% ASSIGNMENT: <Add relevant comment here>
% PURPOSE: <You must insert in here the purpose of the code as it relates the to question.>


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
    
    a_vec(x) = area; % <Comment your code here>
     
end
% Total_area = <Add  code here> % <Comment your code here> % HINT: Remember
% half_breath_area' calculates the area for one half of the shp's deck

%% OUTPUTS
%
% <use the fprintf command to display the final output to the user here>


%% COMPUTE CUMMULATIVE SUM
%%
%
s = 0;
for i = 1:length(a_vec)
    
    s = s + a_vec(i); % <Comment your code here>
    cummulative_sum(i) = s; % <Comment your code here>
end

% <Add code and comments for part c of part 2>