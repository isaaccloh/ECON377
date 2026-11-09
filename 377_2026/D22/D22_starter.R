## >>> GET & SAVE (details in the R guide) -------------------------
## GET, git mode  -> run in the Console:
##   download.file("https://raw.githubusercontent.com/isaaccloh/ECON377/main/377_2026/D22/D22_starter.R", "D22.R")
## GET, easy mode -> copy this file from github.com/isaaccloh/ECON377 (377_2026/D22) into a new script
## SAVE your work -> commit + push D22.R to your own econ377 repo (or upload it on github.com)
## ----------------------------------------------------------------

## ECN 377 - Day 22 STARTER  |  Normality, the t-statistic;  one-sided t-tests
## ------------------------------------------------------------------
## The t-statistic = estimate / se = "how many standard errors from zero."
## The simulation DEMO at the end shows where the t distribution comes from.
## H1: beta > 0.  Reject H0 if  t > c,  where c = qt(1 - alpha, df).
## Fill each ______ and ANSWER, then upload to GitHub.
## ------------------------------------------------------------------

library(wooldridge)
data("wage1")

## ---- Demo: the t-statistic ----
## What you're learning: the "t value" column is beta-hat / se.
reg <- lm(wage ~ educ, data = wage1)
s <- summary(reg)$coefficients
s                                        # columns: 1 Estimate | 2 Std. Error | 3 t value | 4 Pr(>|t|)
s[, 1] / s[, 2]                          # column 1 / column 2 = column 3, the "t value"

## ---- Demo: is the return to experience positive? (Example 4.1) ----
reg <- lm(log(wage) ~ educ + exper + tenure, data = wage1)
s <- summary(reg)$coefficients
t_exper <- s[3, 3]                      # row 3 = exper, column 3 = t value
c_05    <- qt(0.95, df = reg$df.residual)   # 5% one-sided critical value
c(t_exper = t_exper, c_05 = c_05)       # t > c  =>  reject H0

## ================= PROBLEMS (your turn) =========================
## An estimate beta-hat = 0.54 with se = 0.05.
bhat <- 0.54
se <- 0.05
tstat <- ______   # (a) t = beta-hat / se   (hint: bhat/se)
## (b) Is |t| big (far from 0)?              ANSWER:
## (c) What null hypothesis does this t test? ANSWER:

## H0: beta = 0 vs H1: beta > 0, alpha = 0.05, critical value c = 1.68
c <- 1.68
## (d) t = 2.4 : reject or fail to reject?   ANSWER:
## (e) t = 0.9 :                              ANSWER:
## (f) t = -3.0 (with H1: beta > 0) :         ANSWER:

## ================= DEMO: from b1-hat to the t distribution =================
## What you're learning: b1-hat changes from sample to sample. Its distribution is centered at the
## truth and tightens as n grows (sections 1-5). Dividing (b1-hat - beta1) by its TRUE sd gives
## N(0,1) (Thm 4.1). Dividing by the estimated se gives a t distribution with df = n - 2 (Thm 4.2),
## which looks normal once n is large (sections 6-8).
## Run it one section at a time.

set.seed(377)
beta0 <- 1          # TRUE intercept
beta1 <- 2          # TRUE slope: the population line is y = 1 + 2x
sigma <- 3          # sd of U (U is normal)

## the experiment: draw a random sample of size n, run OLS; repeat reps times
many <- function(n, reps = 5000) {
  out <- matrix(NA, nrow = reps, ncol = 3)
  colnames(out) <- c("b1hat", "se", "sd")
  for (r in 1:reps) {
    x <- runif(n, min = 0, max = 10)
    y <- beta0 + beta1 * x + rnorm(n, mean = 0, sd = sigma)
    out[r, 1:2] <- summary(lm(y ~ x))$coefficients[2, 1:2]     # b1-hat and its se (uses sigma-hat)
    out[r, 3] <- sigma / sqrt(sum((x - mean(x))^2))             # TRUE sd of b1-hat (uses sigma)
  }
  out
}
bins <- seq(-1, 5, by = 0.05)       # FIXED bins for every b1-hat histogram
tbins <- seq(-5, 5, by = 0.2)       # FIXED bins for every normalized histogram

## ---- 1. One random sample (n = 5) and the TRUE population line ----
n <- 5
x <- runif(n, min = 0, max = 10)
y <- beta0 + beta1 * x + rnorm(n, mean = 0, sd = sigma)
plot(x, y, xlim = c(0, 10), ylim = c(-10, 30), pch = 19, main = "One random sample, n = 5")
abline(a = beta0, b = beta1, col = "red", lwd = 2)         # population line: E(y|x) = 1 + 2x

## ---- 2. Add this sample's OLS line ----
reg <- lm(y ~ x)
abline(reg, col = "blue", lwd = 2, lty = 2)                # OLS line: close, but not the truth
legend("topleft", c("population line", "OLS line"), col = c("red", "blue"), lty = c(1, 2), lwd = 2)
b1 <- reg$coefficients[2]
b1

## ---- 3. This one b1-hat on a histogram, with the truth in red ----
hist(b1, breaks = bins, col = "gray", main = "One b1-hat, n = 5", xlab = "b1-hat")
abline(v = beta1, col = "red", lwd = 3)

## ---- 4. Repeat the experiment 5000 times ----
b1hat <- many(5)[, "b1hat"]
hist(b1hat[abs(b1hat - beta1) < 3], breaks = bins, col = "gray",     # drops the rare extreme values
     main = "5000 values of b1-hat, n = 5", xlab = "b1-hat")
abline(v = beta1, col = "red", lwd = 3)
mean(b1hat)                                                # about 2: unbiased

## ---- 5. Larger samples: same scale, the distribution concentrates at the truth ----
par(mfrow = c(2, 2))
for (n in c(5, 20, 100, 500)) {
  b1hat <- many(n)[, "b1hat"]
  hist(b1hat[abs(b1hat - beta1) < 3], breaks = bins, col = "gray",
       main = paste("n =", n), xlab = "b1-hat")
  abline(v = beta1, col = "red", lwd = 3)
}
par(mfrow = c(1, 1))

## ================= TOGGLE: what do we divide (b1-hat - beta1) by? =================
## Run sections 6-8 with "sd" first, then switch to "se" and run them again.
divide_by <- "sd"     # "sd" = the TRUE sd (needs sigma, Thm 4.1)  |  "se" = the estimated se (uses sigma-hat, Thm 4.2)

## ---- 6. Back to our n = 5 sample: normalize its b1-hat ----
sd_b1 <- sigma / sqrt(sum((x - mean(x))^2))                # TRUE sd, given these x's
se_b1 <- summary(reg)$coefficients[2, 2]                   # se from the same sample
c(sd = sd_b1, se = se_b1)                                  # the se only ESTIMATES the sd
if (divide_by == "sd") {
  z1 <- (b1 - beta1) / sd_b1
} else {
  z1 <- (b1 - beta1) / se_b1
}
z1
hist(z1, breaks = tbins, col = "lightblue", main = paste("One value, divided by the", divide_by),
     xlab = paste("(b1-hat - beta1) /", divide_by))

## ---- 7. Repeat 5000 times (n = 5), with N(0,1) as the reference ----
sims <- many(5)
z <- (sims[, "b1hat"] - beta1) / sims[, divide_by]        # column "sd" or column "se"
hist(z[abs(z) < 5], breaks = tbins, freq = FALSE, ylim = c(0, 0.45), col = "lightblue",
     main = paste("5000 values, n = 5, divided by the", divide_by), xlab = paste("(b1-hat - beta1) /", divide_by))
curve(dnorm(x), add = TRUE, lwd = 2)                       # N(0,1). sd: fits.  se: too thin in the tails
mean(abs(z) > 1.96)                                        # sd: about 0.05.  se: about 0.14

## ---- 7b. ("se" only) Switch to the t distribution with df = n - 2 = 3 ----
curve(dt(x, df = 3), add = TRUE, col = "red", lwd = 2)     # fits the tails
legend("topright", c("N(0,1)", "t, df = n - 2"), col = c("black", "red"), lwd = 2)
mean(abs(z) > qt(0.975, df = 3))                           # about 0.05: the t cutoff (3.18) works

## ---- 8. Larger samples: same scale, the shape does NOT shrink ----
## sd: N(0,1) at every n.  se: t with n - 2 df, which turns into N(0,1) as n grows.
par(mfrow = c(2, 2))
for (n in c(5, 10, 30, 100)) {
  sims <- many(n)
  z <- (sims[, "b1hat"] - beta1) / sims[, divide_by]
  hist(z[abs(z) < 5], breaks = tbins, freq = FALSE, ylim = c(0, 0.45), col = "lightblue",
       main = paste0("n = ", n, ", divided by the ", divide_by), xlab = paste("(b1-hat - beta1) /", divide_by))
  curve(dnorm(x), add = TRUE, lwd = 2)
  if (divide_by == "se") {
    curve(dt(x, df = n - 2), add = TRUE, col = "red", lwd = 2)
  }
}
par(mfrow = c(1, 1))
