library(wooldridge)
library(car)
library(agl)

# Calculating fitted value for person 2 in Ex 3.1
reg = lm(colGPA ~ ACT + hsGPA, data = gpa1)
b0hat = reg$coefficients[1]
b1hat = reg$coefficients[2]
b2hat = reg$coefficients[3]
View(gpa1)
gpa1$ACT[2] # Another way to get ACT
gpa1$hsGPA[2] # Another way to get hsGPA
fitted_value = b0hat + b1hat * 24 + b2hat * 3.2
reg$fitted.values[2] # Easiest way to get fitted values

# Calculating residual for person 2
gpa1$colGPA[2] - fitted_value
reg$residuals[2]

# Illustration of OVB
reg_SLR = lm(colGPA ~ ACT, data = gpa1)
reg_MLR = lm(colGPA ~ ACT + hsGPA, data = gpa1)

# SLR plot
plot(gpa1$ACT, gpa1$colGPA)
abline(reg_SLR)

# MLR plot
scatter3d(colGPA ~ ACT + hsGPA, data = gpa1)

# Example 3.3
reg_delta = lm(hsGPA ~ ACT, data = gpa1)
b2hat = reg_MLR$coefficients[3]
d1tilde = reg_delta$coefficients[2]
b1tilde = reg_SLR$coefficients[2]
b1hat = reg_MLR$coefficients[2]

b1tilde
b1hat + b2hat * d1tilde
