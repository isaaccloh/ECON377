## Example 4.1
library(wooldridge)
reg = lm(log(wage) ~ educ + exper + tenure, data = wage1)

# Calculating t-value
b2hat = reg$coefficients[3]
se2 = summary(reg)$coefficients[3,2]
b2hat / se2 # Long way for t-value

tval2 = summary(reg)$coefficients[3,3] # Easier way, be careful 

# Calculating critical value
alpha = 0.05
n = nrow(wage1)
k = 3
df = n - k - 1
df = reg$df.residual # Easier way
c = qt(1-alpha, df = df) # Crit value

## Example 4.2
reg = lm(math10 ~ totcomp + staff + enroll, data = meap93)
tval3 = summary(reg)$coefficients[4,3]
df = nrow(meap93) - 3 - 1
alpha = 0.05
c = qt(alpha, df = df)
tval3 < c # Fail to reject
