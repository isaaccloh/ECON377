#For 8/30/2021

# Clear environment
rm(list=ls())

# Set working directory
setwd("C:/Users/lohi/OneDrive - UNC-Wilmington/Desktop/Fun times with metrics")

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
#Illustrative R code (not tested)
####################

####################
#Code to plot E[wage|education] using wage1

#Set years of education vector
x = sort(unique(wage1$educ))

#Function which matches education value to expected value of wage
eductowage = function(x) {
  y = mean(wage1$wage[wage1$educ == x])
  return(y)
}

#Get the conditional expectations 
y = lapply(x, eductowage)

#plot the conditional expectations of wage given education using wage1
plot(x, y, main = "E[wage|educ]", xlab = "Educ (years)", ylab = "wage (hourly)", type = "l")

####################
#Formula to illustrate Assumption 3.2

#install.packages('lattice') #Uncomment this and do this once

library(lattice)

#Specify beta0 and beta1
beta0 = 0
beta1 = 1

#Command to plot density of data
x = seq(-5, 5, length = 100)
y = seq(-5, 5, length = 100)
grid = expand.grid(x = x, y = y)
grid$z = dnorm(grid$x, sd = 3) * dnorm(grid$y - beta0 - beta1*grid$x)
levelplot(z ~ x * y, grid, xlab="X",
          ylab="Y", main="Data under Assumption 3.1",
          colorkey = TRUE)


