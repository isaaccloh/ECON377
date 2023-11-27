# Clear environment
rm(list = ls())

# Load wooldridge
library(wooldridge)

## Example 4.2 continued
?meap93

reg = lm(math10 ~ log(totcomp) + log(staff) + log(enroll),
         data = meap93)

tval = summary(reg)$coefficients[4,3]

# One-sided hypothesis test
alpha = 0.05
df = reg$df.residual
c = qt(alpha, df = df)
tval < c


## Example 4.3 
reg = lm(colGPA ~ hsGPA + ACT + skipped, data = gpa1)
alpha = 0.1
df = reg$df.residual
c = qt(1 - alpha/2, df = df)
tval = summary(reg)$coefficients[3,3]
abs(tval) > c 

## Example 4.4
reg = lm(log(crime) ~ log(enroll), data = campus)
b1 = summary(reg)$coefficients[2,1]
se = summary(reg)$coefficients[2,2]
tval = (b1 - 1) / se

alpha = 0.05
df = reg$df.residual
c = qt(1-alpha, df = df)
tval

# Two sided test
alpha = 0.05
df = reg$df.residual
c = qt(1 - alpha/2, df = df)
c
