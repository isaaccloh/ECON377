library(wooldridge)

# Exam I review

# Questions 19-20
reg = lm(colgpa ~ hsrank, data = gpa2)
reg$coefficients

# Question 26
Ybar = 2
Xbar = 6
SXY = 4
SX2 = 8
b1hat = SXY / SX2 
Ybar - Xbar * b1hat

# Question 14
exp(2.62)

# Illustration of residuals/fitted values
?beauty
plot(beauty$looks, beauty$wage)
reg = lm(wage ~ looks, data = beauty)
reg$coefficients
abline(reg, col = 'red')

# Extract the fitted values and residuals
resids = reg$residuals
fitted_vals = reg$fitted.values

# Plotting residuals and fitted values
segments(beauty$looks, fitted_vals, beauty$looks, beauty$wage, col = 'gray') # Residuals
points(beauty$looks, fitted_vals, pch = 19, col = 'blue')

# Average of residuals is 0
sum(resids)

# Covariance between X and residuals
cov(beauty$looks, resids)

# OLS regression line always passes through (Xbar, Ybar)
Xbar = mean(beauty$looks)
Ybar = mean(beauty$wage)
b0hat = reg$coefficients[1]
b1hat = reg$coefficients[2]
b0hat + b1hat * Xbar 
Ybar # These should be equal

# PS5, Q13
reg = lm(bwght ~ cigs, data = bwght)
fitted_vals = reg$fitted.values
fitted_vals[200] # Fitted value for person 200

# Q14
reg$residuals[200] # Residual for person 200

# Q18
ceosal2$ceoten == 0 # Test for 0 years tenure
ceosal2$salary >= 600 # CEOs that have salary >= 600000
ceosal2$ceoten == 0 & ceosal2$salary >= 600 # CEOs with both characteristics
ceosal2$ceoten == 0 | ceosal2$salary >= 600 # CEOs with either characteristic
sum(ceosal2$ceoten == 0 & ceosal2$salary >= 600) # Counts number of CEOs
