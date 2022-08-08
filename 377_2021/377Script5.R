#For 9/1/2021

# Clear environment
rm(list=ls())

# Set working directory
setwd("~/GitHub/ECON377")

#load Wooldridge package
library(wooldridge)

####################
#Exercise 4.2

#Create a data frame called mydata equal to wage1
mydata = wage1

#Regress wages on education; save the results as reg1
reg1 = lm(wage ~ educ, data = wage1)

#Set hbeta0 and hbeta1 equal to the OLS coefficients
hbeta0 = coefficients(reg1)[1] 
hbeta1 = coefficients(reg1)[2]

#Create a new variable equal to the residuals
mydata$resid = mydata$wage - hbeta0 - hbeta1 * mydata$educ

#Calculate the sum of the squared residuals 
ssr = sum(mydata$resid^2)

#Use the residuals stored in reg1 to calculate ssr in an alternate way
ssr = sum(residuals(reg1)^2)



