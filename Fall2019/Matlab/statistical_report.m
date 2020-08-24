%FUNCTION  statistical_report.m
%AUTHOR:  Joseph A. Marr
%DATE OF LAST MODIFICATION:  15 APR 2013

%PURPOSE:  To provide CDS-130/03 students with a basic, automated
%statistics reporting module for use in their own Matlab programs.

function statistical_report(datavector)

%INPUT PARAMETERS:
%-----------------------------------------------------------
% datavector:  VECTOR of data values -- assumed NUMERICAL


%USE EXAMPLE AND RESULTING OUTPUT:
%computing the statistics of a 100,000 x 1 data
%column vector (also works with row vectors!):
%
% >> statistical_report(rand(100000,1))
%
%                DATA STATISTICS REPORT
%=======================================================
%Mean of data vector:  0.500192
%Median of data vector:  0.501746
%Mode of data vector:  1.08542e-005
%Maximum element in data vector:  0.999995
%Minimum element in data vector:  1.08542e-005
%Population standard deviation of data vector:  0.288372
%Variance of data vector:  0.0831585

%STATISTICAL REPORTING:
%-----------------------------------------------------------

fprintf('\n\n');
fprintf('              DATA STATISTICS REPORT');
fprintf('\n=======================================================');
fprintf('\n              Mean of data vector:  %g', mean(datavector));
fprintf('\n            Median of data vector:  %g', median(datavector));
fprintf('\n              Mode of data vector:  %g', mode(datavector));
fprintf('\n   Maximum element in data vector:  %g', max(datavector));
fprintf('\n   Minimum element in data vector:  %g', min(datavector));
fprintf('\nPopulation std dev of data vector:  %g', std(datavector));
fprintf('\n          Variance of data vector:  %g', var(datavector));
fprintf('\n\n        Number of data elements:  %d\n\n', length(datavector));

end