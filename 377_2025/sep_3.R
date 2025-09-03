# Calculation of sample covariance
xvec = c(2,3,3)
yvec = c(3,1,3)

# Step one: demean the data
xvec2 = xvec - mean(xvec)
yvec2 = yvec - mean(yvec)

# Step two: multiply together, sum, divide by n-1
sum(xvec2 * yvec2) / (3 - 1)

# Easier way: cov 
cov(xvec, yvec)

# Sample correlation = S_XY / (S_X * S_Y)
cov(xvec, yvec) / (sd(xvec) * sd(yvec))

# Easier way: cor
cor(xvec, yvec)

# Exponential and logarithmic functions
exp(10)
log(10)
exp(log(10)) # Exponential and logarithmic functions are inverses
log(exp(10))

# Question 12, PS 1
# (Xnew - Xold) / Xold
(3.22 - 1.3) / 1.3

# Question 14, PS 1
# Xnew - Xold
5.86 - 2.13

# Question 9, PS 1
# beta_1 * Delta mothinc
1.3 * 2.3
