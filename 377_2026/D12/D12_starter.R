## >>> GET & SAVE (details in the R guide) -------------------------
## GET, git mode  -> run in the Console:
##   download.file("https://raw.githubusercontent.com/isaaccloh/ECON377/main/377_2026/D12/D12_starter.R", "D12.R")
## GET, easy mode -> copy this file from github.com/isaaccloh/ECON377 (377_2026/D12) into a new script
## SAVE your work -> commit + push D12.R to your own econ377 repo (or upload it on github.com)
## ----------------------------------------------------------------

## ECN 377 - Day 12 STARTER  |  R^2
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

## ================= PROBLEMS (your turn) =========================
## A regression has SST = 200 and SSR = 150.
SST0 <- 200
SSR0 <- 150
SSE0 <- ______   # (a) explained sum of squares
R20  <- ______   # (b) R^2
unex <- ______   # (c) fraction of the variation UNEXPLAINED
