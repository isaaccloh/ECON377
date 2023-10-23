# Clear environment 
rm(list = ls())

# Load wooldridge 
library(wooldridge)

# Run a regression
reg = lm(wage ~ educ, data = wage1)
summary(reg)

# Calculating sample error of beta1
n = nrow(wage1)
SSTX = (n-1) * var(wage1$educ)

SSR = sum(reg$residuals^2)
hsigmasq = 1 / (n-2) * SSR
hsigma = sqrt(hsigmasq)

se_beta1 = hsigma / sqrt(SSTX)
# Alternative way
summary(reg)$coefficients[2,2] # Row number, column number

# Multiple linear regression example from PS 7
lm(log(wage) ~ educ + IQ, data = wage2)
