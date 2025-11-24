## Example 4.1
# Step one: estimate MLR
library(wooldridge)
reg = lm(log(wage) ~ educ + exper + tenure, data = wage1)

# Get t-value
b2 = reg$coefficients[3]
seb2 = summary(reg)$coefficients[3,2]
tval2 = b2 / seb2

# Step two: get c w/ alpha = 0.05, alpha = 0.01
alpha = 0.05
df = nrow(wage1) - 3 - 1
c = qt(1 - alpha, df = df)

# Step three: reject?
tval2
c
tval2 > c
# REJECT at 5% significance level

## Example 4.2
# Step one:
reg = lm(math10 ~ totcomp + staff + enroll, data = meap93)
b3 = reg$coefficients[4]
seb3 = summary(reg)$coefficients[4,2]
tval3 = b3 / seb3

# Step two:
alpha = 0.05
df = nrow(meap93) - 3 - 1
c = qt(alpha, df = df)

# Step three:
tval3 < c # Fail to reject