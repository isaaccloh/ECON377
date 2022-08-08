# For 10/4/2021

# Clear environment
rm(list=ls())

# Set working directory
setwd("C:/Users/Isaac/OneDrive - UNC-Wilmington/Econometrics/R")

# load Wooldridge package
library(wooldridge)

####################
#Exercise 8.1

#Using GPA1, regress colGPA on hsGPA and ACT
reg1 = lm(colGPA ~ hsGPA + ACT, data = gpa1)

summary(reg1)

#regress colGPA on only ACT
reg2 = lm(colGPA ~ ACT, data = gpa1)

summary(reg2)

#Compare the coefficient sizes (on ACT)
reg2$coefficients[2]/reg1$coefficients[3]

# Visualize this regression
library(car)
library(rgl)

scatter3d(colGPA ~ hsGPA + ACT, data = gpa1)


