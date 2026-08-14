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
