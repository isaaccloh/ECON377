# Illustrating relationship between wage and education
library(wooldridge)

View(wage1)

# To view variables in a dataset
ls(wage1)
?wage1

# Remember: datasetname$varname
plot(wage1$educ, wage1$wage, main = "wage vs educ", 
     xlab = 'Education', ylab = 'Wage') # Plot command in R

# Fit a linear econometric model
reg = lm(wage ~ educ, data = wage1)

# Plot the model
abline(reg, col = 'blue')

# Time series data 
?consump

plot(consump$year, consump$i3) # Plot of interest rates vs year
lines(consump$year, consump$i3)

# Panel series data
?crime4

plot(crime4$year, crime4$crmrte)

# PS3, Q12
xvec = c(1.1, 1.3, 1.8, 1.1, 1.7)
yvec = c(1, 1.4, 1.9, 1.3, 1.2)
cor(xvec, yvec)

# PS3, Q17
xvec = c(3,6,7,3,3)
var(xvec)

# PS3, Q1
xvec = c(7.6, 5.8, 8.2)
pvec = c(1/2, 1/4, 1/4)
sum(xvec * pvec) # E[X]
sum(sin(xvec) * pvec) # E[sin(X)]