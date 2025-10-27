# PS7, Q5
library(wooldridge)
reg = lm(log(salary) ~ ceoten, data = ceosal2)

n = nrow(ceosal2)
SSTX = (n-1) * var(ceosal2$ceoten)

# Q6
SSR = sum(reg$residuals^2)
SER = sqrt(SSR / (n-2)) 

summary(reg)$sigma # Easier way to get SER

# Q7
se_b1 = SER / sqrt(SSTX)
se_b1

# Easier way to get se_b1
summary(reg)$coefficients[2,2] # [Row, column]

?meap93

# Q12
reg = lm(log(wage) ~ educ + IQ, data = wage2)

install.packages('car')
library(car)
scatter3d(log(wage) ~ educ + IQ, data = wage2)

summary(reg)

# Q13
# Table 2.3 for log-level
beta1 = reg$coefficients[2]
pct_change_wage = 100 * beta1 * 3.5

# Q14
beta0 = reg$coefficients[1]
beta1 = reg$coefficients[2]
beta2 = reg$coefficients[3]
exp(beta0 + beta1 * 14 + beta2 * 78.9)
