#For 9/8/2021

# Clear environment
rm(list=ls())

# Set working directory
setwd("C:/Users/lohi/OneDrive - UNC-Wilmington/Econometrics/R")

#load Wooldridge package
library(wooldridge)

#Question 1
1 + 2 + 9 + 39

#Question 2
exp(1 + 2 * (39 - 38.231))

#Question 3
Y = exp(1 + 2 * (39 - 38.231))
sin(Y**2) - cos(2) * log(31 * Y)

#Question 4
X = c(4,9,2,10,7,7,7,9,1,3,4,10,2,3,8,5,1,8,5,10,1,2,5,10,10,4,10,5,7,2)
length(X)

#Question 5
mean(X)

#Question 6
varX = var(X)

#Question 7 
sqrt(varX)

#Question 8 
Y = c(6,2,2,7,6,3,3,7,7,6,3,10,10,5,3,1,9,1,6,8,10,6,2,7,10,4,7,2,4,3)
cov(X,Y)

#Question 9
#Define probability vector and X,Y vectors
Pvec = c(1/2, 1/8, 1/8, 3/16, 1/16)
Xvec = c(5, 6, 4, 3, 1)
Yvec = c(9, 8, 4, 1, 4)

#Multiply X and Probability vector together to get terms x P(X = x)
newvec = Xvec * Pvec

#Take the sum of the product vector to get E[X]
sum(newvec)

#Do it all in one step
EX = sum(Xvec * Pvec)

#Question 10
sum(Yvec * Pvec)

#Question 11
EXsq = sum(Xvec**2 * Pvec)
EYsq = sum(Yvec**2 * Pvec)
EXY = sum(Xvec * Yvec * Pvec)
EX = sum(Xvec * Pvec)
EY = sum(Yvec * Pvec)

EXY

#Question 12
covXY = EXY - EX * EY #Covariance
varX = EXsq - EX**2 #Variance of X
varY = EYsq - EY**2 #Variance of Y

corrXY = covXY / (sqrt(varX) * sqrt(varY))

#Question 13
library(wooldridge)
View(crime1)
nrow(crime1) #Alternate way to count number of observations

#Question 14