library(car)
library(rgl)
library(wooldridge)
?apple

# Apple example
reg = lm(ecolbs ~ ecoprc, data = apple)
scatter3d(ecolbs ~ ecoprc + regprc, data = apple)

# PS7, Q14
reg = lm(log(wage) ~ IQ + educ, data = wage2)
reg$coefficients
b0hat = reg$coefficients[1]
b1hat = reg$coefficients[2]
b2hat = reg$coefficients[3]

exp(b0hat + b1hat * 21.8 + b2hat * 94)

# Q17
n = 3
SSTX = (n-1) * var(c(8,9,5))
3 / SSTX

# Q18
cov(reg$residuals, wage2$IQ)
# Residuals always uncorrelated with independent variables!
