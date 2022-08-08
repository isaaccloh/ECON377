#For 8/18/2021

# Clear environment
rm(list=ls())

# Set working directory
setwd("C:/Users/lohi/OneDrive - UNC-Wilmington/Econometrics/R")


#install Wooldridge package
install.packages("wooldridge")

#load Wooldridge package
library(wooldridge)

#Set a dataframe called mydata equal to wage1
mydata = wage1

#Playing around with R
1 + 1
2 * 2
3**3
log(10)
exp(3)

#View variables in mydata
ls(mydata)

#If you need help with a command
help(ls) 
#or
?ls 

#Plot data
plot(mydata$educ, mydata$wage, main = "Wage vs education", xlab = "Education", ylab = "Wage")
abline(lm(wage ~ educ, data = mydata), col = "blue")
