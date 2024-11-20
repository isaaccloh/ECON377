## Example 4.2 cont
library(wooldridge)
reg = lm(math10 ~ log(totcomp) + log(staff) +
           log(enroll), data = meap93)
tval3 = summary(reg)$coefficients[4,3]

df = reg$df.residual
alpha = 0.05
c = qt(alpha, df = df)
tval3 < c

## Example 4.3
reg = lm(colGPA ~ hsGPA + ACT + skipped, data = gpa1)
alpha = 0.05
df = nrow(gpa1) - 3 -1
c = qt(1-alpha/2, df = df)
tval3 = summary(reg)$coefficients[4,3]
summary(reg)

## Example 4.4
reg = lm(log(crime) ~ log(enroll), data = campus)
b1 = reg$coefficients[2]
se1 = summary(reg)$coefficients[2,2]
tval = (b1 - 1) / se1
tval

alpha = 0.05
df = reg$df.residual
c = qt(1-alpha, df = df)

# Two-sided test
c = qt(1-alpha/2, df = df)
