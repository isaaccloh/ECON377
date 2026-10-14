## >>> GET & SAVE (details in the R guide) -------------------------
## GET, git mode  -> run in the Console:
##   download.file("https://raw.githubusercontent.com/isaaccloh/ECON377/main/377_2026/D15/D15_starter.R", "D15.R")
## GET, easy mode -> copy this file from github.com/isaaccloh/ECON377 (377_2026/D15) into a new script
## SAVE your work -> commit + push D15.R to your own econ377 repo (or upload it on github.com)
## ----------------------------------------------------------------

## ECN 377 - Day 15 STARTER  |  Assumptions, unbiasedness, omitted-variable bias
## ------------------------------------------------------------------
## An omitted variable biases OLS if it (1) affects Y AND (2) is correlated with X.
## Fill the comments, then upload to GitHub.
## ------------------------------------------------------------------

library(wooldridge)
data("meap93")

## ---- Demo: OVB in the wild ----
## What you're learning: a "wrong sign" often means a confounder, not a real effect.
lm(math10 ~ lnchprg, data = meap93)$coefficients   # 32.14 and -0.319 (negative!)
## The negative slope does NOT mean free lunch lowers scores -- poverty drives both.

## ================= PROBLEMS (your turn) =========================
## Model: wage = b0 + b1*educ + U, with ability hiding in U.
## (a) Does ability (1) affect wage? (2) correlate with educ?   ANSWER:
## (b) Is the educ slope biased up or down? (Table 3.2)          ANSWER:
## (c) Which assumption fails?                                   ANSWER:

## ================= DEMO: unbiasedness and omitted-variable bias =================
## What you're learning: the OLS estimates change from sample to sample. On AVERAGE they
## hit the true beta0 and beta1 (unbiased) -- unless an omitted variable hiding in U is
## correlated with X. Then the whole cloud of estimates shifts away from the truth (bias).
## Run it one section at a time.

set.seed(377)
beta0 <- 1          # TRUE intercept (we only know it because we made up the population)
beta1 <- 2          # TRUE slope
n <- 20             # sample size

## A function that draws ONE random sample from the population  y = beta0 + beta1*x + u.
## delta = 0: U is pure noise, so E[U | X] = 0.
## delta > 0: an omitted variable equal to delta*x hides in U, so E[U | X] is NOT 0.
draw_sample <- function(delta) {
  x <- runif(n, min = 0, max = 10)
  u <- delta * x + rnorm(n, mean = 0, sd = 3)
  y <- beta0 + beta1 * x + u
  data.frame(x = round(x, 2), y = round(y, 2))
}

## ---- 1. One random sample ----
s <- draw_sample(delta = 0)
s                   # the data: 20 (x, y) pairs
plot(s$x, s$y, xlab = "x", ylab = "y", main = "One random sample")

## ---- 2. Estimate b0 and b1 from this sample, and plot the pair ----
reg <- lm(y ~ x, data = s)
reg$coefficients    # close to 1 and 2, but not exact
plot(reg$coefficients[1], reg$coefficients[2], pch = 19,
     xlim = c(-6, 7), ylim = c(1, 3.5),
     xlab = "b0-hat (intercept)", ylab = "b1-hat (slope)", main = "One sample = one point")
points(beta0, beta1, col = "red", pch = 4, cex = 3, lwd = 3)   # red X = the truth

## ---- 3. Repeat 1000 times: a cloud of estimates ----
reps <- 1000
b0hat <- numeric(reps)
b1hat <- numeric(reps)
for (r in 1:reps) {
  s <- draw_sample(delta = 0)
  reg <- lm(y ~ x, data = s)
  b0hat[r] <- reg$coefficients[1]
  b1hat[r] <- reg$coefficients[2]
}
plot(b0hat, b1hat, col = "gray", xlim = c(-6, 7), ylim = c(1, 3.5),
     xlab = "b0-hat (intercept)", ylab = "b1-hat (slope)", main = "1000 samples")
points(beta0, beta1, col = "red", pch = 4, cex = 3, lwd = 3)                   # truth
points(mean(b0hat), mean(b1hat), col = "blue", pch = 19, cex = 2)              # average estimate
c(mean_b0hat = mean(b0hat), mean_b1hat = mean(b1hat))                         # ~ 1 and ~ 2: unbiased

## ---- 4. Inject an omitted variable into U and repeat ----
## Now U contains delta*x: something that raises y AND moves with x (think: ability and educ).
delta <- 0.5
b0bias <- numeric(reps)
b1bias <- numeric(reps)
for (r in 1:reps) {
  s <- draw_sample(delta = delta)
  reg <- lm(y ~ x, data = s)
  b0bias[r] <- reg$coefficients[1]
  b1bias[r] <- reg$coefficients[2]
}
points(b0bias, b1bias, col = "orange")                                         # new cloud
points(beta0, beta1, col = "red", pch = 4, cex = 3, lwd = 3)                   # truth (on top)
points(mean(b0bias), mean(b1bias), col = "darkorange3", pch = 19, cex = 2)     # new average
c(mean_b0hat = mean(b0bias), mean_b1hat = mean(b1bias))                       # slope ~ 2.5, not 2: biased UP by delta
## Try delta <- -0.5 (biased DOWN) or delta <- 1 and rerun section 4.
