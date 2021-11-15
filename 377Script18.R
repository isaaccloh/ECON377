# For 10/15

# Clear environment
rm(list=ls())

# Set working directory
setwd("C:/Users/Isaac/OneDrive - UNC-Wilmington/Econometrics/R")

# Load Wooldridge package
library(wooldridge)

# Exercise on critical values (play around with this)
qt(0.99, df = 96)
qnorm(0.99)

#### Exercise 10.8/Wooldridge Example 4.1
#Run the regression 
reg = lm(log(wage) ~ educ + exper + tenure, data = wage1)

#Calculate degrees of freedom 
df = nrow(wage1) - 3 - 1

#It's more than 120 so we can use the normal distribution to find c
critval = qnorm(0.95)

#Set tstat equal to t-statistics
tstat = coef(reg) / sqrt(diag(vcov(reg)))

#Alternate way to get tstats:
tstat = summary(reg)$coefficients[,3]

#Are the tstats greater than the critical value (for one-sided tests)
tstat > critval

#Find c when q = 0.01
critval = qnorm(0.99)


#########################

#### Exercise 10.9/Wooldridge Example 4.2
#Run the regression
reg = lm(math10 ~ totcomp + staff + enroll, data = meap93)

#Calculate degrees of freedom 
df = nrow(meap93) - 3 - 1

#It's more than 120 so we can use the normal distribution. 
#Note that the alternate is that beta < 0 so use the q * 100 perentile
critval = qnorm(0.05)

#Set tstat equal to t-statistics
tstat = coef(reg) / sqrt(diag(vcov(reg)))

#Redo the regression with logs on independent variables
reg2 = lm(math10 ~ log(totcomp) + log(staff) + log(enroll), data = meap93)

#Set tstat equal to new t-statistics
tstat = coef(reg) / sqrt(diag(vcov(reg)))

#Compare R^2 values
summary(reg)$r.squared < summary(reg2)$r.squared

#########################

#### Exercise 10.10/Wooldridge Example 4.3
#Run the regression 
reg = lm(colGPA ~ hsGPA + ACT + skipped, data = gpa1)

#Calculate degrees of freedom 
df = nrow(gpa1) - 3 - 1

#Set tstat equal to t-statistics
tstat = coef(reg) / sqrt(diag(vcov(reg)))

#Calculate critical values for 10% test ,5% test, 1% test
critval10 = qnorm(0.95)
critval5 = qnorm(0.975)
critval1 = qnorm(0.995)

#Weight the tstats against the critical values
abs(tstat) > critval10

#Set tstat equal to t-statistics
tstat = coef(reg) / sqrt(diag(vcov(reg)))

#Critical value for 10% one sided test 
critval10onesided = qnorm(0.9)


#Exercise to calculate p value for the coefficient on ACT
pval = 1 + pt(-abs(tstat), df = df) - pt(abs(tstat), df = df)

#Compare with the p values obtained from the lm command
pvallm = summary(reg)$coefficients[,4]  

#p-values supposing that the alternative hypotheses are one-sided, betaj > 0
pvalalternative1 = 1 - pt(tstat, df = df)
pvalalternative2 = pt(tstat, df = df)
