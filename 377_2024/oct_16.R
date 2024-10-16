# Problem set 6
# Q3
library(wooldridge)
reg = lm(cons ~ inc, data = saving)
n = nrow(saving)
SSE = (n - 1) * var(reg$fitted.values)

# Q6
reg = lm(log(wage) ~ IQ, data = wage2)
b1hat = reg$coefficients[2]
100 * b1hat * -0.2

# Q12
reg = lm(math10 ~ log(expend), data = meap93)
summary(reg)$r.squared
b0hat = reg$coefficients[1]
b1hat = reg$coefficients[2]
b0hat + b1hat * log(4519)

####################
#Illustration of one-sided hypothesis tests
####################

n = 20 #Set sample size
M = 1000 #Number of experiments
beta0 = 35
beta1 = 250
sigma = 10 #Standard deviation of U, i.e. sigma
OVB = 0

#Slope coefficient vector
slopevec = rep(0,M)

#Monte Carlo

for (i in 1:M) {
  
  #Generate data
  Uvec = rnorm(n, mean = 0, sd = sigma)
  Xvec = rnorm(n, mean = 0, sd = 2)
  Uvec = Uvec + OVB * Xvec
  Yvec = beta0 + beta1 * Xvec + Uvec
  
  #Run regressions
  reg = lm(Yvec ~ Xvec)
  
  #Save t-value
  slopevec[i] = reg$coefficients[2]
}

hist(slopevec, main = paste("Histogram of 
                            beta1 with beta1 =", 
                            toString(beta1)),
     xlim = c(beta1 -2, beta1 + 2))