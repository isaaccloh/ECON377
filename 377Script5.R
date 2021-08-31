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
hbeta1 = coefficients(reg2)[2]

#Create a new variable equal to the residuals
mydata$resid = mydata$wage - hbeta0 - hbeta1 * mydata$educ

#Calculate the sum of the squared residuals 
ssr = sum(mydata$resid^2)

#Use the residuals stored in reg1 to calculate ssr in an alternate way
ssr = sum(residuals(reg1)^2)

####################
#Exercise 4.4 (Continues Exercise 4.2)

#Calculate the SST value for wage
sst = sum((mydata$wage - mean(mydata$wage))^2)

#Equation for R-squared
rsquared = 1 - ssr/sst

#Check out the R-squared directly using the lm command, and summary
summary(reg1)$r.squared

####################
#Exercise 4.6

#Regress ceo salary on roe
mydata = ceosal1 #redefine mydata as ceosal1
reg2 = lm(salary ~ roe, data = mydata)

#Get coefficients 
coefficients(reg2)

#Generate new variable in mydata equal to salary in cents
mydata$salcents = mydata$salary * 100

#Regress ceo salary in CENTS on roe
reg3 = lm(salcents ~ roe, data = mydata)

#Get coefficients
coefficients(reg3)

####################

#Exercise 4.7

#log-level regression of wages on education using wage1
reg3 = lm(log(wage) ~ educ, data = wage1)

####################

#Exercise 4.8

#log-log regression of salary on sales using ceosal1
reg4 = lm(log(salary) ~ log(sales), data = ceosal1)

