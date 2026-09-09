## >>> GET & SAVE (details in the R guide) -------------------------
## GET, git mode  -> run in the Console:
##   download.file("https://raw.githubusercontent.com/isaaccloh/ECON377/main/377_2026/D06/D06_starter.R", "D06.R")
## GET, easy mode -> copy this file from github.com/isaaccloh/ECON377 (377_2026/D06) into a new script
## SAVE your work -> commit + push D06.R to your own econ377 repo (or upload it on github.com)
## ----------------------------------------------------------------

## ECN 377 - Day 6 STARTER  |  Expectation properties, variance, covariance, correlation
## ------------------------------------------------------------------
## One idea powers all of today:  weight each value by its probability, then add.
##      E[g(X)] = sum( g(x) * p )
## Fill each ______ as we go in class, then COMMIT + PUSH.
## ------------------------------------------------------------------

## ===== 1. Properties of expectation:  E[aX + bY] = a*E[X] + b*E[Y] =====
## Example: suppose E[X] = 2 and E[Y] = 3.  Find E[4X + 5Y - 3].
EX <- 2
EY <- 3
______              # E[4X + 5Y - 3]    -- use linearity; E[constant] = the constant

## ===== 2. Variance & standard deviation:  Var(X) = E[X^2] - E[X]^2 =====
## A coin in {0, 1}, each face with probability 1/2.
x <- ______         # the values           -- the two faces
p <- ______         # their probabilities   -- must sum to 1
EX  <- ______       # E[X]                  -- weight & add:  sum(x * p)
EX2 <- ______       # E[X^2]                -- same idea, weight x^2
VarX <- ______      # Var(X) = E[X^2] - E[X]^2
sdX  <- ______      # sd(X)                 -- square root of the variance

## ===== 3. Covariance:  Cov(X,Y) = E[XY] - E[X]*E[Y] =====
## Two INDEPENDENT coin flips.  The four (x, y) pairs, each with probability 1/4:
xj <- ______        # x across pairs (0,0) (0,1) (1,0) (1,1)
yj <- ______        # y across those same pairs
pj <- ______        # probability of each pair
EXY <- ______       # E[XY]                 -- same idea, weight xj*yj
CovXY <- ______     # Cov = E[XY] - E[X]*E[Y]    -- independent, so expect 0

## ===== 4. Correlation:  Cor(X,Y) = Cov(X,Y) / ( sd(X) * sd(Y) ) =====
## Unitless; always between -1 and 1.   (Remember: correlation is NOT causation.)
______              # Cor(X, Y)             -- here sd(X) = sd(Y) = 0.5

## ================= YOUR TURN =========================
## X takes values 1, 2, 3 with probabilities 0.2, 0.5, 0.3.
x <- ______; p <- ______
EX   <- ______      # (a) E[X]
EX2  <- ______      # (b) E[X^2]
VarX <- ______      # (c) Var(X) = E[X^2] - E[X]^2
