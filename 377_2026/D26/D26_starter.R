## >>> GET & SAVE (details in the R guide) -------------------------
## GET, git mode  -> run in the Console:
##   download.file("https://raw.githubusercontent.com/isaaccloh/ECON377/main/377_2026/D26/D26_starter.R", "D26.R")
## GET, easy mode -> copy this file from github.com/isaaccloh/ECON377 (377_2026/D26) into a new script
## SAVE your work -> commit + push D26.R to your own econ377 repo (or upload it on github.com)
## ----------------------------------------------------------------

## ECN 377 - Day 26 STARTER  |  Confidence intervals; the F-test (joint significance)
## ------------------------------------------------------------------
## CI = beta-hat +/- c * se.  "a inside the CI"  =  fail to reject H0: beta = a.
## The F-test asks whether a GROUP of variables jointly matters; anova(restricted, full) does it.
## Fill each ______ and ANSWER, then upload to GitHub.
## ------------------------------------------------------------------

library(wooldridge)

## ---- Demo: confint() and the CI-test duality ----
data("rdchem")
reg <- lm(log(rd) ~ log(sales) + profmarg, data = rdchem)
confint(reg, level = 0.95)      # KNOW THIS: 95% CI for each coefficient
## Is 1 inside the log(sales) CI? If yes, fail to reject H0: elasticity = 1 at 5%.

## ---- Demo: do batting stats jointly matter? ----
## What you're learning: variables weak on their own t-tests can matter as a group.
data("mlb1")
ur <- lm(log(salary) ~ years + gamesyr + bavg + hrunsyr + rbisyr, data = mlb1)  # full
r  <- lm(log(salary) ~ years + gamesyr, data = mlb1)                             # drop 3 stats
anova(r, ur)                     # KNOW THIS: F-test comparing nested models
summary(ur)$fstatistic           # overall-significance F

## ================= PROBLEMS (your turn) =========================
## beta-hat = 0.30, se = 0.10, use c = 1.96 for a 95% CI
bhat <- 0.30
se <- 0.10
c <- 1.96
lower <- ______   # (a) lower bound   (hint: bhat - c*se)
upper <- ______   # (a) upper bound   (hint: bhat + c*se)
## (b) Is 0 inside [lower, upper]? Do we reject H0: beta = 0 at 5%?   ANSWER:

## SSR_r = 198, SSR_ur = 183, q = 3 restrictions, df = n-k-1 = 347
SSR_r <- 198
SSR_ur <- 183
q <- 3
df <- 347
Fstat <- ______   # (c) F  (hint: ((SSR_r - SSR_ur)/q) / (SSR_ur/df))
## (d) c = qf(0.95, 3, 347) ~ 2.63.  Reject H0 (do the 3 variables jointly matter)?  ANSWER:
