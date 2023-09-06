# Clear memory
rm(list = ls())

## Calculating sample covariances in R
# Entering in data 
x_vec = c(4, 10, 24)
y_vec = c(2, 18, 70)

# Cov command
cov(x_vec, y_vec)

# Doing it for the actual cars data
cov(cars$speed, cars$dist)

## Sample correlation
install.packages('wooldridge') # Only do this once

# Load wooldridge package
library(wooldridge) 

# View bwght
View(bwght)

# Sample correlation between cigs and bwght
cor(bwght$cigs, bwght$bwght)

## logarithm: log()
## exponential: exp()
## Plotting functions with R
x_vec = seq(0, 10, by = 0.01)
y_vec = sin(x_vec )
plot(x_vec, y_vec, type = 'l')
