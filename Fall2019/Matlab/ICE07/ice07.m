% Riley Payung
% Date: 10/11/2019
% Assignment ICE07

% clear workspace
clear;clc

% variable declaration
h = 6.626 * 10^-34;
c = 3 * 10^8; % Speed of light in m/s
% Format: UV Blue Green Red Infrared
lambda = [300 480 540 620 700];
E = 1:length(lambda);

% Computational Section & Output Section. (It worked better than creating
    % an output section.
for i = 1:length(lambda)
    E(i) = (h * (c * (1/lambda(i))));
    fprintf("%d nm: %i Joules\n",lambda(i),E(i))
end