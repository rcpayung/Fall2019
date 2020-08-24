% Riley Payung
% 10/14/2019
% WA07 Part A

%clear workspace
clear;clc

%variable declarations:
a = 0;
b = 12;
c = 4;

% computation section
for n = 1:10
    a = a+1;
    b = b-1;
    c = a + b;
end
disp(a);
disp(b);
disp(c);