library(wooldridge)
library(car)
library(rgl)
?gpa1

# Example 3.1
reg_SLR = lm(colGPA ~ ACT, data = gpa1)
summary(reg_SLR)

reg_MLR = lm(colGPA ~ ACT + hsGPA, data = gpa1)
summary(reg_MLR)

scatter3d(colGPA ~ ACT + hsGPA, data = gpa1)

# Prediction question
ACT = 30
hsGPA = 3.5
b0hat = reg_MLR$coefficients[1]
b1hat = reg_MLR$coefficients[2]
b2hat = reg_MLR$coefficients[3]
b0hat + b1hat * 30 + b2hat * hsGPA

# Example 3.2
reg = lm(log(wage) ~ educ + exper + tenure, data = wage1)
summary(reg)

# Prediction
b0hat = reg$coefficients[1]
b1hat = reg$coefficients[2]
b2hat = reg$coefficients[3]
b3hat = reg$coefficients[4]

exp(b0hat + b1hat * 16 + b2hat * 4 + b3hat * 2)

# Predicted change
100 * (b1hat * 3 + b3hat * 3)

# Swirl
library(swirl)
swirl()

lohi

# Q6 
submit()

# Q7
my_mean(c(4,5,10))

# Q8 
submit()
