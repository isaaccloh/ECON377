# Example OLS regression line
library(wooldridge)

View(wage1)
reg = lm(wage ~ educ, data = wage1)

# Coefficients
reg$coefficients 

# Fitted values
reg$fitted.values

# Residuals
reg$residuals

# Plot regression line
plot(wage1$educ, wage1$wage)
abline(reg)

# Example 2.3
nrow(ceosal1)
reg = lm(salary ~ roe, data = ceosal1)
summary(reg) # Prints out everything 
reg$coefficients # Coefficients
plot(ceosal1$roe, ceosal1$salary)
abline(reg)

# Not necessary: how to create functions
circum <- function(r){
  2 * pi * r
}

circum(1)
