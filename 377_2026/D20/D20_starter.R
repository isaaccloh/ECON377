## >>> GET & SAVE (details in the R guide) -------------------------
## GET, git mode  -> run in the Console:
##   download.file("https://raw.githubusercontent.com/isaaccloh/ECON377/main/377_2026/D20/D20_starter.R", "D20.R")
## GET, easy mode -> copy this file from github.com/isaaccloh/ECON377 (377_2026/D20) into a new script
## SAVE your work -> commit + push D20.R to your own econ377 repo (or upload it on github.com)
## ----------------------------------------------------------------

## ECN 377 - Day 20 STARTER  |  Omitted-variable bias (Table 3.2);  variances & standard errors
## ------------------------------------------------------------------
## Omitted-variable bias = (effect of the omitted variable) x (its link to the included one).
## Fill each ______ and ANSWER, then upload to GitHub.
## ------------------------------------------------------------------

library(wooldridge)
data("wage1")

## ---- Table 3.2 in data (wage1): omit exper ----
## MLR: wage on educ and exper (sign of the exper slope?)


## correlation of educ and exper (sign?)


## SLR: wage on educ (bigger or smaller educ slope?)


## ---- Demo: read the standard errors ----
## What you're learning: precision lives in the se, not the estimate.
reg <- lm(wage ~ educ + exper, data = wage1)
summary(reg)$coefficients        # Estimate | Std. Error | t value | Pr(>|t|)

## ================= PROBLEMS (your turn) =========================
## (a) b2 > 0 and delta1 > 0: SLR slope biased up or down?   ANSWER:
## (b) b2 > 0 and delta1 < 0: which way?                     ANSWER:
## (c) When is there NO omitted-variable bias?               ANSWER:
## Var(beta1-hat) = sigma^2 / SST_X.  Up or down?
## (d) error variance sigma^2 rises          ANSWER:
## (e) sample size n grows (SST_X grows)      ANSWER:
## (f) X barely varies (everyone similar X)   ANSWER:
