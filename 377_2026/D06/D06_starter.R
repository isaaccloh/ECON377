## >>> GET & SAVE (details in the R guide) -------------------------
## GET, git mode  -> run in the Console:
##   download.file("https://raw.githubusercontent.com/isaaccloh/ECON377/main/377_2026/D06/D06_starter.R", "D06.R")
## GET, easy mode -> copy this file from github.com/isaaccloh/ECON377 (377_2026/D06) into a new script
## SAVE your work -> commit + push D06.R to your own econ377 repo (or upload it on github.com)
## ----------------------------------------------------------------

## ECN 377 - Day 6 STARTER  |  Population expectation, variance, covariance & correlation
## ------------------------------------------------------------------
## The "weight by the probabilities and add" method (die/coin tables).
## Fill the TODO, then COMMIT + PUSH.
## ------------------------------------------------------------------

## ---- Demo: E[X] and Var(X) from a probability table ----
## What you're learning: E[X] = sum(x * p);  Var(X) = E[X^2] - E[X]^2.
x <- 1:6                          # a fair die
p <- rep(1/6, 6)                  # each face has probability 1/6
sum(x * p)                        # KNOW THIS: E[X] = 3.5
sum(x^2 * p)                      # E[X^2] = 91/6
sum(x^2 * p) - sum(x * p)^2       # Var(X) = E[X^2] - E[X]^2

## A coin in {0,1}:
x <- c(0, 1); p <- c(0.5, 0.5)
sum(x * p)                        # E[X] = 1/2
______                            # TODO: Var(X) via E[X^2]-E[X]^2  (hint: sum(x^2*p)-sum(x*p)^2)

## ================= PROBLEMS (your turn) =========================
## X takes values 1,2,3 with probabilities 0.2, 0.5, 0.3.
x <- c(1, 2, 3); p <- c(0.2, 0.5, 0.3)
EX   <- ______     # (a) E[X]                 (hint: sum(x*p))
EX2  <- ______     # (b) E[X^2]               (hint: sum(x^2*p))
VarX <- ______     # (c) Var(X) = E[X^2]-E[X]^2

## ---- Covariance from a joint table:  Cov(X,Y) = E[XY] - E[X]*E[Y] ----
## Two INDEPENDENT coin flips (X, Y in {0,1}); each (x,y) pair has probability 1/4.
xj <- c(0, 0, 1, 1)
yj <- c(0, 1, 0, 1)
pj <- rep(1/4, 4)                 # joint probability of each (x, y) pair
EXj  <- sum(xj * pj)              # E[X]
EYj  <- sum(yj * pj)              # E[Y]
EXYj <- sum(xj * yj * pj)         # E[XY]
CovXY <- ______                   # TODO: Cov(X,Y) = E[XY] - E[X]*E[Y]   (independent -> expect 0)

## A DEPENDENT pair that moves together: (x,y) = (0,0) or (1,1), each with prob 1/2.
xd <- c(0, 1); yd <- c(0, 1); pd <- c(0.5, 0.5)
sum(xd*yd*pd) - sum(xd*pd)*sum(yd*pd)   # Cov > 0  (they rise together)
## Correlation = Cov / (sd(X)*sd(Y)) is the unitless version, always in [-1, 1].
