# Clear environment
rm(list=ls())

# Set working directory
setwd("C:/Users/Isaac/OneDrive - UNC-Wilmington/Econometrics/R")

#load Wooldridge package
library(wooldridge)

####################

#Exercise 2.1
#View the alcohol dataframe
View(alcohol)

#Create a new dataframe which we can work with, named mydata
mydata = alcohol

#Create a dummy variable morethantwo which is 1 if family size is more than 2, and 0 otherwise
mydata$morethantwo = ifelse(mydata$famsize > 2, 1, 0) 

####################

#Exercise 2.5
#Create a data frame called mydata equal to wage1
mydata = wage1

#To explore the correlation between wage and education, first we need our value of n
n = nrow(mydata)

#Calculate sample means of wage and education
avgwage = mean(mydata$wage)
avgeduc = mean(mydata$educ)

#Alternate way to calculate sample means 
avgwage = sum(mydata$wage)/n 
avgeduc = sum(mydata$educ)/n

#Calculate sample variances of wage and education
varwage = sum((mydata$wage - avgwage)^2)/(n-1)
vareduc = sum((mydata$educ - avgeduc)^2)/(n-1)

#Calculate sample standard deviations of wage and education
sdwage = sqrt(varwage)
sdeduc = sqrt(vareduc) 

#Alternate way to calculate sds
sdwage = sd(mydata$wage)
sdeduc = sd(mydata$educ) 

#Calculate sample covariance of wage and education
covwageeduc = sum((mydata$wage - avgwage) * (mydata$educ - avgeduc))/(n-1)

#Finally, obtain the correlation coefficient
corrwageeduc = covwageeduc/(sdwage * sdeduc)

#Alternate way to obtain correlation coefficient (easier)
corrwageeduc = cor(mydata$wage, mydata$educ)

####################
##Supplementary things##

#Given a command like mean, you can apply it to all variables in a dataset with the
#command sapply(mydata, mean), e.g.:
sapply(wage1, mean)

#Histogram exercise A.1
#Create a histogram of years of education with title "Histogram of Education" and x-axis label "Years of Education"
hist(mydata$educ, main = "Histogram of Education", xlab = "Years of Education")

#Check the median of education 
median(mydata$educ)

#Check the mean of education 
mean(mydata$educ)


#Define function to create histograms converging to Gaussian to illustrate PDFs
hist_fun = function(n) {
 randvec = rnorm(n, mean = 0, sd = 1)
 hist(randvec, breaks = n**0.4, xlim = c(-3,3), freq = FALSE,
      main = paste("Histogram of Random Vector with ", toString(n), "Draws"))
 curve(dnorm(x), add = TRUE, col = "blue")
}

#Define function to look at correlation between variables and alcohol abuse in alcohol dataset so we can 
#visualize correlation in class
attach(alcohol) #This makes R fix the alcohol dataset in its memory

plt_fun = function(varname) {
  errorvec = rnorm(nrow(alcohol), mean = 0, sd = 0.1)
  errorvec2 = rnorm(nrow(alcohol), mean = 0, sd = 0.1)
  plot(varname + errorvec, abuse + errorvec2, main = paste("Correlation between ", deparse(substitute(varname)), 
                                    " and Alchl abuse =", toString(cor(varname, abuse))),
       xlab = deparse(substitute(varname)), ylab = "Alcohol abuser?")
  abline(lm(abuse ~ varname), col = "Blue")
}
