# Clear environment
rm(list=ls())

# Set working directory
setwd("C:/Users/lohi/OneDrive - UNC-Wilmington/Econometrics/R")

#load Wooldridge package
library(wooldridge)

####################

#Exercise 3.2
#First, calculate beta0 and beta1 using our formulas
beta1 = cov(wage1$educ , wage1$wage)/(var(wage1$educ))
beta0 = mean(wage1$wage) - mean(wage1$educ) * beta1

#Compare these with the coefficients we would get with R's inbuilt command
lm(wage1$wage ~ wage1$educ)

#Another way to compute the regression without the annoying $ signs
lm(wage ~ educ, data = wage1)

#How to view more detail about the regression
#First, save it as reg
reg = lm(wage ~ educ, data = wage1)

#Then, use the summary() function
summary(reg)

####################

#Problem set 1 examples. These won't give you the correct answers but will show 
#you what commands to use. Remember that you can run lines of code by selecting them
#and pressing Ctrl + Enter

####################

#Question 14
mean(wage1$wage) #Calculate the mean wage in dataset wage1. You should change wage for educ

#Question 15
max(wage1$educ) - min(wage1$educ) #Calculate the range of educ in wage1. Again, change educ

#Question 16
ls(beauty) #View the variables in dataset beauty

#Question 18
cor(crime1$narr86, crime1$tottime) #This calculates the sample correlation between 
#variables narr86 and tottime in the dataset crime1. Change this to get the right answer

#Question 20 
#No code, but remember that Var(X) = E(X^2) - E(X)^2

#Question 21
X = c(24,39,239,192,2) #Set a vector X. You'll need to change this
var(X) #Calculates the sample variance of vector X

#Question 22
mean(X**2) - mean(X)**2 #This is how you could use the formula Var(X) = E(X^2) - E(X)^2
#Remember that you'll have to define X correctly to get this to work

####################

#OLS example: plots OLS regresion line and the line E[Y|X] that it's trying to estimate

####################

n = 100 #sample size
sigma = 10 #Noise in the model
beta0 = 2
beta1 = 2
X = rnorm(n)
U = rnorm(n, sd = sigma)
Y = beta0 + beta1 * X + U
plot(X, Y, main = "OLS regression line", xlab = "X", ylab = "Y")
abline(lm(Y ~ X), col = "blue")
curve(beta0 + beta1 * x, add = TRUE)
legend(1, 0, legend=c("OLS (regression) line", "E[Y|X]"),
       col=c("blue", "black"), lty=1, cex=1.2)
