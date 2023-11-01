# Clear environment
rm(list = ls())

# Load wooldridge
library(wooldridge)
library(car)
library(rgl)

## Example 3.1
reg = lm(colGPA ~ hsGPA + ACT, data = gpa1)

scatter3d(colGPA ~ hsGPA + ACT, data = gpa1)

mean(reg$residuals) # Mean of residuals = 0
cov(reg$residuals, gpa1$ACT) # Cov of residuals w/ any ind var = 0

## Example 3.3
reg_MLR = lm(colGPA ~ ACT + hsGPA, data = gpa1)
reg_MLR$coefficients

reg_SLR = lm(colGPA ~ ACT, data = gpa1)
reg_SLR$coefficients

reg_delta = lm(hsGPA ~ ACT, data = gpa1)
reg_delta$coefficients
cor(gpa1$ACT, gpa1$hsGPA)

reg_MLR$coefficients[2] + reg_MLR$coefficients[3] * reg_delta$coefficients[2]

# PS8, Q15
reg_MLR = lm(bwght ~ cigs + faminc, data = bwght)
b2 = reg_MLR$coefficients[3]

reg_delta = lm(faminc ~ cigs, data = bwght)
delta1 = reg_delta$coefficients[2]

# PS8, Q11
mean(wage1$wage[wage1$female == 0 & wage1$nonwhite == 0])
