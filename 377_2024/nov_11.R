# Exam II, Q 10
library(wooldridge)

?catholic # How to get variable descriptions
mean(catholic$read12[catholic$fatheduc >= 16 | catholic$motheduc >= 16])

# Q 20
?lawsch85
reg = lm(log(salary) ~ LSAT + GPA, data = lawsch85)
b0 = reg$coefficients[1]
b1 = reg$coefficients[2]
b2 = reg$coefficients[3]
b0 + b1 * 165 + b2 * 2.9 # Prediction for log salary
exp(b0 + b1 * 165 + b2 * 2.9)

# Q 14
reg = lm(log(psoda) ~ prpblck + log(income), data = discrim)
b0 = reg$coefficients[1]
b1 = reg$coefficients[2]
b2 = reg$coefficients[3]
exp(b0 + b1 * 0.18 + b2 * log(27071))

# Catholic dataset example of standard errors
?catholic
reg = lm(math12 ~ hsgrad + lfaminc + cathhs, data = catholic)
SSR = sum(reg$residuals^2)
n = nrow(catholic)
k = 3
df = n - k - 1
SER = sqrt(SSR / df)
SST3 = (n-1) * var(catholic$cathhs)
reg_2 = lm(cathhs ~ hsgrad + lfaminc, data = catholic)
R2_3 = summary(reg_2)$r.squared

se_b3 = SER / sqrt(SST3 * (1 - R2_3)) # HARD way

summary(reg)$coefficients[4,2] # Easier way
