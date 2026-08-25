## >>> GET & SAVE (details in the R guide) -------------------------
## GET, git mode  -> run in the Console:
##   download.file("https://raw.githubusercontent.com/isaaccloh/ECON377/main/377_2026/D03/D03_starter.R", "D03.R")
## GET, easy mode -> copy this file from github.com/isaaccloh/ECON377 (377_2026/D03) into a new script
## SAVE your work -> commit + push D03.R to your own econ377 repo (or upload it on github.com)
## ----------------------------------------------------------------

## ECN 377 - Day 3  |  ceteris paribus example + percentages.

## Example A.2:  quantity = 120 - 9.8*price + 0.03*income
b1 <- -9.8; b2 <- 0.03
b1 * 1 + b2 * 0                 # price up $1, income fixed     -> -9.8
b1 * (-2) + b2 * 300            # price down $2, income up $300 -> 28.6

## Percentages
0.250 * 100                     # a proportion -> percent  (0.250 -> 25%)
(57 - 54) / 54 * 100            # percent change 54 -> 57   -> 5.56%
57 - 54                         # percentage-POINT change   -> 3 p.p.

## ================= PROBLEMS (your turn) =========================
pct_chg <- ______     # (a) percent change from $20 to $25   (hint: (25-20)/20*100)
## (b) an interest rate 3% -> 5%: percentage-POINT change = ___ ; percent change = ___  (comment)
