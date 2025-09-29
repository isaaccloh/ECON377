library(wooldridge)

# Estimate OLS estimates in SLR: 
# wage = beta0 + beta1 * educ + U

?wage1

beta1hat = cov(wage1$educ, wage1$wage) / var(wage1$educ) # SXY / SX^2
beta0hat = mean(wage1$wage) - mean(wage1$educ) * beta1hat # Ybar - Xbar * b1hat

# Illustration of fitted values
plot(wage1$educ, wage1$wage)
reg = lm(wage ~ educ, data = wage1)
abline(reg, col = 'red')

# Showing that the OLS estimates minimize SSR 
b0guess = 4
b1guess = 0.4
SSR_guess = sum((wage1$wage - b0guess - b1guess * wage1$educ)^2)

SSR = sum((wage1$wage - beta0hat - beta1hat * wage1$educ)^2)

# Example 2.3
?ceosal1
b1hat = cov(ceosal1$roe, ceosal1$salary) / var(ceosal1$roe)
b0hat = mean(ceosal1$salary) - mean(ceosal1$roe) * b1hat

reg = lm(salary ~ roe, data = ceosal1) # lm(y ~ x, data = ...)
reg$coefficients # Better way to view OLS coefficients
