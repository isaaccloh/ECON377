## >>> GET & SAVE (details in the R guide) -------------------------
## GET, git mode  -> run in the Console:
##   download.file("https://raw.githubusercontent.com/isaaccloh/ECON377/main/377_2026/D17/D17_starter.R", "D17.R")
## GET, easy mode -> copy this file from github.com/isaaccloh/ECON377 (377_2026/D17) into a new script
## SAVE your work -> commit + push D17.R to your own econ377 repo (or upload it on github.com)
## ----------------------------------------------------------------

## ECN 377 - Day 17 STARTER  |  MLR: prediction, changes, and two examples
## ------------------------------------------------------------------
## The notes' Examples 3.1 (gpa1) and 3.2 (wage1). Prediction works exactly as in SLR.
## Fill each ______, then upload to GitHub.
## ------------------------------------------------------------------

library(wooldridge)

## ---- Example 3.1: college GPA on high-school GPA and ACT ----
## What you're learning: each slope is a ceteris-paribus effect, and Y-hat is the prediction.
data("gpa1")
reg1 <- ______                                      # KNOW THIS: regress colGPA on hsGPA and ACT (add variables with +)
b <- reg1$coefficients                              # 1.29, 0.45, 0.0094
pred1 <- ______                                     # Y-hat at hsGPA = 3.5, ACT = 24   (hint: b[[1]] + b[[2]]*3.5 + b[[3]]*24)
chg_ACT <- ______                                   # +10 ACT points, hsGPA fixed      (hint: b[[3]] * 10)
lm(colGPA ~ ACT, data = gpa1)$coefficients          # SLR: the ACT slope is much bigger without hsGPA

## ---- Demo: see the regression PLANE (Example 3.1) ----
## What you're learning: with two X's, OLS fits a plane instead of a line. Y-hat is the plane's height.
## First time only, in the Console:  install.packages(c("car", "rgl"))   (Mac: rgl also needs XQuartz)
library(car)
scatter3d(colGPA ~ hsGPA + ACT, data = gpa1, fit = "linear")   # drag to rotate, scroll to zoom

## ---- Example 3.2: log-wage on educ, exper, tenure ----
## What you're learning: predict log(wage), then exp() back to dollars.
data("wage1")
reg2 <- lm(log(wage) ~ educ + exper + tenure, data = wage1)
b <- reg2$coefficients                              # 0.28, 0.092, 0.0041, 0.022
exp(b[[1]] + b[[2]] * 16 + b[[3]] * 4 + b[[4]] * 2) # wage-hat ($) at educ=16, exper=4, tenure=2 (~6.16)
pct_educ <- ______                                  # % change in wage from +1 year educ   (hint: 100 * b[[2]])

## ================= PROBLEMS (your turn) =========================
## wage-hat = b0 + 0.6*educ + 0.07*exper
w1 <- 0.6
w2 <- 0.07
d_educ  <- ______   # (a) +1 year educ, exper fixed    (hint: w1*1 + w2*0)
d_exper <- ______   # (a) +1 year exper, educ fixed    (hint: w1*0 + w2*1)

## (b) colGPA-hat = 1.29 + 0.45*hsGPA + 0.0094*ACT
pred_b <- ______    # (b) colGPA at hsGPA = 3.0, ACT = 30   (hint: 1.29 + 0.45*3.0 + 0.0094*30)

## (c) log(wage)-hat = 0.28 + 0.092*educ + 0.0041*exper + 0.022*tenure
pct_c <- ______     # (c) % change in wage from +4 years educ, exper and tenure fixed   (hint: 100 * 0.092 * 4)
