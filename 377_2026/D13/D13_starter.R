## >>> GET & SAVE (details in the R guide) -------------------------
## GET, git mode  -> run in the Console:
##   download.file("https://raw.githubusercontent.com/isaaccloh/ECON377/main/377_2026/D13/D13_starter.R", "D13.R")
## GET, easy mode -> copy this file from github.com/isaaccloh/ECON377 (377_2026/D13) into a new script
## SAVE your work -> commit + push D13.R to your own econ377 repo (or upload it on github.com)
## ----------------------------------------------------------------

## ECN 377 - Day 13 STARTER  |  Units of measurement;  logs & functional form
## ------------------------------------------------------------------
## Each ______ comment gives the MATH + a hint at the code; you write the command.
## Logs: wrap a variable in log() inside the formula; read the slope with Table 2.3.
## Fill each ______ as we go, then upload to GitHub.
## ------------------------------------------------------------------

library(wooldridge)

## ---- Units of measurement   (Example 2.3: salary on roe, salary in $1000s) ----
data("ceosal1")
reg3 <- ______        # regress salary on roe                         (963.19 and 18.50)
ceosal1$salarydol <- ______   # salary in DOLLARS:  Y x 1000          (hint: 1000 * the salary column)
______                # regress salarydol on roe: both estimates x 1000?  (look at $coefficients)
ceosal1$roedec <- ______      # roe as a DECIMAL:   X x 1/100         (hint: the roe column / 100)
______                # regress salary on roedec: slope x 100, intercept unchanged?
______                # R^2 of reg3 -- same for all three regressions  (hint: summary(...)$r.squared)

## ---- Demo: log-level (Example 2.10) ----
## What you're learning: log(y) on x  ->  slope is a PERCENT change in y.
data("wage1")
lm(log(wage) ~ educ, data = wage1)$coefficients      # 0.584, 0.083 (~8.3% per year)

## ---- Demo: log-log / constant elasticity (Example 2.11) ----
## What you're learning: log(y) on log(x)  ->  slope is an ELASTICITY.
lm(log(salary) ~ log(sales), data = ceosal1)$coefficients   # 4.822, 0.257

## ================= PROBLEMS (your turn) =========================
## log-level model:  log(wage)-hat = 0.58 + 0.08*educ
b1 <- 0.08
pct_1yr <- ______   # (a) % change in wage from +1 year of school  (hint: 100*b1)
pct_4yr <- ______   # (b) % change from +4 years                   (hint: 100*b1*4)
## (c) In a log-log model, the slope is called a(n) ______  (comment)
