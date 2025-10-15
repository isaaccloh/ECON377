# Units of measurement example
library(wooldridge)

?ceosal1
View(ceosal1)

# Create new variable salarydol = 1000 * salary
ceosal1$salarydol = 1000 * ceosal1$salary

# Regress salary on roe
reg = lm(salary ~ roe, data = ceosal1)

# Regress salarydol on roe
reg_dol = lm(salarydol ~ roe, data = ceosal1)

# Comparing coefficients
reg$coefficients
reg_dol$coefficients # Everything multiplied by 1000

# Create roedec
ceosal1$roedec = ceosal1$roe / 100

# New regression 
reg_dec = lm(salary ~ roedec, data = ceosal1)
reg$coefficients
reg_dec$coefficients

# Label OLS coefficients
beta0 = reg$coefficients[1]
beta1 = reg$coefficients[2]

# R-squared doesn't change
summary(reg)$r.squared
summary(reg_dec)$r.squared


## Log-level regression
reg = lm(log(wage) ~ educ, data = wage1)
reg$coefficients

beta1 = reg$coefficients[2]
beta1 * 100 * 4

## Log-log regression
reg = lm(log(salary) ~ log(sales), data = ceosal1)
summary(reg)
beta1 = reg$coefficients[2]

# Percent change in salary 
25 * beta1

# PS6 Q1
reg = lm(cons ~ inc, data = saving)
?saving
beta0 = reg$coefficients[1]
beta1 = reg$coefficients[2]
beta0 + beta1 * 42825

# Q2
beta1 * -2023

# Q3
n = nrow(saving)
SSE = (n-1) * var(reg$fitted.values)
