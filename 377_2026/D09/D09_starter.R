## >>> GET & SAVE (details in the R guide) -------------------------
## GET, git mode  -> run in the Console:
##   download.file("https://raw.githubusercontent.com/isaaccloh/ECON377/main/377_2026/D09/D09_starter.R", "D09.R")
## GET, easy mode -> copy this file from github.com/isaaccloh/ECON377 (377_2026/D09) into a new script
## SAVE your work -> commit + push D09.R to your own econ377 repo (or upload it on github.com)
## ----------------------------------------------------------------

## ECN 377 - Day 9 STARTER  |  Deriving the OLS estimates
## ------------------------------------------------------------------
## The derivation ends at  beta1-hat = cov(x,y)/var(x),  beta0-hat = ybar - beta1*xbar.
## Fill each ______ as we go, then COMMIT + PUSH.
## ------------------------------------------------------------------

## ---- Demo: estimate the wage-education line, by hand ----
library(wooldridge)
data("wage1")
x <- wage1$educ     # X = education
y <- wage1$wage     # Y = wage
b1 <- ______        # slope      -- the derived formula:  cov(x, y) / var(x)
b0 <- ______        # intercept  -- mean(y) - b1 * mean(x)
c(b0 = b0, b1 = b1) # the fitted line  (should be about -0.90 and 0.54)

## ================= YOUR TURN =========================
## Tiny dataset:  x = (1, 2, 3),  y = (2, 2, 5)
x <- c(1, 2, 3)
y <- c(2, 2, 5)
b1    <- ______   # (a) slope
b0    <- ______   # (b) intercept
pred4 <- ______   # (c) predicted y at x = 4
