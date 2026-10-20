## >>> GET & SAVE (details in the R guide) -------------------------
## GET, git mode  -> run in the Console:
##   download.file("https://raw.githubusercontent.com/isaaccloh/ECON377/main/377_2026/D17/D17_starter.R", "D17.R")
## GET, easy mode -> copy this file from github.com/isaaccloh/ECON377 (377_2026/D17) into a new script
## SAVE your work -> commit + push D17.R to your own econ377 repo (or upload it on github.com)
## ----------------------------------------------------------------

## ECN 377 - Day 17 STARTER  |  MLR mechanics, examples & interpretation
## ------------------------------------------------------------------
## Two variables at once (wage1): slopes and a prediction, then the notes' Examples 3.1 (gpa1) and 3.2 (wage1).
## Fill each ______, then upload to GitHub.
## ------------------------------------------------------------------

library(wooldridge)

## ---- Demo: two variables at once ----
## What you're learning: the educ slope now holds experience fixed (ceteris paribus).
data("wage1")
reg <- lm(wage ~ educ + exper, data = wage1)   # KNOW THIS: add a control with +
reg$coefficients                                # intercept, educ, exper
b <- reg$coefficients
pred_w <- ______                                # predicted wage at educ = 12, exper = 10   (hint: b[[1]] + b[[2]]*12 + b[[3]]*10, as in SLR)

## ---- Demo: Example 3.1 (college GPA) ----
## What you're learning: each slope is a ceteris-paribus effect.
data("gpa1")
lm(colGPA ~ hsGPA + ACT, data = gpa1)$coefficients        # 1.29, 0.45, 0.0094

## ---- Demo: Example 3.2 (log-wage) ----
data("wage1")
lm(log(wage) ~ educ + exper + tenure, data = wage1)$coefficients   # 0.28, 0.092, 0.0041, 0.022

## ================= PROBLEMS (your turn) =========================
## wage-hat = b0 + 0.6*educ + 0.07*exper
w1 <- 0.6
w2 <- 0.07
d_educ  <- ______   # (a) +1 year educ, exper fixed   (hint: w1*1 + w2*0)
d_exper <- ______   # (b) +1 year exper, educ fixed    (hint: w1*0 + w2*1)

## colGPA-hat = 1.29 + 0.45*hsGPA + 0.0094*ACT
b0 <- 1.29
b1 <- 0.45
b2 <- 0.0094
pred     <- ______   # (c) colGPA at hsGPA=3.5, ACT=24   (hint: b0 + b1*3.5 + b2*24)
eff_hsGPA <- ______  # (d) +1 hsGPA, ACT fixed            (hint: b1)
eff_ACT10 <- ______  # (e) +10 ACT, hsGPA fixed           (hint: b2*10)
