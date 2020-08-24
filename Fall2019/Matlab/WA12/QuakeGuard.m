 
%% Header
% Riley Payung
% 11/18/2019
% WA12
 
 
%% Clear the screen and the command window
clc; clear
 
 
%% Read in data from the earthquake file and specify data type from each column in this file
formatSpec = '%{yyyy-MM-dd}D%f%f%f%f'; % Specifies the column format
T = readtable('earthquake_data.csv','Format',formatSpec); % Reads in the columns into a matrix T
 
 
%% Begin setting up the initial parameters for the model
% We have two different scenarios where the price will increase based on probability 
price_increase_rate_1 = 0.005;       % Birth rate (pricez increase) based on medium probability f 0.34 to 0.66
price_increase_rate_2 = 0.010;       % Birth rate (price increase) - based on high probability of 0.67 to 1.00
price_decrease_rate = -0.001;        % Death rate (price decrease) - basedd on low probability of 0.00 to 0.33
deltat = 1;                          % Time step of one day
price(1) = 5000;                     % Initial starting price of the product
probability (1) = 0.00;              % Probability of an earthquake occuring at the launch date
time_duration = 730;                 % Time period in days
start_date = '2010-01-01';           % Starting date that the product to goes on sale
 
 
%% Create a timetable to be used to easily filter table data between specific date ranges
TT = table2timetable(T); % Converts the table to a timetable. More information here: https://www.mathworks.com/help/matlab/matlab_prog/subscript-into-times-of-timetable.html
 
 
 
%% Model implementation
for t = 1:time_duration
    
    % These two lines of code tells us what the stop date is for
    % filtering our earthquakes table. Remember, the probability will
    % be calculated using data from the start date that the product
    % goes on sale up to one day before the date being assessed.
    new_date = addtodate(datenum(start_date), t-1, 'day'); % decrements day by 1 
    new_date = datestr(new_date); % Converts date from numerical to date format
    % The following two lines of code filters the earthquake data
    TR = timerange(start_date,new_date); % Create timerange subscript (i.e. a filter contain the dates your need)
    TT2 = TT(TR,:); % Filter table to include all records up to the current date (i.e. new_date)
 
    s = size(TT2); % Get number of rows and columns
 
    % Compute the probability of a magnitude 6 or more earthquake occuring based the TT2 table
    probability (t + 1) = sum(TT2.Magnitude >= 6)/s(1); 
 
 
    if (probability(t + 1) >= 0) && (probability (t + 1) <= 0.33)
        if (price(t) <= 2500)
            price(t+1) = price(t);
        else
            price(t+1) = price(t) + deltat*(0 - price_decrease_rate)*price(t);
        end
        % Add code to test if the price of QuakeGuard at time price(t+1) is
        % going to be less $2500. If this happens
        % then do not change the price of QuakeGuard, that is, price(t+1) =
        % price(t)
    elseif (probability (t + 1) > 0.33) && (probability(t + 1) <= 0.66)
        if (price(t) <= 2500)
            price(t+1) = price(t);
        else
            price(t+1) = price(t) + deltat*(0 + price_increase_rate_1)*price(t);
        end
    else
        if (price(t) <= 2500)
            price(t+1) = price(t);
        else
            price(t+1) = price(t) + deltat*(0 + price_increase_rate_2)*price(t);
        end
    end % if
 
 
    
end % for
 
%% Output the results
% REMEMBER: price is a vector of price changes, and probability is a vector
% of probability changes
fprintf('The price of QuakeGuard as of January 1, 2012 is $%0.2f\n',price(t+1))
figure(1) % Creates an empty figure
plot(probability);
xlabel("Days");
ylabel("Probability of Earthquake Mag6 Occurring");
% <Add code plot the changes in probabilities over time>
% <Add code to label axis>
figure(2) % Creates an empty figure
plot(price);
xlabel("Days");
ylabel("Price in $USD");
% < ADD code to plot the changes in prices over time
% <Add code to label axis>

