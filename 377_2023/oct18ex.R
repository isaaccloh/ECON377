# Clear memory
rm(list = ls())

# Generate random data
n = 1000 # Sample size
m = 10000 # Number of samples
sigma = 0.4 # Variation of u

# Illustration of what we're doing
x = rnorm(n)
y = x + sigma * rnorm(n) # true beta1 = 1
reg = lm(y ~ x)
plot(x, y)
abline(reg)

# Many draws of beta1
res = c()

for (a in 1:m) {
  x = rnorm(n)
  y = x + sigma * rnorm(n)
  reg = lm(y ~ x)
  res = append(res, reg$coefficients[2])
}

hist(res, xlim = range(c(0.9, 1.1)))

# Illustration of omitted variables bias
x = rnorm(n)
z = -0.5 * x + sigma * rnorm(n)
y = x + z +  sigma * rnorm(n) # true beta1 = 1
reg = lm(y ~ x)
plot(x, y)
abline(a = 0, b = 1) # True regression line
abline(reg, col = 'red') # Biased regression

# Illustration of heteroskedasticity
x = rnorm(n)
y = x + x * sigma * rnorm(n) # true beta1 = 1
reg = lm(y ~ x)
plot(x, y)
abline(a = 0, b = 1) # True regression line

## Plotting heteroskedasticity 
plot(wage1$educ, wage1$wage)
reg = lm(wage ~ educ, data = wage1)
abline(reg)
