library(wooldridge)
library(car)

# Example of SSTj, Rjsq
reg = lm(log(wage) ~ educ + exper, data = wage1)
scatter3d(log(wage) ~ educ + exper, data = wage1)

# (n-1) * var(educ)
n = nrow(wage1)
SSTeduc = (n-1) * var(wage1$educ) 

# R-squared from regressing educ on all other ind vars
reg_2 = lm(educ ~ exper, data = wage1)
Reducsq = summary(reg_2)$r.squared

# Calculating sigmahatsq
k = 2
df = n - k - 1
df = reg$df.residual

SSR = (n-1) * var(reg$residuals)
SSR = sum(reg$residuals^2)

sigmahatsq = SSR / df

sigmahat = sqrt(sigmahatsq)
sigmahat = summary(reg)$sigma

# Calculating standard error
sigmahat / sqrt(SSTeduc * (1 - Reducsq))

summary(reg)
