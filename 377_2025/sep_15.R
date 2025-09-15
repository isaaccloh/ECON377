# Calculating covariance of two independent coin flips
xvec = c(0,0,1,1)
yvec = c(0,1,0,1)
pvec = rep(1/4, 4)

# Calculating expected values
EXY = sum(xvec * yvec * pvec)
EX = sum(xvec * pvec)
EY = sum(yvec * pvec)

# Calculate covariance
covXY = EXY - EX * EY

# Example of conditional expectations
# install.packages('wooldridge')
# install.packages('rgl')
# install.packages('MASS')

library(wooldridge)
library(rgl)
library(MASS)

?wage1 # To get information on dataset
View(wage1) # How to view dataset
plot(wage1$educ, wage1$wage) # Use dataset$variablename
kde = kde2d(wage1$educ, wage1$wage, n = 50) # n controls grid resolution
persp3d(kde$x, kde$y, kde$z, col = 'lightblue')
