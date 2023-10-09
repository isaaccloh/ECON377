# Clear environment
rm(list = ls())

# Load wooldridge
library(wooldridge)

## Example 2.4
# Use wage1 to run a regression
reg = lm(wage ~ educ, data = wage1)
hbeta0 = reg$coefficients[1]
hbeta1 = reg$coefficients[2]

# Histogram of education values
hist(wage1$educ)

# Plot
plot(wage1$educ, wage1$wage)
abline(reg)

# Predicted change in wage with 4 year degree
hbeta1 * 4 

## Example 2.5
?vote1

# Run regression model
reg_vote = lm(voteA ~ shareA, data = vote1)
hbeta0 = reg_vote$coefficients[1]
hbeta1 = reg_vote$coefficients[2]

# Summary of the regression
summary(reg_vote)

# Plot
plot(vote1$shareA, vote1$voteA)
abline(reg_vote)

# Predicted change if shareA increases by 10
hbeta1 * 10

# Predicted vote for shareA = 50
hbeta0 + hbeta1 * 50

# Predicted vote for shareA = 60
hbeta0 + hbeta1 * 60

# Accessing fitted values
reg_vote$fitted.values

# Residuals
reg_vote$residuals

# Sum of residuals is 0 
sum(reg_vote$residuals)

# Covariance between residuals and X
cov(reg_vote$residuals, vote1$shareA)

# Property 3
hbeta0 + hbeta1 * mean(vote1$shareA)
mean(vote1$voteA)

## PS 5, Q 18
sum(ceosal2$salary >= 1000)

## PS 5, Q 18
sum(ceosal2$ceoten == 0 & ceosal2$salary >= 500)

## PS 5, Q 16
cor(ceosal2$salary, ceosal2$ceoten)

## PS 5, Q 14
reg = lm(bwght ~ cigs, data = bwght)
reg$fitted.values[123]
