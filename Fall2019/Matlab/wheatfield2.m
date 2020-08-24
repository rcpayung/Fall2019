
% PROGRAM:  wheatfield2.m
% AUTHOR:  Joseph A. Marr
% DATE OF LAST MODIFICATION:  15 APR 2013

% PURPOSE:  To deomonstrate the basics of stochastic simulation
% for CDS-130.  This program appears in a sequence demonstrated
% in the presentation "Introduction to Modeling, III:  Stochastic
% Models and Monte Carlo Methods."  Companion programs are
% wheatfield1.m and wheatfield3.m

% This program introduces the concept of multiple simulations,
% and user defined inputs from the keyboard.  The program also
% introduces the use of an external function call.


%-------------------- SYSTEM ADMIN -----------------------------

clear;clc
rng('shuffle')                                    %initialize rng

%-------------------- MODEL PARAMETERS -------------------------

deltat = 1;                                       %time step
sunny_growth_rate = 0.15;                         %sunny growth rate
cloudy_growth_rate = 0.05;                        %cloudy growth rate
number_of_expts = input('Enter # of expts:  ');   %number of expts
results = zeros(1,number_of_expts);               %results vector
P(1) = 1000;                                      %initial condition
chance_of_sun = 0.75;                             %chance for a sunny month


%-------------------- OUTER SIMULATION LOOP --------------------
for expt = 1:number_of_expts
   
   %-------------------- INNER SIMULATION LOOP -----------------
   for t = 1:6
      if (rand <= chance_of_sun)
         P(t+1) = P(t) + deltat*sunny_growth_rate*P(t);
      else
         P(t+1) = P(t) + deltat*cloudy_growth_rate*P(t);
      end
   end
   results(expt) = P(7);
   
end

%-------------------- OUTPUT STATISTICAL REPORT -----------------
statistical_report(results);          %use "statistical_report.m"


%-------------------- VISUALIZE RESULTS ------------------------
hist(results,6);                      %plot histogram of results

title('Harvest Yields for Stochastic Wheatfield2 Simulation',...
   'FontName','Arial','FontSize',12,'FontWeight','Bold')
xlabel('Total Bushels of Wheat','FontName','Arial',...
   'FontSize',10,'FontWeight','Bold')
ylabel('Frequency (Count)','FontName','Arial',...
   'FontSize',10,'FontWeight','Bold')
set(gca,'FontName','Arial','FontSize',8)


