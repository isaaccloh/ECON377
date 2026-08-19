## >>> GET & SAVE (details in the R guide) -------------------------
## GET, git mode  -> run in the Console:
##   download.file("https://raw.githubusercontent.com/isaaccloh/ECON377/main/377_2026/D21/D21_starter.R", "D21.R")
## GET, easy mode -> copy this file from github.com/isaaccloh/ECON377 (377_2026/D21) into a new script
## SAVE your work -> commit + push D21.R to your own econ377 repo (or upload it on github.com)
## ----------------------------------------------------------------

## ECN 377 - Day 21 STARTER  |  Two-sided t-tests & p-values
## ------------------------------------------------------------------
## Two-sided: reject if |t| > c.  The Pr(>|t|) column is the p-value for H0: beta = 0.
## Fill the comments, then COMMIT + PUSH.
## ------------------------------------------------------------------

library(wooldridge)

## ---- Demo: p-values straight from summary() ----
data("gpa1")
summary(lm(colGPA ~ hsGPA + ACT + skipped, data = gpa1))$coefficients   # t and Pr(>|t|)

## ---- Demo: test H0: beta = 1 by hand ----
data("campus")
reg  <- lm(log(crime) ~ log(enroll), data = campus)
s    <- summary(reg)$coefficients
tval <- (s["log(enroll)", "Estimate"] - 1) / s["log(enroll)", "Std. Error"]
pval <- 2 * (1 - pt(abs(tval), df = reg$df.residual))
c(tval = tval, pval = pval)

## ================= PROBLEMS (your turn) =========================
## H0: beta = 0 vs H1: beta != 0, alpha = 0.05, c = 1.98
## (a) t = -3.2 : reject? (use |t|)                 ANSWER:
## (b) p = 0.03 : reject at 0.05? at 0.01?           ANSWER:
## (c) In one sentence: what does p = 0.03 mean?     ANSWER:
