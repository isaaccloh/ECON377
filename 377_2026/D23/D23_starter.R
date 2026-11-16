## >>> GET & SAVE (details in the R guide) -------------------------
## GET, git mode  -> run in the Console:
##   download.file("https://raw.githubusercontent.com/isaaccloh/ECON377/main/377_2026/D23/D23_starter.R", "D23.R")
## GET, easy mode -> copy this file from github.com/isaaccloh/ECON377 (377_2026/D23) into a new script
## SAVE your work -> commit + push D23.R to your own econ377 repo (or upload it on github.com)
## ----------------------------------------------------------------

## ECN 377 - Day 23 STARTER  |  One-sided t-tests
## ------------------------------------------------------------------
## t = beta-hat / se, and under H0: beta = 0 it has a t distribution with df = n - K - 1.
## H1: beta > 0  ->  reject H0 if t > c,  c = qt(1 - alpha, df)   (right tail)
## H1: beta < 0  ->  reject H0 if t < c,  c = qt(alpha, df)       (left tail, c is negative)
## The DEMO at the end draws a one-sided test in pictures.
## Fill each ______ and ANSWER, then upload to GitHub.
## ------------------------------------------------------------------

library(wooldridge)

## ---- Demo: is the return to experience positive? (Example 4.1) ----
## What you're learning: H1: beta > 0 uses the RIGHT tail.
data("wage1")
reg <- lm(log(wage) ~ educ + exper + tenure, data = wage1)
s <- summary(reg)$coefficients
t_exper <- s[3, 3]                         # row 3 = exper, column 3 = t value
c_05 <- qt(0.95, df = reg$df.residual)     # 5% critical value
c_01 <- qt(0.99, df = reg$df.residual)     # 1% critical value
t_exper
c_05
c_01

## ---- Demo: do larger schools do worse? (Example 4.2) ----
## What you're learning: H1: beta < 0 uses the LEFT tail, so c is negative.
data("meap93")
reg <- lm(math10 ~ totcomp + staff + enroll, data = meap93)
s <- summary(reg)$coefficients
t_enroll <- s[4, 3]                        # row 4 = enroll, column 3 = t value
c_left <- qt(0.05, df = reg$df.residual)   # 5% critical value, left tail
t_enroll
c_left

## ================= PROBLEMS (your turn) =========================
## H0: beta = 0 vs H1: beta > 0, alpha = 0.05, df = 40
c1 <- ______   # (a) critical value   (hint: qt(1 - alpha, df = 40))
## (b) t = 2.4 : reject or fail to reject?   ANSWER:
##     t = 0.9 :                              ANSWER:
##     t = -3.0 :                             ANSWER:

## H0: beta = 0 vs H1: beta < 0, alpha = 0.05, df = 30
c2 <- ______   # (c) critical value   (hint: qt(alpha, df = 30))
## (c) Is c2 positive or negative?            ANSWER:
## (d) t = -2.10 : reject?                    ANSWER:
##     t = -1.20 : reject?                    ANSWER:

## ================= DEMO: a one-sided test in pictures =================
## What you're learning: H0: beta1 = 0 vs H1: beta1 > 0. We draw samples from a world where H0 is true
## (flat population line, blue) and from a world where H1 is true (slope 0.5, orange). Sections 1-3
## compare their b1-hats. Section 4 compares their t-statistics with the critical value c.
## Section 5 makes the samples larger. Run it one section at a time.

set.seed(412)
beta0 <- 1
beta1_null <- 0       # H0 true: the population line is flat
beta1_alt <- 0.5      # H1 true: the population line slopes up
sigma <- 3            # sd of U (U is normal)
n <- 20

## one random sample of size n from the population line beta0 + beta1 * x
draw_sample <- function(n, beta1) {
  x <- runif(n, min = 0, max = 10)
  y <- beta0 + beta1 * x + rnorm(n, mean = 0, sd = sigma)
  data.frame(x = x, y = y)
}
## repeat: draw a sample, run OLS, keep b1-hat and its t value
many <- function(n, beta1, reps = 5000) {
  out <- matrix(NA, nrow = reps, ncol = 2)
  colnames(out) <- c("b1hat", "t")
  for (r in 1:reps) {
    d <- draw_sample(n, beta1)
    out[r, ] <- summary(lm(y ~ x, data = d))$coefficients[2, c(1, 3)]   # row 2 = slope; columns 1 (estimate), 3 (t value)
  }
  out
}
blue <- adjustcolor("steelblue", alpha.f = 0.5)
orange <- adjustcolor("darkorange", alpha.f = 0.5)
bins <- seq(-2, 2.5, by = 0.05)          # FIXED bins for every b1-hat histogram
tbins <- seq(-6, 12, by = 0.25)          # FIXED bins for every t histogram
inside <- function(v, breaks) v[v > min(breaks) & v < max(breaks)]   # drops rare values off the scale

## ---- 1. Two samples (n = 20): one where H0 is true, one where H1 is true ----
d0 <- draw_sample(n, beta1_null)
d1 <- draw_sample(n, beta1_alt)
plot(d0$x, d0$y, pch = 19, col = "steelblue", xlim = c(0, 10), ylim = c(-8, 16),
     xlab = "x", ylab = "y", main = "Two samples, n = 20")
points(d1$x, d1$y, pch = 19, col = "darkorange")
abline(a = beta0, b = beta1_null, col = "steelblue", lwd = 2)      # population lines (solid)
abline(a = beta0, b = beta1_alt, col = "darkorange", lwd = 2)
reg0 <- lm(y ~ x, data = d0)
reg1 <- lm(y ~ x, data = d1)
abline(reg0, col = "steelblue", lwd = 2, lty = 2)                  # OLS lines (dashed)
abline(reg1, col = "darkorange", lwd = 2, lty = 2)
legend("topleft", c("H0 true: slope 0", "H1 true: slope 0.5", "population line", "OLS line"),
       col = c("steelblue", "darkorange", "black", "black"), pch = c(19, 19, NA, NA), lty = c(NA, NA, 1, 2), lwd = 2)

## ---- 2. Their two b1-hats on a histogram ----
b1hat_0 <- reg0$coefficients[2]
b1hat_1 <- reg1$coefficients[2]
b1hat_0
b1hat_1
hist(inside(b1hat_0, bins), breaks = bins, col = blue, ylim = c(0, 1), main = "Two b1-hats, n = 20", xlab = "b1-hat")
hist(inside(b1hat_1, bins), breaks = bins, col = orange, add = TRUE)
abline(v = c(beta1_null, beta1_alt), col = c("steelblue", "darkorange"), lwd = 3)   # the true slopes

## ---- 3. Repeat each experiment 5000 times ----
sims0 <- many(n, beta1_null)
sims1 <- many(n, beta1_alt)
hist(inside(sims0[, 1], bins), breaks = bins, col = blue, ylim = c(0, 500),
     main = "5000 b1-hats from each world, n = 20", xlab = "b1-hat")
hist(inside(sims1[, 1], bins), breaks = bins, col = orange, add = TRUE)
abline(v = c(beta1_null, beta1_alt), col = c("steelblue", "darkorange"), lwd = 3)
## The histograms overlap: one sample cannot always tell the two worlds apart.

## ---- 4. The test compares t = b1-hat / se with the critical value c ----
crit <- qt(0.95, df = n - 2)             # 5% one-sided critical value: reject H0 if t > crit
crit
hist(inside(sims0[, 2], tbins), breaks = tbins, freq = FALSE, col = blue, ylim = c(0, 0.45),
     main = "5000 t-statistics from each world, n = 20", xlab = "t = b1-hat / se")
hist(inside(sims1[, 2], tbins), breaks = tbins, freq = FALSE, col = orange, add = TRUE)
curve(dt(x, df = n - 2), add = TRUE, lwd = 2)      # H0 true: t has a t distribution with df = n - 2
abline(v = crit, lwd = 3)                          # reject H0 to the right of this line
mean(sims0[, 2] > crit)    # H0 true: rejects about 5% of the time (alpha, the error rate)
mean(sims1[, 2] > crit)    # H1 true: how often the test detects the positive slope

## ---- 5. Larger samples: the H0 world stays put, the H1 world moves right ----
par(mfrow = c(2, 2))
for (n in c(10, 20, 50, 100)) {
  sims0 <- many(n, beta1_null, reps = 2000)
  sims1 <- many(n, beta1_alt, reps = 2000)
  crit <- qt(0.95, df = n - 2)
  reject0 <- round(100 * mean(sims0[, 2] > crit))
  reject1 <- round(100 * mean(sims1[, 2] > crit))
  hist(inside(sims0[, 2], tbins), breaks = tbins, freq = FALSE, col = blue, ylim = c(0, 0.45),
       main = paste0("n = ", n, ": rejects ", reject0, "% (H0), ", reject1, "% (H1)"), xlab = "t = b1-hat / se")
  hist(inside(sims1[, 2], tbins), breaks = tbins, freq = FALSE, col = orange, add = TRUE)
  abline(v = crit, lwd = 3)
}
par(mfrow = c(1, 1))
## H0 world: about 5% at every n (5 or 6 here: simulation noise). H1 world: the share rejected grows with n.
