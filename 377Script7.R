#For 9/15/2021

#################### (for the 11:00 section)

#Exercise 4.7

#log-level regression of wages on education using wage1
reg3 = lm(log(wage) ~ educ, data = wage1)

####################

#Exercise 4.8 (for the 11:00 section)

#log-log regression of salary on sales using ceosal1
reg4 = lm(log(salary) ~ log(sales), data = ceosal1)


####################
#Illustration of asymptotic distribution of OLS estimates
####################

n = 10 #Set sample size
M = 100 #Number of experiments
beta0 = 1
beta1 = 1

#Slope coefficient vector
slopevec = rep(0,M)

#Monte Carlo

for (i in 1:M) {
  
  #Generate data
  Uvec = rnorm(n, mean = 0, sd = 2)
  Xvec = rnorm(n, mean = 0, sd = 2)
  Yvec = beta0 + beta1 * Xvec + Uvec
  
  #Run regressions
  reg = lm(Yvec ~ Xvec)
  
  #Save slope coefficient
  slopevec[i] = reg$coefficients[2]
}

hist(slopevec, main = paste("Histogram of 
                            beta1 estimates with n =", 
                            toString(n)),
                            xlim = c(beta1 - 1, beta1 + 1))