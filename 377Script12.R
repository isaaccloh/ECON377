# For 10/13/2021

# Clear environment
rm(list=ls())

# Set working directory
setwd("C:/Users/Isaac/OneDrive - UNC-Wilmington/Econometrics/R")

# load Wooldridge package
library(wooldridge)

####################
#Exercise 8.2

#regress log(wage) on educ, exper, and tenure in wage1
reg3 = lm(log(wage) ~ educ + exper + tenure, data = wage1)

summary(reg3)

#comparing with regression on educ alone
reg4 = lm(log(wage) ~ educ, data = wage1)

#Compare the coefficient sizes (on educ)
reg4$coefficients[2]/reg3$coefficients[2]

####################
#Exercise 8.4

#Regress hsGPA on ACT
reg5 = lm(hsGPA ~ ACT, data = gpa1)

#Save coefficient on ACT as tdelta1
tdelta1 = reg5$coefficients[2]

#Save coefficient on ACT in simple regression as tbeta1
tbeta1 = reg2$coefficients[2]

#Save coefficients on ACT, hsGPA in multiple regression as hbeta1, hbeta2 resp
hbeta1 = reg1$coefficients[3]
hbeta2 = reg1$coefficients[2]

#Does tbeta1 = hbeta1 + hbeta2 * tdelta1?
print(c(tbeta1, hbeta1 + hbeta2 * tdelta1))

####################
#Exercise 8.5

reg6 = lm(narr86 ~ pcnv + ptime86 + qemp86, data = crime1)

reg7 = lm(narr86 ~ pcnv + avgsen + ptime86 +
            + qemp86, data = crime1)

summary(reg7)
