library(wooldridge)

reg = lm(log(wage) ~ educ + exper + tenure, data = wage1)

summary(reg)$coefficients # Row, column

seb2 = summary(reg)$coefficients[3,2] # Easier way of getting standard errors 
b2 = reg$coefficients[3]

b2 / seb2 # T-value

# Q5, PS9
reg = lm(log(salary) ~ LSAT + GPA + rank + log(cost), data = lawsch85)

reg$coefficients[5] * 8
