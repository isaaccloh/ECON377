# Clear environment
rm(list = ls())

# Load wooldridge
library(wooldridge)

# Example of t-value/t-statistic
reg = lm(log(wage) ~ educ + exper + tenure, data = wage1)

summary(reg)$coefficients
b2 = summary(reg)$coefficients[3,1] #row, column
se = summary(reg)$coefficients[3,2]
t_val = b2 / se
t_val = summary(reg)$coefficients[3,3] # Easier way 

# Regression
summary(reg)