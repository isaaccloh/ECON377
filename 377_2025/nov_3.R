library(wooldridge)

reg = lm(log(wage) ~ educ + exper + tenure, data = wage1)

summary(reg)

# Example 2.1
# Prediction of Ms. H's wage
beta0 = reg$coefficients[1]
beta1 = reg$coefficients[2]
beta2 = reg$coefficients[3]
beta3 = reg$coefficients[4]

exp(beta0 + beta1 * 16 + beta2 * 6 + beta3 * 1)

# Predicted change
100 * beta1 * 1

100 * (beta2 * -2 + beta3 * -1)

# Fitted value for person 10
View(wage1)
beta0 + beta1 * 17 + beta2 * 22 + beta3 * 21
beta0 + beta1 * wage1$educ[10] + beta2 * wage1$exper[10] + beta3 * wage1$tenure[10]

# Easiest way 
reg$fitted.values[10]

# Residual for person 10
log(wage1$wage[10]) - reg$fitted.values[10]
reg$residuals[10] # Better way 

# Sample average of residuals
mean(reg$residuals)

# Sample covariance between residuals and independent vars is 0
cov(reg$residuals, wage1$exper)

# Prediction of log(wage) for average person
beta0 + beta1 * mean(wage1$educ) + beta2 * mean(wage1$exper) + beta3 * mean(wage1$tenure)
mean(log(wage1$wage))
