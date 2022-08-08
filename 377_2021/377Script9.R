#For 9/22/2021

# Clear environment
rm(list=ls())

# Set working directory
setwd("C:/Users/Isaac/OneDrive - UNC-Wilmington/Econometrics/R")

#load Wooldridge package
library(wooldridge)

####################
#Exercise 6.1

#regress wage on educ 
reg2 = lm(wage ~ educ, data = wage1)

#If you want a professional looking output:
#install.packages('stargazer') #Uncomment this and do it once
library(stargazer)
stargazer('reg2', type = 'text')

#Calculate hat(sigma)
n = nrow(wage1)    #Set n equal to the number of observations from wage1
ssr = sum(reg2$residuals^2)    #set ssr equal to sum of the squared residuals
sigmahat = sqrt(1/(n-2)*ssr)    #using the formula for sigmahat

#Calculate SSTX
sstx = (n-1) * var(wage1$educ)    

#Calculate se(hbeta1)
se1 = sigmahat/sqrt(sstx)

#Calculate the tvalue for hbeta1
tval1 = reg2$coefficients[2]/se1

#Getting the same information the easy way regressing log(wage) on education
reg3 = lm(log(wage) ~ educ, data = wage1)
summary(reg3)


####################
#Illustration of asymptotic distribution of OLS estimates
#This time, dividing by the standard errors (look at how the distributions change with n)
####################

n = 5 #Set sample size
M = 5000 #Number of experiments
beta0 = 1
beta1 = 0
sigma = 2 #Standard deviation of U, i.e. sigma

#Slope coefficient vector
slopevec = rep(0,M)

#Should we divide by standard errors?
divide_option = TRUE

#Monte Carlo

for (i in 1:M) {
  
  #Generate data
  Uvec = rnorm(n, mean = 0, sd = sigma)
  Xvec = rnorm(n, mean = 0, sd = 2)
  Yvec = beta0 + beta1 * Xvec + Uvec
  
  #Run regressions
  reg = lm(Yvec ~ Xvec)
  
  se1 = sqrt(diag(vcov(reg)))[2]
  
  #Save slope coefficient
  
  if (divide_option) {
    slopevec[i] = (reg$coefficients[2] - beta1) / se1 + beta1
  } else {
    slopevec[i] = reg$coefficients[2] 
  }
}

#Plot the simulation results with overlaid t density and Gaussian density
if (divide_option){
hist(slopevec, main = paste("Histogram of 
                           t values with n =", 
                            toString(n)),
     breaks = ceiling(M**(2/5)),
     xlim = c(beta1 - 3, beta1 + 3), freq = FALSE, ylim = c(0, dnorm(0) + 0.05))
} else {
hist(slopevec, main = paste("Histogram of 
                         beta1 estimates with n =", 
                            toString(n)),
     breaks = 20,
     xlim = c(beta1 - 3, beta1 + 3), freq = FALSE, ylim = c(0, dnorm(0) + 0.05))
}
 
df = n - 2

curve(dt(x - beta1, df = df), from = beta1 - 4, to = beta1 + 4, add = TRUE, col = "blue")

curve(dnorm(x - beta1), from = beta1 - 4, to = beta1 + 4, add = TRUE, col = "red")

legend(-2, 0.3, legend=c(paste("t distribution with n =", 
                               toString(n)), "Normal distribution"),
       col=c("blue", "red"), lty=1, cex=1.2)
