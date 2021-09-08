#For 9/8/2021

# Clear environment
rm(list=ls())

# Set working directory
setwd("~/GitHub/ECON377")

#load Wooldridge package
library(wooldridge)

####################
#Calculating SSR from regression of wage on educ in wage1 (repeating Ex 4.2)
mydata = wage1 
reg1 = lm(wage ~ educ, data = wage1)
ssr = sum(reg1$residuals)**2

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