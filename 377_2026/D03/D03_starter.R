## >>> GET & SAVE (details in the R guide) -------------------------
## GET, git mode  -> run in the Console:
##   download.file("https://raw.githubusercontent.com/isaaccloh/ECON377/main/377_2026/D03/D03_starter.R", "D03.R")
## GET, easy mode -> copy this file from github.com/isaaccloh/ECON377 (377_2026/D03) into a new script
## SAVE your work -> commit + push D03.R to your own econ377 repo (or upload it on github.com)
## ----------------------------------------------------------------

## ECN 377 - Day 3  |  ceteris paribus + percentages.   (we fill this in together)

## --- Example A.2:  quantity = 120 - 9.8*price + 0.03*income ---
## the two slopes:
b1 <- ______        # slope on price    (hint: -9.8)
b2 <- ______        # slope on income   (hint:  0.03)
## price up $1, income held fixed  ->  change in quantity?
______              # hint: b1*1 + b2*0
## price DOWN $2 and income UP $300  ->  change in quantity?
______              # hint: b1*(-2) + b2*300

## --- Percentages ---
## turn the proportion 0.250 into a percent:
______              # hint: 0.250 * 100
## percent change when x goes 54 -> 57:
______              # hint: (57 - 54) / 54 * 100
## percentage-POINT change 54 -> 57 (just the difference):
______              # hint: 57 - 54

## ================= PROBLEMS (your turn) =========================
pct_chg <- ______   # (a) percent change from $20 to $25   (hint: (25-20)/20*100)
## (b) interest rate 3% -> 5%: percentage-POINT change = ___ ; percent change = ___   (comment)
