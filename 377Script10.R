#For 9/27

# Clear environment
rm(list=ls())

# Set working directory
setwd("C:/Users/Isaac/OneDrive - UNC-Wilmington/Econometrics/R")

#load Wooldridge package
library(wooldridge)

####################
#Example 7.1
#Regression with omitted variables bias
reg_ovb = lm(log(crime) ~ log(police), data = campus)

#Regression without omitted variables bias
reg_no_ovb = lm(log(crime) ~ log(police) + enroll + priv, data = campus)

#The coefficient gets smaller but is still not negative like we'd expect!
#Maybe there are some other omitted variables, like how inherently dangerous
#a college's immediate area is (more dangerous -> more crimes and more officers)

####################
#Exercise 7.4

#Using GPA1, regress colGPA on hsGPA and ACT
reg1 = lm(colGPA ~ hsGPA + ACT, data = gpa1)

summary(reg1)

#regress colGPA on only ACT
reg2 = lm(colGPA ~ ACT, data = gpa1)

summary(reg2)

#Compare the coefficient sizes (on ACT)
reg2$coefficients[2]/reg1$coefficients[3]

####################
#Exercise 7.5

#regress log(wage) on educ, exper, and tenure in wage1
reg3 = lm(log(wage) ~ educ + exper + tenure, data = wage1)

summary(reg3)

#comparing with regression on educ alone
reg4 = lm(log(wage) ~ educ, data = wage1)

#Compare the coefficient sizes (on educ)
reg4$coefficients[2]/reg3$coefficients[2]

####################
#Exercise 7.7

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
#Exercise 7.8

reg6 = lm(narr86 ~ pcnv + ptime86 + qemp86, data = crime1)

reg7 = lm(narr86 ~ pcnv + avgsen + ptime86 +
            + qemp86, data = crime1)

summary(reg6)


