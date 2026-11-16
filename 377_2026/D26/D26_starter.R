## >>> GET & SAVE (details in the R guide) -------------------------
## GET, git mode  -> run in the Console:
##   download.file("https://raw.githubusercontent.com/isaaccloh/ECON377/main/377_2026/D26/D26_starter.R", "D26.R")
## GET, easy mode -> copy this file from github.com/isaaccloh/ECON377 (377_2026/D26) into a new script
## SAVE your work -> commit + push D26.R to your own econ377 repo (or upload it on github.com)
## ----------------------------------------------------------------

## ECN 377 - Day 26 STARTER  |  p-values; confidence intervals
## ------------------------------------------------------------------
## The Pr(>|t|) column is the two-sided p-value for H0: beta = 0.  Reject at level alpha if p < alpha.
## CI = beta-hat +/- c * se.  "a inside the CI"  =  fail to reject H0: beta = a.
## Fill each ______ and ANSWER, then upload to GitHub.
## ------------------------------------------------------------------

library(wooldridge)

## ---- Demo: p-values straight from summary() ----
data("gpa1")
summary(lm(colGPA ~ hsGPA + ACT + skipped, data = gpa1))$coefficients   # t and Pr(>|t|)

## ---- Demo: the p-value for H0: beta = 1, by hand ----
data("campus")
reg <- lm(log(crime) ~ log(enroll), data = campus)
s <- summary(reg)$coefficients
tval <- (s[2, 1] - 1) / s[2, 2]                    # row 2 = log(enroll); column 1 estimate, column 2 se
pval <- 2 * (1 - pt(abs(tval), df = reg$df.residual))
tval
pval

## ---- Demo: confint() and the CI-test duality ----
data("rdchem")
reg <- lm(log(rd) ~ log(sales) + profmarg, data = rdchem)
confint(reg, level = 0.95)      # KNOW THIS: 95% CI for each coefficient
## Is 1 inside the log(sales) CI? If yes, fail to reject H0: elasticity = 1 at 5%.

## ================= PROBLEMS (your turn) =========================
## (a) p = 0.03 : reject at 0.05? at 0.01?           ANSWER:
##     In one sentence: what does p = 0.03 mean?     ANSWER:

## beta-hat = 0.30, se = 0.10, use c = 1.96 for a 95% CI
bhat <- 0.30
se <- 0.10
c <- 1.96
lower <- ______   # (b) lower bound   (hint: bhat - c*se)
upper <- ______   # (b) upper bound   (hint: bhat + c*se)
## (c) Is 0 inside [lower, upper]? Do we reject H0: beta = 0 at 5%?   ANSWER:
