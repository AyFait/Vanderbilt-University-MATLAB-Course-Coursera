%M2a;
%We borrowed $1000 at a 10% annual interest rate. If we did not make a payment for two years, and assuming there is no penalty for non-payment, how much do we owe now? Assign the result to a variable called debt.

brr = 1000
annual_intr_pcent = 0.1
yr1_intr = brr * annual_intr_pcent
debt_yr1 = brr + yr1_intr

yr2_intr = debt_yr1 * annual_intr_pcent %year 1 debt compounded
debt_yr2 = debt_yr1 + yr2_intr

debt = debt_yr2
