# Example 2.3
library(wooldridge)
reg = lm(salary ~ roe, data = ceosal1) # lm command
reg$coefficients # How to get beta0 and beta1
?ceosal1

# Prediction for salary when roe = -15
# Incorrect way
963.19134 + 18.50119 * (-15)
963.2 + 18.5 * (-15)

# Correct way
b0hat = reg$coefficients[1]
b1hat = reg$coefficients[2]
b0hat + b1hat * (-15)

# Predicted change questions
b1hat * 5
b1hat * (-12)

# Example 2.4
reg = lm(wage ~ educ, data = wage1)
b0hat = reg$coefficients[1]
b1hat = reg$coefficients[2]
summary(reg)

# Predicted change in wage
b1hat * 4
b1hat * 4 * 5.53 # In 2024 dollars

# Example 2.5
reg = lm(voteA ~ shareA, data = vote1)
summary(reg)
b0hat = reg$coefficients[1]
b1hat = reg$coefficients[2]

# Change
b1hat * 20

# Predictions for voteA
b0hat + b1hat * 60

# Residuals
reg$residuals
mean(reg$residuals)
cov(reg$residuals, vote1$shareA)

# Exercise 13, PS5
reg = lm(bwght ~ cigs, data = bwght)
reg$fitted.values[110]
