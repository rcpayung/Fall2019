
% PROGRAM:  wheatfield1.m
% AUTHOR:  Joseph A. Marr
% DATE OF LAST MODIFICATION:  15 APR 2013

% PURPOSE:  To deomonstrate the basics of stochastic simulation
% for CDS-130.  This program appears in a sequence demonstrated
% in the presentation "Introduction to Modeling, III:  Stochastic
% Models and Monte Carlo Methods."  Companion programs are
% wheatfield2.m and wheatfield3.m


%-------------------- SYSTEM ADMIN -----------------------------

rng('shuffle')                                    %initialize rng

%-------------------- MODEL PARAMETERS -------------------------

deltat = 1;                     %time step
P(1) = 1000;                    %initial condition
sunny_growth_rate = 0.15;       %wheat growth rate with sun
cloudy_growth_rate = 0.05;      %wheat growth rate without sun

%-------------------- SIMULATION LOOP --------------------------

for t = 1:6
    chance_of_sun = rand;
    if (chance_of_sun <= 0.75)
       P(t+1) = P(t) + deltat*sunny_growth_rate*P(t);
    else
       P(t+1) = P(t) + deltat*cloudy_growth_rate*P(t);
    end
end

%-------------------- OUTPUT FINAL RESULT ----------------------
P(7)


%-------------------- VISUALIZE RESULTS ------------------------
plot([1:7],P,'-r*')
title('Harvest Yield for Wheatfield1 Simulation',...
   'FontName','Arial','FontSize',12,'FontWeight','Bold')
xlabel('Month (1 = beginning of April)','FontName','Arial',...
   'FontSize',10,'FontWeight','Bold')
ylabel('Total Bushels of Wheat','FontName','Arial',...
   'FontSize',10,'FontWeight','Bold')
set(gca,'FontName','Arial','FontSize',8)
