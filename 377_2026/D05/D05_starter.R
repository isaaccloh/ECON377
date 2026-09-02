## >>> GET & SAVE (details in the R guide) -------------------------
## GET, git mode  -> run in the Console:
##   download.file("https://raw.githubusercontent.com/isaaccloh/ECON377/main/377_2026/D05/D05_starter.R", "D05.R")
## GET, easy mode -> copy this file from github.com/isaaccloh/ECON377 (377_2026/D05) into a new script
## SAVE your work -> commit + push D05.R to your own econ377 repo (or upload it on github.com)
## ----------------------------------------------------------------

## ECN 377 - Day 5  |  nonlinear functions (log/exp) + random variables & expectation.

## --- Nonlinear functions: log & exp  (self-contained demo -- run it and explore!) ---
u <- seq(0.5, 5, by = 0.1)      # a range of positive values
plot(u, log(u), type = "l")     # log: diminishing (flattens out)
plot(u, exp(u), type = "l")     # exp: grows ever faster
exp(log(3))                     # log then exp -> back to 3
log(exp(3))                     # exp then log -> back to 3

## --- Expected value:  E[X] = sum of  value * probability  (we fill this in together) ---
## a random variable's values and their probabilities (the probabilities sum to 1)
x <- ______        # the values          (e.g. a die: 1:6)
p <- ______        # their probabilities
## E[X] is a weighted average: sum of  x * p
______
## E[X^2] weights the SQUARED values: sum of  x^2 * p
______
