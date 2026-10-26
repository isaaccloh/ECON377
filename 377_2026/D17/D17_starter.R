## >>> GET & SAVE (details in the R guide) -------------------------
## GET, git mode  -> run in the Console:
##   download.file("https://raw.githubusercontent.com/isaaccloh/ECON377/main/377_2026/D17/D17_starter.R", "D17.R")
## GET, easy mode -> copy this file from github.com/isaaccloh/ECON377 (377_2026/D17) into a new script
## SAVE your work -> commit + push D17.R to your own econ377 repo (or upload it on github.com)
## ----------------------------------------------------------------

## ECN 377 - Day 17 STARTER  |  MLR: prediction and predicted changes
## ------------------------------------------------------------------
## Prediction works exactly as in SLR. (The two examples moved to Day 18.)
## Fill each ______, then upload to GitHub.
## ------------------------------------------------------------------

library(wooldridge)

## ================= PROBLEMS (your turn) =========================
## wage-hat = b0 + 0.6*educ + 0.07*exper
w1 <- 0.6
w2 <- 0.07
d_educ  <- ______   # (a) +1 year educ, exper fixed    (hint: w1*1 + w2*0)
d_exper <- ______   # (a) +1 year exper, educ fixed    (hint: w1*0 + w2*1)

