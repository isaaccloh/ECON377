# Clear environment
rm(list = ls())

# Install Wooldridge
install.packages('wooldridge') # Only do this once

# Load wooldridge
library(wooldridge)

## Example 2.3
View(ceosal1)

# Count sample size
nrow(ceosal1)

# Find beta1hat
b1hat = cov(ceosal1$roe, ceosal1$salary) / var(ceosal1$roe)

# Find beta0hat
b0hat = mean(ceosal1$salary) - mean(ceosal1$roe) * b1hat

# Easier way 
reg = lm(salary ~ roe, data = ceosal1)
b0hat = reg$coefficients[1]
b1hat = reg$coefficients[2]
summary(reg) # Gives you all the stuff

# Get info on datasets
?ceosal1

# Predicting salary for roe = 30
b0hat + 30 * b1hat
