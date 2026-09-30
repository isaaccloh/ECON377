## >>> GET & SAVE (details in the R guide) -------------------------
## GET, git mode  -> run in the Console:
##   download.file("https://raw.githubusercontent.com/isaaccloh/ECON377/main/377_2026/D12/D12_starter.R", "D12.R")
## GET, easy mode -> copy this file from github.com/isaaccloh/ECON377 (377_2026/D12) into a new script
## SAVE your work -> commit + push D12.R to your own econ377 repo (or upload it on github.com)
## ----------------------------------------------------------------

## ECN 377 - Day 12 STARTER  |  R^2;  units of measurement
## ------------------------------------------------------------------
## Each ______ comment gives the MATH + a hint at the code; you write the command.
## Fill each ______ as we go, then upload to GitHub.
## ------------------------------------------------------------------

library(wooldridge)

## ---- SST = SSE + SSR, and R^2   (bwght ~ cigs) ----
data("bwght")
reg2 <- ______   # regress bwght on cigs
SST <- ______    # total variation:   squared deviations of bwght from its mean, summed
SSR <- ______    # unexplained:       squared residuals of reg2, summed
SSE <- ______    # explained:         SST - SSR
R2  <- ______    # R^2 = SSE / SST    (~ 0.02: low is normal)

## ---- Units of measurement   (Example 2.3: salary on roe, salary in $1000s) ----
data("ceosal1")
reg3 <- ______        # regress salary on roe                         (963.19 and 18.50)
ceosal1$salarydol <- ______   # salary in DOLLARS:  Y x 1000          (hint: 1000 * the salary column)
______                # regress salarydol on roe: both estimates x 1000?  (look at $coefficients)
ceosal1$roedec <- ______      # roe as a DECIMAL:   X x 1/100         (hint: the roe column / 100)
______                # regress salary on roedec: slope x 100, intercept unchanged?
______                # R^2 of reg3 -- same for all three regressions  (hint: summary(...)$r.squared)

## ================= PROBLEMS (your turn) =========================
## A regression has SST = 200 and SSR = 150.
SST0 <- 200
SSR0 <- 150
SSE0 <- ______   # (a) explained sum of squares
R20  <- ______   # (b) R^2
unex <- ______   # (c) fraction of the variation UNEXPLAINED
