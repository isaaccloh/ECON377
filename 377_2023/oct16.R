# Clear memory
rm(list = ls())

# Load wooldridge 
library(wooldridge)

## Example 2.3 
ls(ceosal1)

# Running regression
reg = lm(salary ~ roe, data = ceosal1)

# View results
summary(reg)
reg$coefficients

# Create new variable salarydol
ceosal1$salarydol = ceosal1$salary * 1000
ls(ceosal1)

# Running new regression
reg_dol = lm(salarydol ~ roe, data = ceosal1)

# View results
reg$coefficients
reg_dol$coefficients # Slope and intercept multiplied by 1000

# Create new variable called roedec 
ceosal1$roedec = ceosal1$roe / 100

# Running new regression 
reg_dec = lm(salary ~ roedec, data= ceosal1)

# View results
reg$coefficients
reg_dec$coefficients # Intercept unchanged, slope * 100

# View R-squareds
summary(reg)$r.squared
summary(reg_dec)$r.squared

## Example 2.10
# Log-level regression
reg_level = lm(wage ~ educ, data = wage1)
reg_log = lm(log(wage) ~ educ, data = wage1)
reg_level$coefficients
reg_log$coefficients

# Predicted pct change of 4 year increase in educ
reg_log$coefficients[2] * 100 * 4

## Example 2.11
reg_ce = lm(log(salary) ~ log(sales), data = ceosal1)
reg_ce$coefficients
