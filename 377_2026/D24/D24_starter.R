## >>> GET & SAVE (details in the R guide) -------------------------
## GET, git mode  -> run in the Console:
##   download.file("https://raw.githubusercontent.com/isaaccloh/ECON377/main/377_2026/D24/D24_starter.R", "D24.R")
## GET, easy mode -> copy this file from github.com/isaaccloh/ECON377 (377_2026/D24) into a new script
## SAVE your work -> commit + push D24.R to your own econ377 repo (or upload it on github.com)
## ----------------------------------------------------------------

## ECN 377 - Day 24 STARTER  |  One-sided tests (finish); two-sided tests: the idea
## ------------------------------------------------------------------
## H1: beta > 0   ->  reject H0 if t > c,    c = qt(1 - alpha, df)   (right tail)
## H1: beta < 0   ->  reject H0 if t < c,    c = qt(alpha, df)       (left tail, c is negative)
## H1: beta != 0  ->  reject H0 if |t| > c,  c = qt(1 - alpha/2, df)   (alpha/2 in EACH tail)
## The DEMO at the end draws a two-sided test in pictures.
## Fill each ______ and ANSWER, then upload to GitHub.
## ------------------------------------------------------------------

library(wooldridge)

## ---- Example 4.1: is the return to experience positive? ----
## H0: beta = 0 vs H1: beta > 0 for exper
data("wage1")
reg <- lm(log(wage) ~ educ + exper + tenure, data = wage1)
s <- summary(reg)$coefficients
s
t_exper <- ______     # t value for exper   (hint: s[row, column])
c_05 <- ______        # 5% critical value   (hint: df = reg$df.residual)
c_01 <- ______        # 1% critical value
## Reject H0 at 5%? At 1%?                    ANSWER:

## ---- Example 4.2: do larger schools do worse? ----
## H0: beta = 0 vs H1: beta < 0 for enroll
data("meap93")
reg <- lm(math10 ~ totcomp + staff + enroll, data = meap93)
s <- summary(reg)$coefficients
s
t_enroll <- ______    # t value for enroll
c_left <- ______      # 5% critical value   (hint: which tail?)
## Reject H0 at 5%?                           ANSWER:

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

## ================= DEMO: a two-sided test in pictures =================
## What you're learning: H0: beta1 = 0 vs H1: beta1 != 0. Monday's two worlds (H0 true, blue; slope 0.5,
## orange) plus a third where H1 is true the OTHER way (slope -0.5, purple). Sections 1-3 compare their
## b1-hats. Section 4 compares their t-statistics with critical values on BOTH sides.
## Section 5 makes the samples larger. Run it one section at a time.

set.seed(412)         # Monday's seed: the blue and orange samples in section 1 are Monday's
beta0 <- 1
beta1_null <- 0       # H0 true: the population line is flat
beta1_pos <- 0.5      # H1 true: the population line slopes up
beta1_neg <- -0.5     # H1 true: the population line slopes down
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
purple <- adjustcolor("purple", alpha.f = 0.5)
bins <- seq(-2.5, 2.5, by = 0.05)        # FIXED bins for every b1-hat histogram
tbins <- seq(-12, 12, by = 0.25)         # FIXED bins for every t histogram
inside <- function(v, breaks) v[v > min(breaks) & v < max(breaks)]   # drops rare values off the scale

## ---- 1. Three samples (n = 20): H0 true, H1 true (slope up), H1 true (slope down) ----
d0 <- draw_sample(n, beta1_null)
d1 <- draw_sample(n, beta1_pos)
d2 <- draw_sample(n, beta1_neg)
plot(d0$x, d0$y, pch = 19, col = "steelblue", xlim = c(0, 10), ylim = c(-14, 16),
     xlab = "x", ylab = "y", main = "Three samples, n = 20")
points(d1$x, d1$y, pch = 19, col = "darkorange")
points(d2$x, d2$y, pch = 19, col = "purple")
abline(a = beta0, b = beta1_null, col = "steelblue", lwd = 2)      # population lines (solid)
abline(a = beta0, b = beta1_pos, col = "darkorange", lwd = 2)
abline(a = beta0, b = beta1_neg, col = "purple", lwd = 2)
reg0 <- lm(y ~ x, data = d0)
reg1 <- lm(y ~ x, data = d1)
reg2 <- lm(y ~ x, data = d2)
abline(reg0, col = "steelblue", lwd = 2, lty = 2)                  # OLS lines (dashed)
abline(reg1, col = "darkorange", lwd = 2, lty = 2)
abline(reg2, col = "purple", lwd = 2, lty = 2)
legend("topleft", c("H0 true: slope 0", "H1 true: slope 0.5", "H1 true: slope -0.5", "population line", "OLS line"),
       col = c("steelblue", "darkorange", "purple", "black", "black"), pch = c(19, 19, 19, NA, NA),
       lty = c(NA, NA, NA, 1, 2), lwd = 2)

## ---- 2. Their three b1-hats on a histogram ----
b1hat_0 <- reg0$coefficients[2]
b1hat_1 <- reg1$coefficients[2]
b1hat_2 <- reg2$coefficients[2]
b1hat_0
b1hat_1
b1hat_2
hist(inside(b1hat_0, bins), breaks = bins, col = blue, ylim = c(0, 1), main = "Three b1-hats, n = 20", xlab = "b1-hat")
hist(inside(b1hat_1, bins), breaks = bins, col = orange, add = TRUE)
hist(inside(b1hat_2, bins), breaks = bins, col = purple, add = TRUE)
abline(v = c(beta1_null, beta1_pos, beta1_neg), col = c("steelblue", "darkorange", "purple"), lwd = 3)   # the true slopes

## ---- 3. Repeat each experiment 5000 times ----
sims0 <- many(n, beta1_null)
sims1 <- many(n, beta1_pos)
sims2 <- many(n, beta1_neg)
hist(inside(sims0[, 1], bins), breaks = bins, col = blue, ylim = c(0, 500),
     main = "5000 b1-hats from each world, n = 20", xlab = "b1-hat")
hist(inside(sims1[, 1], bins), breaks = bins, col = orange, add = TRUE)
hist(inside(sims2[, 1], bins), breaks = bins, col = purple, add = TRUE)
abline(v = c(beta1_null, beta1_pos, beta1_neg), col = c("steelblue", "darkorange", "purple"), lwd = 3)
## Blue sits in the middle. Evidence against H0 can point either way: orange to the right, purple to the left.

## ---- 4. The two-sided test: reject H0 if |t| > c ----
crit <- qt(0.975, df = n - 2)            # 5% two-sided critical value: 2.5% in EACH tail
crit
hist(inside(sims0[, 2], tbins), breaks = tbins, freq = FALSE, col = blue, ylim = c(0, 0.45),
     main = "5000 t-statistics from each world, n = 20", xlab = "t = b1-hat / se")
hist(inside(sims1[, 2], tbins), breaks = tbins, freq = FALSE, col = orange, add = TRUE)
hist(inside(sims2[, 2], tbins), breaks = tbins, freq = FALSE, col = purple, add = TRUE)
curve(dt(x, df = n - 2), add = TRUE, lwd = 2)      # H0 true: t has a t distribution with df = n - 2
abline(v = c(-crit, crit), lwd = 3)                # reject H0 outside these lines
mean(sims0[, 2] > crit)          # H0 true: about 2.5% beyond +c ...
mean(sims0[, 2] < -crit)         # ... and about 2.5% beyond -c
mean(abs(sims0[, 2]) > crit)     # together about 5% (alpha, the error rate)
mean(abs(sims1[, 2]) > crit)     # H1 true, slope up: how often the test detects it
mean(abs(sims2[, 2]) > crit)     # H1 true, slope down: detected about as often
## Monday's one-sided cutoff looks only to the right:
crit_one <- qt(0.95, df = n - 2)
mean(sims2[, 2] > crit_one)      # about 0: the one-sided test never catches the purple world
mean(sims1[, 2] > crit_one)      # but it catches orange more often than the two-sided test does

## ---- 5. Larger samples: H0 stays put, orange moves right, purple moves left ----
par(mfrow = c(2, 2))
for (n in c(10, 20, 50, 100)) {
  sims0 <- many(n, beta1_null, reps = 1000)
  sims1 <- many(n, beta1_pos, reps = 1000)
  sims2 <- many(n, beta1_neg, reps = 1000)
  crit <- qt(0.975, df = n - 2)
  reject0 <- round(100 * mean(abs(sims0[, 2]) > crit))
  reject1 <- round(100 * mean(abs(sims1[, 2]) > crit))
  reject2 <- round(100 * mean(abs(sims2[, 2]) > crit))
  hist(inside(sims0[, 2], tbins), breaks = tbins, freq = FALSE, col = blue, ylim = c(0, 0.45), cex.main = 0.9,
       main = paste0("n = ", n, ": rejects ", reject0, "% (H0), ", reject1, "% (up), ", reject2, "% (down)"),
       xlab = "t = b1-hat / se")
  hist(inside(sims1[, 2], tbins), breaks = tbins, freq = FALSE, col = orange, add = TRUE)
  hist(inside(sims2[, 2], tbins), breaks = tbins, freq = FALSE, col = purple, add = TRUE)
  abline(v = c(-crit, crit), lwd = 3)
}
par(mfrow = c(1, 1))
## H0 world: about 5% at every n. Both H1 worlds: rejected more often as n grows, on opposite sides.
