# Example of "goodness of fit"
library(wooldridge)

View(ceosal1)

# Model is salary = beta0 + beta1 * sales + U
# SST
n = nrow(ceosal1) # Sample size
SST = (n-1) * var(ceosal1$salary)

# Run regression 
plot(ceosal1$sales, ceosal1$salary)
reg = lm(salary ~ sales, data = ceosal1)
abline(reg, col = 'red')

# Get SSE
fitted_vals = reg$fitted.values
SSE = (n-1) * var(fitted_vals)
points(ceosal1$sales, fitted_vals, col = 'blue')

# Get SSR
residuals = reg$residuals
SSR = (n-1) * var(residuals)

# This will always equal SST!
SSE + SSR

# Calculating R-squared
Rsq = SSE / SST
Rsq = 1 - SSR / SST # Either one works
# Interpretation: only 1.4% of variation in salaries is explained by sales

# Easy way to get R-squared
Rsq = summary(reg)$r.squared
summary(reg)

# Example of R-squared
reg_2 = lm(bwght ~ cigs, data = bwght)
summary(reg_2)$r.squared
