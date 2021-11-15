# For 11/10

# Clear environment
rm(list=ls())

# Set working directory
setwd("C:/Users/Isaac/OneDrive - UNC-Wilmington/Econometrics/R")

#load Wooldridge package
library(wooldridge)

#####
# Exericse 10.3
# First, input key parameters
hbetaj = 8
se_hbetaj = 6.7
t_hbetaj = hbetaj / se_hbetaj
n = 100
k = 3
dof = n - k - 1

# Choose a significance level q
q = 0.01

# Find the appropriate critical value
c = qt(1 - q, df = dof)

# Do we reject the null hypothesis?
t_hbetaj > c # try running this with se_betaj = 1.4 instead

####################
#Illustration of one-sided hypothesis tests
####################

n = 2000 #Set sample size
M = 100 #Number of experiments
beta0 = 1
beta1 = 0
sigma = 1 #Standard deviation of U, i.e. sigma

#Slope coefficient vector
slopevec = rep(0,M)

#Monte Carlo

for (i in 1:M) {
  
  #Generate data
  Uvec = rnorm(n, mean = 0, sd = sigma)
  Xvec = rnorm(n, mean = 0, sd = 2)
  Yvec = beta0 + beta1 * Xvec + Uvec
  
  #Run regressions
  reg = lm(Yvec ~ Xvec)
  
  #Save t-value
  slopevec[i] = summary(reg)$coefficients[2,3]
}

hist(slopevec, main = paste("Histogram of 
                            t-statistics with beta1 =", 
                            toString(beta1)),
     xlim = c(- 10, 10))