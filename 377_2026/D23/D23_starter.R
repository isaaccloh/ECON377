## >>> GET & SAVE (details in the R guide) -------------------------
## GET, git mode  -> run in the Console:
##   download.file("https://raw.githubusercontent.com/isaaccloh/ECON377/main/377_2026/D23/D23_starter.R", "D23.R")
## GET, easy mode -> copy this file from github.com/isaaccloh/ECON377 (377_2026/D23) into a new script
## SAVE your work -> commit + push D23.R to your own econ377 repo (or upload it on github.com)
## ----------------------------------------------------------------

## ECN 377 - Day 23 STARTER  |  Confidence intervals
## ------------------------------------------------------------------
## CI = beta-hat +/- c * se.  "a inside the CI"  =  fail to reject H0: beta = a.
## Fill the TODO, then upload to GitHub.
## ------------------------------------------------------------------

library(wooldridge)
data("rdchem")

## ---- Demo: confint() and the CI-test duality ----
reg <- lm(log(rd) ~ log(sales) + profmarg, data = rdchem)
confint(reg, level = 0.95)      # KNOW THIS: 95% CI for each coefficient
## Is 1 inside the log(sales) CI? If yes, fail to reject H0: elasticity = 1 at 5%.

## ================= PROBLEMS (your turn) =========================
## beta-hat = 0.30, se = 0.10, use c = 1.96 for a 95% CI
bhat <- 0.30
se <- 0.10
c <- 1.96
lower <- ______   # (a) lower bound   (hint: bhat - c*se)
upper <- ______   # (b) upper bound   (hint: bhat + c*se)
## (c) Is 0 inside [lower, upper]? Do we reject H0: beta = 0 at 5%?   ANSWER:
