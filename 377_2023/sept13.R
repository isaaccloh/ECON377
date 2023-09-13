# Clear memory
rm(list = ls())

# Calculate E[X*Y]
x_vec = c(1, 2, 1)
y_vec = c(2, 3, 3)
p_vec = c(1/3, 1/3, 1/3)

sum(x_vec * y_vec * p_vec)

# E[X*Y] for independent coin tosses
x_vec = c(0, 0, 1, 1)
y_vec = c(0, 1, 0, 1)
p_vec = rep(1/4, 4)
sum(x_vec * y_vec * p_vec)
