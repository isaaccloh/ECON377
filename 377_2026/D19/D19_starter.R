## ECN 377 - Day 19 STARTER  |  Gauss-Markov, normality, the t-statistic
## ------------------------------------------------------------------
## The t-statistic = estimate / se = "how many standard errors from zero."
## Fill the TODO, then COMMIT + PUSH.
## ------------------------------------------------------------------

library(wooldridge); data("wage1")

## ---- Demo: the t-statistic ----
## What you're learning: the "t value" column is beta-hat / se.
reg <- lm(wage ~ educ, data = wage1)
s <- summary(reg)$coefficients
s                                        # Estimate | Std. Error | t value | Pr(>|t|)
s[, "Estimate"] / s[, "Std. Error"]      # = the "t value" column

## ================= PROBLEMS (your turn) =========================
## An estimate beta-hat = 0.54 with se = 0.05.
bhat <- 0.54; se <- 0.05
tstat <- ______   # (a) t = beta-hat / se   (hint: bhat/se)
## (b) Is |t| big (far from 0)?              ANSWER:
## (c) What null hypothesis does this t test? ANSWER:
