# Setting the (unknown) population b0 and b1
beta_0 = 2
beta_1 = 1

n = 10 # Sample size 

my_data = data.frame(x = rnorm(n))
my_data$y = beta_0 + beta_1 * my_data$x + rnorm(n) # This conforms to SLR

plot(my_data$x, my_data$y)
abline(beta_0, beta_1, col = 'green') # True population line

reg = lm(y ~ x, data = my_data)
abline(reg, col = 'red') # Sample estimate (OLS)

n_reps = 1000
b1_vec = c()

for (i in 1:n_reps){
  my_data = data.frame(x = rnorm(n)) # Creating random data
  my_data$y = beta_0 + beta_1 * my_data$x + rnorm(n)
  reg = lm(y ~ x, data = my_data) # Running regression
  b1_vec = c(b1_vec, reg$coefficients[2]) # Adds beta1hat to b1_vec
}

hist(b1_vec, breaks = 30, col = 'gray')
abline(v = beta_1, col = 'green')

reg$coefficients
options(digits = 15)
