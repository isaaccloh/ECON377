## >>> GET & SAVE (details in the R guide) -------------------------
## GET, git mode  -> run in the Console:
##   download.file("https://raw.githubusercontent.com/isaaccloh/ECON377/main/377_2026/D16/D16_starter.R", "D16.R")
## GET, easy mode -> copy this file from github.com/isaaccloh/ECON377 (377_2026/D16) into a new script
## SAVE your work -> commit + push D16.R to your own econ377 repo (or upload it on github.com)
## ----------------------------------------------------------------

## ECN 377 - Day 16 STARTER  |  Variances of the OLS estimators; standard errors
## ------------------------------------------------------------------
## Each ______ comment gives the MATH + a hint at the code; you write the command.
## The simulation DEMO at the end shows Theorems 2.1 and 2.2 in action.
## Fill each ______ as we go, then upload to GitHub.
## ------------------------------------------------------------------

## ================= PROBLEMS (your turn) =========================
## sigma = 4,  n = 26 observations,  sample variance of X:  S_X^2 = 4
sigma0 <- 4
n0 <- 26
SX2 <- 4
SST_X0 <- ______   # (a) SST_X = (n - 1) * S_X^2
sd_b1  <- ______   # (b) sd(b1-hat) = sigma / sqrt(SST_X)        (hint: sqrt())
sd_b1x2 <- ______  # (c) sd(b1-hat) if sigma doubles to 8

## ================= DEMO: the sampling distribution of b1-hat, and sigma =================
## What you're learning: b1-hat is a random variable. Draw many samples and its values
## pile up around the true beta1 (unbiased). How SPREAD OUT they are is Var(b1-hat),
## and Theorem 2.2 says  sd(b1-hat) = sigma / sqrt(SST_X).  Bigger sigma = wider spread.
## Run it one section at a time.

set.seed(377)
beta0 <- 1          # TRUE intercept
beta1 <- 2          # TRUE slope
n <- 20             # sample size
x <- runif(n, min = 0, max = 10)      # the x values, held FIXED in every sample
SST_x <- sum((x - mean(x))^2)         # total variation in x

## A function that draws new y values for the same x:  y = beta0 + beta1*x + u,
## where u has standard deviation sigma (SLR5: Var(U | X) = sigma^2).
draw_y <- function(sigma) {
  u <- rnorm(n, mean = 0, sd = sigma)
  beta0 + beta1 * x + u
}

## ---- 1. One random sample, and its b1-hat ----
sigma <- 3
y <- draw_y(sigma)
data.frame(x = round(x, 2), y = round(y, 2))   # the data: 20 (x, y) pairs
reg <- lm(y ~ x)
reg$coefficients[2]                             # this sample's b1-hat: close to 2, not exact
plot(x, y, main = "One sample and its OLS line")
abline(reg, col = "blue", lwd = 2)              # the OLS line from this sample
abline(a = beta0, b = beta1, col = "red", lty = 2, lwd = 2)   # the TRUE line

## ---- 2. Repeat 1000 times and plot the distribution of b1-hat ----
reps <- 1000
b1hat <- numeric(reps)
for (r in 1:reps) {
  y <- draw_y(sigma)
  b1hat[r] <- lm(y ~ x)$coefficients[2]
}
hist(b1hat, breaks = 30, xlim = c(-0.5, 4.5), col = "gray",
     main = "1000 values of b1-hat (sigma = 3)", xlab = "b1-hat")
abline(v = beta1, col = "red", lwd = 3)         # the truth
mean(b1hat)                                     # ~ 2: unbiased (Theorem 2.1)
sd(b1hat)                                       # spread across samples...
sigma / sqrt(SST_x)                             # ...matches Theorem 2.2

## ---- 3. Play with sigma: more noise in U ----
sigma <- 6                                      # try 1, 6, 10 and rerun this section
b1wide <- numeric(reps)
for (r in 1:reps) {
  y <- draw_y(sigma)
  b1wide[r] <- lm(y ~ x)$coefficients[2]
}
hist(b1wide, breaks = 30, xlim = c(-0.5, 4.5), col = "orange",
     main = paste0("1000 values of b1-hat (sigma = ", sigma, ")"), xlab = "b1-hat")
abline(v = beta1, col = "red", lwd = 3)
mean(b1wide)                                    # still ~ 2: still unbiased
sd(b1wide)                                      # wider: doubling sigma doubles the spread...
sigma / sqrt(SST_x)                             # ...exactly as Theorem 2.2 predicts
## Same center, wider spread: more noise in U makes beta1 harder to pin down.
## Bonus: spread x out (x <- runif(n, 0, 20), then rerun from SST_x) and watch sd shrink.
