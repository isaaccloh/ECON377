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
## What you're learning: b1-hat varies from sample to sample (Theorem 4.1: it is normal around beta1).
## Divide (b1-hat - beta1) by its sd and you get N(0,1). Divide by its se (estimated) and you get
## a t distribution with df = n - K - 1 (Theorem 4.2): a bit wider, because the se is noisy too.
## Run it one section at a time.

set.seed(377)
beta0 <- 1          # TRUE intercept
beta1 <- 2          # TRUE slope
sigma <- 3          # sd of U
n <- 5              # a SMALL sample, so t and normal look different (df = n - 2 = 3)
x <- runif(n, min = 0, max = 10)      # the x values, held FIXED in every sample
SST_x <- sum((x - mean(x))^2)
sd_b1 <- sigma / sqrt(SST_x)          # the TRUE sd of b1-hat (Theorem 2.2)

## ---- 1. One sample: the data and its OLS line ----
y <- beta0 + beta1 * x + rnorm(n, mean = 0, sd = sigma)
reg <- lm(y ~ x)
plot(x, y, main = "One sample and its OLS line")
abline(reg, col = "blue", lwd = 2)                            # this sample's line
abline(a = beta0, b = beta1, col = "red", lty = 2, lwd = 2)   # the TRUE line

## ---- 2. This sample's estimate, its se, and its t ----
b1 <- summary(reg)$coefficients[2, 1]       # b1-hat
se <- summary(reg)$coefficients[2, 2]       # se(b1-hat): uses sigma-hat, not sigma
c(b1hat = b1, se = se, sd = sd_b1)          # the se is only an ESTIMATE of the sd
(b1 - beta1) / se                           # this sample's t

## ---- 3. Repeat 5000 times: the sampling distribution of b1-hat ----
reps <- 5000
b1hat <- numeric(reps)
se_b1 <- numeric(reps)
for (r in 1:reps) {
  y <- beta0 + beta1 * x + rnorm(n, mean = 0, sd = sigma)
  s <- summary(lm(y ~ x))$coefficients
  b1hat[r] <- s[2, 1]
  se_b1[r] <- s[2, 2]
}
hist(b1hat, breaks = 40, col = "gray", main = "5000 values of b1-hat", xlab = "b1-hat")
abline(v = beta1, col = "red", lwd = 3)     # centered at the truth (unbiased)
c(mean = mean(b1hat), sd = sd(b1hat), theory = sd_b1)

## ---- 4. Normalize: divide by the sd vs. by the se ----
z <- (b1hat - beta1) / sd_b1                # known sd    -> N(0,1)       (Theorem 4.1)
t <- (b1hat - beta1) / se_b1                # estimated se -> t, df = n - 2 (Theorem 4.2)
hist(t[abs(t) < 6], breaks = 48, freq = FALSE, col = "lightblue",      # drops the ~1% of extreme values
     main = "(b1-hat - beta1) / se", xlab = "t")
curve(dnorm(x), add = TRUE, lwd = 2, lty = 2)                  # N(0,1): too thin in the tails
curve(dt(x, df = n - 2), add = TRUE, col = "red", lwd = 2)     # t with n - 2 df: fits
legend("topright", c("N(0,1)", "t, df = n - 2"), lty = c(2, 1), col = c("black", "red"), lwd = 2)
mean(abs(z) > 1.96)                         # ~ 0.05: 1.96 works when you KNOW the sd
mean(abs(t) > 1.96)                         # ~ 0.14: too many "surprises" with the se
mean(abs(t) > qt(0.975, df = n - 2))        # ~ 0.05: the t cutoff (3.18 with df = 3) fixes it

## ---- 5. Play with n ----
## Set n <- 30 at the top, rerun everything: the se gets accurate, the t looks normal, and qt(0.975, 28) = 2.05 is near 1.96.

