# PS7, Q17
x = c(7,1,3)
n = 3
sigmasq = 7
SSTX = (n-1) * var(x)
sigmasq / SSTX

#SSTX 
SSTX = (n-1) * var(x)

# var(b1)
sigmasq / SSTX

# Example 3.1
# SLR 
library(wooldridge)
reg = lm(colGPA ~ ACT, data = gpa1)

summary(reg)

plot(gpa1$ACT, gpa1$colGPA)
abline(reg, col = 'red')

# MLR
reg_MLR = lm(colGPA ~ ACT + hsGPA, data = gpa1)
summary(reg_MLR)

library(car)
scatter3d(colGPA ~ ACT + hsGPA, data = gpa1)

# Save coefficients
reg_MLR$coefficients

b0hat = reg_MLR$coefficients[1]
b1hat = reg_MLR$coefficients[2]
b2hat = reg_MLR$coefficients[3]

# Prediction
b0hat + b1hat * 31 + b2hat * 4

# Predicted change
b1hat * 3 + b2hat * 1
