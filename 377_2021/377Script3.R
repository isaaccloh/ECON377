#For 8/25/2021

# Clear environment
rm(list=ls())

# Set working directory
setwd("C:/Users/lohi/OneDrive - UNC-Wilmington/Desktop/Fun times with metrics")

#load Wooldridge package
library(wooldridge)

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
X = c(12, 234, 12, 123, 2) #Set a vector X. You'll need to change this
var(X) #Calculates the sample variance of vector X

#Question 22
mean(X**2) - mean(X)**2 #This is how you could use the formula Var(X) = E(X^2) - E(X)^2
#Remember that you'll have to define X correctly to get this to work
#This only works for X that are uniformly distributed, i.e. that have equal probabilities
#of equaling the values 12, 234, etc. Can you work through the 
#population variance formula to find out why?

####################

#OLS example: plots OLS regression line and the line E[Y|X] that it's trying to estimate

####################

n = 10000 #sample size
sigma = 15 #Noise in the model
beta0 = 2
beta1 = 2
X = rnorm(n) #Randomly generate X
U = rnorm(n, sd = sigma) #Randomly generate U
Y = beta0 + beta1 * X + U #Set Y according to our econometric model
plot(X, Y, main = "OLS regression line", xlab = "X", ylab = "Y")
abline(lm(Y ~ X), col = "blue")
curve(beta0 + beta1 * x, add = TRUE)
legend(1, 0, legend=c("OLS (regression) line", "E[Y|X]"),
       col=c("blue", "black"), lty=1, cex=1.2)
