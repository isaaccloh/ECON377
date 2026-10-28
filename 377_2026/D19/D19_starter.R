## >>> GET & SAVE (details in the R guide) -------------------------
## GET, git mode  -> run in the Console:
##   download.file("https://raw.githubusercontent.com/isaaccloh/ECON377/main/377_2026/D19/D19_starter.R", "D19.R")
## GET, easy mode -> copy this file from github.com/isaaccloh/ECON377 (377_2026/D19) into a new script
## SAVE your work -> commit + push D19.R to your own econ377 repo (or upload it on github.com)
## ----------------------------------------------------------------

## ECN 377 - Day 19 STARTER  |  Example 3.1;  omitted-variable bias (3.23);  sampling variance & standard errors
## ------------------------------------------------------------------
## Type the examples along with class. Fill each ______ and ANSWER in the problems, then upload to GitHub.
## ------------------------------------------------------------------

library(wooldridge)

## ---- Example 3.1 (gpa1): colGPA on ACT and hsGPA ----
## regress; change in colGPA-hat from +10 ACT, hsGPA fixed


## compare: the SLR of colGPA on ACT


## the regression plane (first time only, in the Console: install.packages(c("car", "rgl")); Mac: rgl also needs XQuartz)
library(car)
scatter3d(colGPA ~ ACT + hsGPA, data = gpa1, fit = "linear")   # drag to rotate, scroll to zoom

## ---- Omitted-variable bias (Example 3.3, gpa1) ----
## delta1: regress hsGPA (omitted) on ACT (included)


## check (3.23): SLR slope = MLR slope + (hsGPA slope) * delta1


## ---- Demo: read the standard errors ----
## What you're learning: precision lives in the se, not the estimate.
data("wage1")
reg <- lm(wage ~ educ + exper, data = wage1)
summary(reg)$coefficients        # Estimate | Std. Error | t value | Pr(>|t|)

## ================= PROBLEMS (your turn) =========================
## (a) colGPA-hat = 1.29 + 0.0094*ACT + 0.453*hsGPA
pred_a <- ______    # (a) colGPA at ACT = 30, hsGPA = 3.0   (hint: 1.29 + 0.0094*30 + 0.453*3.0)
## (b) b2 > 0 and delta1 > 0: SLR slope biased up or down?   ANSWER:
## (c) b2 > 0 and delta1 < 0: which way?                     ANSWER:
## (d) When is there NO omitted-variable bias?               ANSWER:
## Var(beta1-hat) = sigma^2 / SST_X.  Up or down?
## (e) error variance sigma^2 rises          ANSWER:
## (f) sample size n grows (SST_X grows)      ANSWER:
## (g) X barely varies (everyone similar X)   ANSWER:
