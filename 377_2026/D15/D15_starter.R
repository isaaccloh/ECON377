## >>> GET & SAVE (details in the R guide) -------------------------
## GET, git mode  -> run in the Console:
##   download.file("https://raw.githubusercontent.com/isaaccloh/ECON377/main/377_2026/D15/D15_starter.R", "D15.R")
## GET, easy mode -> copy this file from github.com/isaaccloh/ECON377 (377_2026/D15) into a new script
## SAVE your work -> commit + push D15.R to your own econ377 repo (or upload it on github.com)
## ----------------------------------------------------------------

## ECN 377 - Day 15 STARTER  |  The multiple regression model
## ------------------------------------------------------------------
## Add variables with + in the formula. Each slope holds the OTHERS fixed.
## Fill the TODO, then COMMIT + PUSH.
## ------------------------------------------------------------------

library(wooldridge); data("wage1")

## ---- Demo: two variables at once ----
## What you're learning: the educ slope now holds experience fixed (ceteris paribus).
reg <- lm(wage ~ educ + exper, data = wage1)   # KNOW THIS: add a control with +
reg$coefficients                                # intercept, educ, exper

## ================= PROBLEMS (your turn) =========================
## wage-hat = b0 + 0.6*educ + 0.07*exper
b1 <- 0.6; b2 <- 0.07
d_educ  <- ______   # (a) +1 year educ, exper fixed   (hint: b1*1 + b2*0)
d_exper <- ______   # (b) +1 year exper, educ fixed    (hint: b1*0 + b2*1)
d_both  <- ______   # (c) +1 year of BOTH              (hint: b1*1 + b2*1)
