rm(list = ls())

# Load wooldridge
library(wooldridge)

## Exam II
# Q14
reg = lm(log(psoda) ~ prpblck + log(income), data = discrim)

reg$coefficients

exp(reg$coefficients[1] + 
      reg$coefficients[2] * 0.76 +
      reg$coefficients[3] * log(95918))


## Example of standard errors
?discrim
reg = lm(psoda ~ prpblck + density + income, data = discrim)

summary(reg)

# SST1
n = nrow(discrim)
SST1 = (n-1) * var(discrim$prpblck, na.rm = TRUE)

# R1sq
reg_2 = lm(prpblck ~ density + income, data = discrim)
R1sq = summary(reg_2)$r.squared

# sigmahat 
SSR = sum(reg$residuals^2)
k = 3
df = n - k - 1 
sigmahat = sqrt(SSR / df)

seb1hat = sigmahat / (sqrt(SST1) * sqrt(1-R1sq))
seb1hat

# Simpler way
summary(reg)$coefficients[2,2] # Standard error of b1hat [row, column]
reg$df.residual # Degrees of freedom

