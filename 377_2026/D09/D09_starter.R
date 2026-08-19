## >>> GET & SAVE (details in the R guide) -------------------------
## GET, git mode  -> run in the Console:
##   download.file("https://raw.githubusercontent.com/isaaccloh/ECON377/main/377_2026/D09/D09_starter.R", "D09.R")
## GET, easy mode -> copy this file from github.com/isaaccloh/ECON377 (377_2026/D09) into a new script
## SAVE your work -> commit + push D09.R to your own econ377 repo (or upload it on github.com)
## ----------------------------------------------------------------

## ECN 377 - Day 9 STARTER  |  Deriving the OLS estimates
## ------------------------------------------------------------------
## The derivation ends at  beta1-hat = S_xy / S_x^2 = cov(x,y)/var(x).
## Fill the TODO, then COMMIT + PUSH.
## ------------------------------------------------------------------

## ---- Demo: the OLS slope & intercept, by hand ----
## What you're learning: the derived formula is just cov/var in R.
library(wooldridge); data("wage1")
x <- wage1$educ; y <- wage1$wage
b1 <- cov(x, y) / var(x)          # KNOW THIS: beta1-hat = S_xy / S_x^2
b0 <- mean(y) - b1 * mean(x)      # KNOW THIS: beta0-hat = ybar - b1*xbar
c(b0 = b0, b1 = b1)               # -0.90 and 0.54

## ================= PROBLEMS (your turn) =========================
## Tiny dataset:  x = (1,2,3),  y = (2,2,5)
x <- c(1, 2, 3); y <- c(2, 2, 5)
b1    <- ______   # (a) slope       (hint: cov(x, y)/var(x))
b0    <- ______   # (b) intercept   (hint: mean(y) - b1*mean(x))
pred4 <- ______   # (c) predicted y at x = 4  (hint: b0 + b1*4)
