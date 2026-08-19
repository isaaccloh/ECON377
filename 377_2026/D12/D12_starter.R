## >>> GET & SAVE (details in the R guide) -------------------------
## GET, git mode  -> run in the Console:
##   download.file("https://raw.githubusercontent.com/isaaccloh/ECON377/main/377_2026/D12/D12_starter.R", "D12.R")
## GET, easy mode -> copy this file from github.com/isaaccloh/ECON377 (377_2026/D12) into a new script
## SAVE your work -> commit + push D12.R to your own econ377 repo (or upload it on github.com)
## ----------------------------------------------------------------

## ECN 377 - Day 12 STARTER  |  Logs & functional form
## ------------------------------------------------------------------
## Wrap a variable in log() inside the formula; read the slope with Table 2.3.
## Fill the TODO, then COMMIT + PUSH.
## ------------------------------------------------------------------

library(wooldridge)

## ---- Demo: log-level (Example 2.10) ----
## What you're learning: log(y) on x  ->  slope is a PERCENT change in y.
data("wage1")
lm(log(wage) ~ educ, data = wage1)$coefficients      # 0.584, 0.083 (~8.3% per year)

## ---- Demo: log-log / constant elasticity (Example 2.11) ----
## What you're learning: log(y) on log(x)  ->  slope is an ELASTICITY.
data("ceosal1")
lm(log(salary) ~ log(sales), data = ceosal1)$coefficients   # 4.822, 0.257

## ================= PROBLEMS (your turn) =========================
## log-level model:  log(wage)-hat = 0.58 + 0.08*educ
b1 <- 0.08
pct_1yr <- ______   # (a) % change in wage from +1 year of school  (hint: 100*b1)
pct_4yr <- ______   # (b) % change from +4 years                   (hint: 100*b1*4)
## (c) In a log-log model, the slope is called a(n) ______  (comment)
