# September 9

# Expected value of die roll
xvec = c(1,2,3,4,5,6)
xvec = c(1:6) # Easier way 
pvec = c(1/6,1/6,1/6,1/6,1/6,1/6)
pvec = rep(1/6,6) # Easier way
sum(xvec * pvec)

# Expected value of square of die roll
sum(xvec^2 * pvec)  

# Expected value of X *Y 
xvec = c(1,2,1)
yvec = c(2,3,3)
pvec = c(1/3,1/3,1/3)
sum(xvec * yvec * pvec)
