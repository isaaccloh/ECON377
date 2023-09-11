# Clear memory
rm(list = ls())

## Expected value of a die roll
# Hard way 
1/6 + 2/6 + 3/6 + 4/6 + 5/6 + 6/6

# 'Easy way' 
prob_vec = rep(1/6, 6)
x_vec = c(1:6)  
sum(prob_vec * x_vec)

## Showing that sample average converges 
# to expected value
n = 100
x = sample(1:6, size = n, replace = T)
cum_avg = cumsum(x) / sqrt(seq_along(x))
plot(seq_along(x), cum_avg, type = 'l')

## Expected value of squared die roll
# 'Easy way'
prob_vec = rep(1/6, 6)
x_vec = c(1:6)  
sum(prob_vec * x_vec^2)

# Q10
5.1 - 1.5^2
   
# Q12 
x_vec = c(3,4,2)
prob_vec = c(1/3, 1/5, 7/15)
sum(x_vec^2 * prob_vec)

# Q15 undo the log
exp(0.33)
