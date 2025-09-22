# Load wooldridge package
library(wooldridge)

# Relationship between wage and educ
View(wage1)
plot(wage1$educ, wage1$wage)
wage1$wage

# Mean and sample variance of wage
mean(wage1$wage)
var(wage1$wage)

# Covariance between wage and educ
cov(wage1$wage, wage1$educ) # Sample covariance
cor(wage1$wage, wage1$educ) # Sample correlation

# Example with colGPA and hsGPA
?gpa1
plot(gpa1$hsGPA, gpa1$colGPA, xlim = c(0, 4), ylim = c(0,4))
beta0 = 1.5
beta1 = 0.5

# Expected value of colGPA given hsGPA using beta0 and beta1
pred_colGPA = function(hsgpa){
  beta0 + beta1 * hsgpa
}

# Plot out our hypothetical predictions
curve(pred_colGPA, from = 0, to = 4, add = TRUE, col = 'purple')

predictions = pred_colGPA(gpa1$hsGPA) # Predictions for colGPAs
residuals = gpa1$colGPA - predictions # How much our predictions missed
segments(gpa1$hsGPA, gpa1$colGPA, gpa1$hsGPA, predictions, col = 'red')

# Mean squared error
sum(residuals**2)

# Ordinary least squares. Guaranteed to have the lowest MSE
reg = lm(colGPA ~ hsGPA, data = gpa1)
abline(reg, col = 'green')
sum(reg$residuals**2)
