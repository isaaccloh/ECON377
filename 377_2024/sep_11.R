# Sept 11

# Expected value of two coin tosses
xvec = c(0,0,1,1)
yvec = c(0,1,0,1)
pvec = rep(1/4,4)
sum(xvec * yvec * pvec)

# E[X^2 * Y]
sum(xvec^2 * yvec * pvec)

# E[sin(X) * exp(Y)]
sum(sin(xvec) * exp(yvec) * pvec)

devtools::install_github('RLesur/Rcade')
library(Rcade)
games$`2048`

# PS2, Q12
xvec = c(3,2,4)
pvec = c(1/3, 1/5, 7/15)
sum(xvec^2 * pvec)
# PS2, Q15
exp(0.2 + 0.5 * (0.44))
