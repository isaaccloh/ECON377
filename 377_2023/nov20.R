# Clear environment
rm(list = ls())

## Example 4.1
library(wooldridge)

reg = lm(log(wage) ~ educ + exper + tenure, data = wage1)

# T-values
t2 = summary(reg)$coefficients[3,3]
t2 = summary(reg)$coefficients[3,1] / summary(reg)$coefficients[3,2]

# Degrees of freedom
df = reg$df.residual

# Critical value
alpha = 0.01
c = qt(1- alpha, df = df)

# Test
t2 > c # Reject

## Example 4.1
reg = lm(math10 ~ totcomp + staff + enroll, data = meap93)
reg$coefficients

# T-value
summary(reg)$coefficients
t3 = summary(reg)$coefficients[4,3]

# critical value
df = reg$df.residual
alpha = 0.05
c = qt(alpha, df = df)

# Hypothesis test 
t3 < c 
