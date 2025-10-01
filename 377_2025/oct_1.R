library(wooldridge)

# Question 13, PS 4
View(bwght)

cov(bwght$motheduc, bwght$bwght, use = "p")

# Recap
plot(ceosal1$roe, ceosal1$salary)

# Estimating the OLS regression line
reg = lm(salary ~ roe, data = ceosal1)
reg$coefficients
abline(reg, col = 'red')

# Example 2.4
reg = lm(wage ~ educ, data = wage1)
reg$coefficients
b1hat = reg$coefficients[2] # Save b1hat as OLS estimate
b0hat = reg$coefficients[1]

# Value of a college education
4 * 0.5413593 # Don't copy and paste from the console!!! 
4 * b1hat

# Predicted wage for college graduate
b0hat + b1hat * 16

# Example 2.5
reg = lm(voteA ~ shareA, data = vote1)
b0hat = reg$coefficients[1]
b1hat = reg$coefficients[2]

# Part 1
b1hat * 20

# Part 2
b0hat + b1hat * 50
