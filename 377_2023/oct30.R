# Clear environment
rm(list = ls())

# Load wooldridge
library(wooldridge)
library(car)
library(rgl)

## Example 3.1
reg = lm(colGPA ~ hsGPA + ACT, data = gpa1)
b2 = reg$coefficients[3]
10 * b2

# OVB with SLR 
reg_2 = lm(colGPA ~ ACT, data = gpa1)
reg_2$coefficients

scatter3d(colGPA ~ hsGPA + ACT, data = gpa1)

## Example 3.2
reg = lm(log(wage) ~ educ + exper + tenure, data = wage1)
summary(reg)
b0 = reg$coefficients[1]
b1 = reg$coefficients[2]
b2 = reg$coefficients[3]
b3 = reg$coefficients[4]

# Prediction question
exp(b0 + b1 * 16 + b2 * 4 + b3 * 2)

# Predicted changes
100 * b1 #Pct Increase in wage b/c of inc educ of 1 year
100 * (b2 + b3) # Pct Increase in wage b/c of inc exper & tenure of 1 year
