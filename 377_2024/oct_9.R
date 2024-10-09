# Property 3 of OLS 
library(wooldridge)
reg = lm(price ~ sqrft, data = hprice1)
summary(reg)
b0hat = reg$coefficients[1]
b1hat = reg$coefficients[2]
b0hat + b1hat * mean(hprice1$sqrft)
Ybar = mean(hprice1$price)

# Check that SSE = (n-1) * variance(Yhat)
SSE = sum((reg$fitted.values - Ybar)^2)
n = nrow(hprice1)
varYhat = var(reg$fitted.values)
SSE == (n-1) * varYhat

# R-squared
summary(reg)$r.squared
plot(hprice1$sqrft, hprice1$price)
abline(reg)

# PS5, Q13
reg = lm(bwght ~ cigs, data = bwght)
reg$fitted.values[112]

# PS5, Q15
cor(ceosal2$salary, ceosal2$ceotensq)
reg = lm(salary ~ ceoten, data = ceosal2)
b0hat = reg$coefficients[1]
b1hat = reg$coefficients[2]
b0hat + b1hat * 3.5
