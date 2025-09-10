# Calculating E[X*Y]
xvec = c(1,2,1)
yvec = c(2,3,3)
pvec = c(1/2,1/4,1/4)

# Step one: multiply xvec and yvec
# Step two: multiply by pvec
# Step three: sum together
sum(xvec * yvec * pvec)

# Calculating E[X * Y^2]
sum(xvec * yvec^2 * pvec)

# Calculate E[log(X) * exp(Y)]
sum(log(xvec) * exp(yvec) * pvec)

# Calculate E[log(X + Y)] 
sum(log(xvec + yvec) * pvec)

# E[x * Y] for a coin flip
xvec = c(0,0,1,1)
yvec = c(0,1,0,1)
pvec = rep(1/4,4)
sum(xvec * yvec * pvec)

# NOTE: this is a SAMPLE variance, NOT population!!!
var()

# PS2, Q6
xvec = 1:6
pvec = rep(1/6, 6)
sum(xvec * pvec)


