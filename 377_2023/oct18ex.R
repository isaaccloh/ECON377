# Clear memory
rm(list = ls())

# Generate random data
n = 100 # Sample size
m = 100 # Number of samples
sigma = 0.2 # Variation of u

# Illustration of what we're doing
x = rnorm(n)
y = x + sigma * rnorm(n)
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
?hist
