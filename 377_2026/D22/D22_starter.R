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
s                                        # Estimate | Std. Error | t value | Pr(>|t|)
s[, "Estimate"] / s[, "Std. Error"]      # = the "t value" column

## ---- Demo: is the return to experience positive? (Example 4.1) ----
reg <- lm(log(wage) ~ educ + exper + tenure, data = wage1)
s <- summary(reg)$coefficients
t_exper <- s["exper", "t value"]        # t-stat for exper
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
## truth and tightens as n grows. The t-statistic (b1-hat - beta1) / se does NOT tighten: it settles
## on a t distribution with df = n - 2, which looks normal once n is large.
## Run it one section at a time.

set.seed(377)
beta0 <- 1          # TRUE intercept
beta1 <- 2          # TRUE slope: the population line is y = 1 + 2x
sigma <- 3          # sd of U (U is normal)

## the experiment: draw a random sample of size n, run OLS; repeat reps times
many <- function(n, reps = 5000) {
  out <- matrix(NA, nrow = reps, ncol = 2)
  for (r in 1:reps) {
    x <- runif(n, min = 0, max = 10)
    y <- beta0 + beta1 * x + rnorm(n, mean = 0, sd = sigma)
    out[r, ] <- summary(lm(y ~ x))$coefficients[2, 1:2]
  }
  out               # column 1 = b1-hat, column 2 = se(b1-hat)
}
bins <- seq(-1, 5, by = 0.05)       # FIXED bins for every b1-hat histogram
tbins <- seq(-5, 5, by = 0.2)       # FIXED bins for every t histogram

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
b1hat <- many(5)[, 1]
hist(b1hat[abs(b1hat - beta1) < 3], breaks = bins, col = "gray",     # drops the rare extreme values
     main = "5000 values of b1-hat, n = 5", xlab = "b1-hat")
abline(v = beta1, col = "red", lwd = 3)
mean(b1hat)                                                # about 2: unbiased

## ---- 5. Larger samples: same scale, the distribution concentrates at the truth ----
par(mfrow = c(2, 2))
for (n in c(5, 20, 100, 500)) {
  b1hat <- many(n)[, 1]
  hist(b1hat[abs(b1hat - beta1) < 3], breaks = bins, col = "gray",
       main = paste("n =", n), xlab = "b1-hat")
  abline(v = beta1, col = "red", lwd = 3)
}
par(mfrow = c(1, 1))

## ---- 6. Back to our n = 5 sample: its t-statistic ----
se <- summary(reg)$coefficients[2, 2]                      # se(b1-hat) from the same sample
t1 <- (b1 - beta1) / se
t1
hist(t1, breaks = tbins, col = "lightblue", main = "One t, n = 5", xlab = "t")

## ---- 7. Repeat 5000 times: the t distribution with df = n - 2 = 3 ----
sims <- many(5)
t <- (sims[, 1] - beta1) / sims[, 2]
hist(t[abs(t) < 5], breaks = tbins, freq = FALSE, col = "lightblue",
     main = "5000 values of t, n = 5", xlab = "t")
curve(dnorm(x), add = TRUE, lty = 2, lwd = 2)              # N(0,1): too thin in the tails
curve(dt(x, df = 3), add = TRUE, col = "red", lwd = 2)     # t with 3 df: fits
legend("topright", c("N(0,1)", "t, df = n - 2"), col = c("black", "red"), lty = c(2, 1), lwd = 2)
mean(abs(t) > 1.96)                                        # about 0.14: 1.96 is too small at n = 5
mean(abs(t) > qt(0.975, df = 3))                           # about 0.05: the t cutoff works

## ---- 8. Larger samples: t does NOT collapse; it settles on t(n - 2), then on N(0,1) ----
par(mfrow = c(2, 2))
for (n in c(5, 10, 30, 100)) {
  sims <- many(n)
  t <- (sims[, 1] - beta1) / sims[, 2]
  hist(t[abs(t) < 5], breaks = tbins, freq = FALSE, ylim = c(0, 0.45), col = "lightblue",
       main = paste0("n = ", n, ",  df = ", n - 2), xlab = "t")
  curve(dnorm(x), add = TRUE, lty = 2, lwd = 2)
  curve(dt(x, df = n - 2), add = TRUE, col = "red", lwd = 2)
}
par(mfrow = c(1, 1))
