## >>> GET & SAVE (details in the R guide) -------------------------
## GET, git mode  -> run in the Console:
##   download.file("https://raw.githubusercontent.com/isaaccloh/ECON377/main/377_2026/D21/D21_starter.R", "D21.R")
## GET, easy mode -> copy this file from github.com/isaaccloh/ECON377 (377_2026/D21) into a new script
## SAVE your work -> commit + push D21.R to your own econ377 repo (or upload it on github.com)
## ----------------------------------------------------------------

## ECN 377 - Day 21 STARTER  |  Estimating sigma^2;  standard errors;  Gauss-Markov
## ------------------------------------------------------------------
## se(b_j) = sigma-hat / sqrt(SST_j * (1 - R_j^2)): every piece by hand, then check summary().
## Type along with class, then upload to GitHub.
## ------------------------------------------------------------------

library(wooldridge)
data("wage1")

## ---- A standard error by hand: se(educ) in wage ~ educ + exper ----
## regress wage on educ and exper; find educ's "Std. Error" in summary()


## df = n - K - 1   (n from nrow(); K = 2)


## sigma-hat = sqrt(SSR / df)


## SST_j for educ


## R_j^2: regress educ on the other x, then take the R-squared


## se(educ) = sigma-hat / sqrt(SST_j * (1 - R_j^2)); does it match summary()?
