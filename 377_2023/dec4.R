# Clear memory
rm(list = ls())

# Load wooldridge package
library(wooldridge)

## Example 4.6 
k401k
reg = lm(prate ~ mrate + age + totemp, data = k401k)
summary(reg)$coefficients

# t-value
tval = summary(reg)$coefficients[2,3]
df = reg$df.residual
2 * (1 - pt(abs(tval), df = df))

# t-value for testing beta1 = 5
tval = (reg$coefficients[2] - 5) / summary(reg)$coefficients[2,2]
2 * (1 - pt(abs(tval), df = df))

## Example 4.8
reg = lm(log(rd) ~ log(sales) + profmarg, data = rdchem)
summary(reg)

# 95 percent confidence interval 
alpha = 0.05
df = reg$df.residual
c = qt(1- alpha/2, df = df)
se = summary(reg)$coefficients[2,2]
b1 = reg$coefficients[2]
lower_bound = b1 - c * se
upper_bound = b1 + c * se
print(c(lower_bound, upper_bound))

# Easy way 
confint(reg, level = 1 - alpha)
