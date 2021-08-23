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