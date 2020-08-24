% Riley Payung
% 10/14/2019
% WA07 Part B

%clear workspace
clear;clc

%variable declarations:
R = 8.314;
T = 600;
Tc = [549.8 563.5 553.5 550.0 562.0 568.8];
Pc = [2.53 2.63 2.56 2.49 2.65 2.69];
Vm = [2100 1900 1800 2210 1875 1980];
a = 1:6;
b = 1:6;
P = 1:6;

%computation section
for n = 1:length(Tc)
    a(n) = 27 * (R * Tc(n))^2 / (64 * Pc(n));
    b(n) = (R * Tc(n)) / (8 * Pc(n));
    P(n) = ((R * T) / (Vm(n) - b(n))) - a(n) / (Vm(n)^2);
    
end
fprintf('P=%.4f \n', P);

% Quesiton 1: It specifies how many places after the decimal to print.
% Question 2: Its an escape sequence to begin to print on the next line.