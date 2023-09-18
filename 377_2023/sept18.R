# Clear memory
rm(list = ls())

# Calculate covariance 
x_vec = c(0,1,2)
y_vec = c(1,2,3)
p_vec = c(1/2, 1/4, 1/4)

EXY = sum(x_vec * y_vec * p_vec)
EX = sum(x_vec * p_vec)
EY = sum(y_vec * p_vec)

EXY - EX * EY # Covariance formula

