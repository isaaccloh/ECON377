# Exploring the Gaussian distribution (continuous) in R
n = 10 # Sample size
xvec = rnorm(n, mean = 0, sd = 1) # Draw of 1000 observations from Bell curve
hist(xvec, probability = TRUE) # Plot empirical distribution 
curve(dnorm(x, mean = 0, sd = 1), add = TRUE) # Plot continuous distribution

# Expected value of six sided die
die_values = 1:6
p_vec = rep(1/6, 6)
sum(die_values * 1/6)

# Expected value of a die roll squared 
sum(die_values^2 * p_vec)

# Expected value of sine of die roll 
sum(sin(die_values) * p_vec)
