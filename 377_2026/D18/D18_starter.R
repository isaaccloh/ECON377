## >>> GET & SAVE (details in the R guide) -------------------------
## GET, git mode  -> run in the Console:
##   download.file("https://raw.githubusercontent.com/isaaccloh/ECON377/main/377_2026/D18/D18_starter.R", "D18.R")
## GET, easy mode -> copy this file from github.com/isaaccloh/ECON377 (377_2026/D18) into a new script
## SAVE your work -> commit + push D18.R to your own econ377 repo (or upload it on github.com)
## ----------------------------------------------------------------

## ECN 377 - Day 18 STARTER  |  Sampling variance & standard errors
## ------------------------------------------------------------------
## The "Std. Error" column of summary() is se(beta-hat): how much beta-hat wobbles.
## Fill the comments, then COMMIT + PUSH.
## ------------------------------------------------------------------

library(wooldridge); data("wage1")

## ---- Demo: read the standard errors ----
## What you're learning: precision lives in the se, not the estimate.
reg <- lm(wage ~ educ + exper, data = wage1)
summary(reg)$coefficients        # Estimate | Std. Error | t value | Pr(>|t|)

## ================= PROBLEMS (your turn) =========================
## Var(beta1-hat) = sigma^2 / SST_X.  Up or down?
## (a) error variance sigma^2 rises          ANSWER:
## (b) sample size n grows (SST_X grows)      ANSWER:
## (c) X barely varies (everyone similar X)   ANSWER:
