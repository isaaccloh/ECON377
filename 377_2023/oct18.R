# Clear memory
rm(list = ls())

# Load wooldridge
library(wooldridge)

## Example 2.12
?meap93
reg = lm(math10 ~ lnchprg, data = meap93)
summary(reg)
# Omitted variables bias!

## PS 6
# Q3
reg = lm(cons ~ inc, data = saving)
n = nrow(saving)
SSE = (n-1) * var(reg$fitted.values)

# Q13 
reg = lm(math10 ~ log(expend), data = meap93)
reg$coefficients[2] / 100 * (-23)

# Q12
summary(reg)$r.squared
summary(reg)

# Q17
View(charity)
charity$log_mailsyear = log(charity$mailsyear)
mean(charity$log_mailsyear)