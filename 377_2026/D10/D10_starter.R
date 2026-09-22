## >>> GET & SAVE (details in the R guide) -------------------------
## GET, git mode  -> run in the Console:
##   download.file("https://raw.githubusercontent.com/isaaccloh/ECON377/main/377_2026/D10/D10_starter.R", "D10.R")
## GET, easy mode -> copy this file from github.com/isaaccloh/ECON377 (377_2026/D10) into a new script
## SAVE your work -> commit + push D10.R to your own econ377 repo (or upload it on github.com)
## ----------------------------------------------------------------

## ECN 377 - Day 10 STARTER  |  lm(), fitted values, residuals
## ------------------------------------------------------------------
## lm() is the shortcut for the OLS line we derived by hand on Day 9.
## Fill each ______ as we go, then COMMIT + PUSH.
## ------------------------------------------------------------------

library(wooldridge)
data("wage1")

## ---- Fit the regression:  wage on educ ----
reg <- ______        # fit the OLS line:  lm(wage ~ educ, data = wage1)
reg$coefficients     # look: the two estimates  (-0.90 and 0.54, same as Day 9)

## ---- Pull the coefficients out of reg ----
b0 <- ______         # intercept:  reg$coefficients[1]
b1 <- ______         # slope:      reg$coefficients[2]

## ---- Fitted values (predictions) and residuals (misses) ----
yhat <- ______       # fitted values:  reg$fitted.values   (yhat = b0 + b1*educ)
uhat <- ______       # residuals:      reg$residuals        (uhat = wage - yhat)
SSR  <- ______       # sum of squared residuals:  sum(uhat^2)

## ================= YOUR TURN =========================
## Estimated line:  wage-hat = -0.90 + 0.54*educ.   A person: educ = 12, actual wage = 9.0
b0 <- -0.90
b1 <- 0.54
yhat <- ______   # (a) fitted value at educ = 12
uhat <- ______   # (b) residual = actual wage (9.0) - fitted
## (c) Over- or under-predicted? (comment)  ANSWER:
