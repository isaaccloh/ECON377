# install.packages("rgl")
# install.packages("MASS")
library(rgl)
library(MASS)

set.seed(123)
X <- rnorm(5000)
Y <- 0.5 * X + rnorm(5000, sd = 0.5)   # Heteroskedasticity
# Homoskedasticity: remove (1 - X)

# Estimate density
dens <- kde2d(X, Y, n = 80)

# Open a 3D interactive window
open3d()
persp3d(
  dens$x, dens$y, dens$z,
  col = "lightblue",
  xlab = "X", ylab = "Y", zlab = "Density",
  smooth = TRUE
)

# PS7, Q1
library(wooldridge)
reg = lm(log(salary) ~ ceoten, data = ceosal2)
summary(reg)
b1 = reg$coefficients[2]
b1 * 100 * 6.6
