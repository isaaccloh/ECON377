## Example 2.3 w/ dollars 
# Dataset ceosal1
library(wooldridge)
View(ceosal1)
reg = lm(salary ~ roe, data = ceosal1)
reg$coefficients

# Create new variable equal to salary in dollars
ceosal1$salarydol = ceosal1$salary * 1000
reg_2 = lm(salarydol ~ roe, data = ceosal1)
reg_2$coefficients

# w/ roedec
ceosal1$roedec = ceosal1$roe * 1/100 
reg_3 = lm(salary ~ roedec, data = ceosal1)
reg_3$coefficients

# Comparing R-squared values
summary(reg)$r.squared
summary(reg_3)$r.squared

## Example 2.10
reg = lm(log(wage) ~ educ, data = wage1)
b1hat = reg$coefficients[2]
b1hat * 100 * 4

# Prediction
b0hat = reg$coefficients[1]
exp(b0hat + b1hat * 16) 

## Example 2.11
reg = lm(log(salary) ~ log(sales), data = ceosal1)
reg$coefficients
