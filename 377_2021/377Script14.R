# For 10/25

# Clear environment
rm(list=ls())

# Set working directory
setwd("C:/Users/Isaac/OneDrive - UNC-Wilmington/Econometrics/R")

# Load Wooldridge package
library(wooldridge)

####################
# Exercise 9.2

# First, explore the reltaionship between expenditures and povery measure
cor(meap01$lunch, meap01$lexppp)

# Find tbeta1, the coefficient from omitting lunch
reg1 = lm(math4 ~ lexppp, data = meap01)
tbeta1 = reg1$coefficients[2]

# Find hbeta1, the coefficient from multivariate regression
reg2 = lm(math4 ~ lexppp + lunch, data = meap01)
hbeta1 = reg2$coefficients[2]

# View results of reg1 and reg2
summary(reg1)
summary(reg2)

