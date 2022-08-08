#For 9/27/2021

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
#Plotting a multiple regression model with k = 2 (two independent variables)

#install.packages('car') #Do this once
#install.packages('rgl') #Do this once
library(car)
library(rgl)

#Example 7.1 illustration
scatter3d(log(crime) ~ log(police) + enroll, data = campus)

#Illustration with apple dataset of omitted variables bias
plot(econmath$act, econmath$colgpa, xlab = 'ACT score', ylab = 'College GPA', 
     main = 'College GPA vs ACT scores')
abline(lm(colgpa ~ act, data = econmath)) #Simple linear regression

scatter3d(colgpa ~ hsgpa + act, data = econmath, zlab = 'ACT',
          xlab = 'HS GPA', ylab = 'College GPA') #Multiple linear regression

#Note that the slope associated with ACT decreases significantly once we control
#for high school GPA!
