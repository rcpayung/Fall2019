% Riley Payung
% G01000669
% 12/2/2019
% WA 14

clear;clc
% variables
interestRate = 0.0012;
accountBalance = 6000;
carInsurance = 600;
month = 1;
months = [];
% computation
while (accountBalance > 0)
    
    if (mod(month,12) == 0)
        accountBalance = accountBalance + 1500;
    end
    if (mod(month,2) == 0)
        accountBalance = accountBalance - 600;
    end
    accountBalance = accountBalance + accountBalance * interestRate;
    months(month) = accountBalance;
    month = month + 1;
end
% results
plot(months);
xlabel("Month");
ylabel("Account Balance");