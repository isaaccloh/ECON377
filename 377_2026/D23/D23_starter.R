## >>> GET & SAVE (details in the R guide) -------------------------
## GET, git mode  -> run in the Console:
##   download.file("https://raw.githubusercontent.com/isaaccloh/ECON377/main/377_2026/D23/D23_starter.R", "D23.R")
## GET, easy mode -> copy this file from github.com/isaaccloh/ECON377 (377_2026/D23) into a new script
## SAVE your work -> commit + push D23.R to your own econ377 repo (or upload it on github.com)
## ----------------------------------------------------------------

## ECN 377 - Day 23 STARTER  |  The F-test (joint significance)
## ------------------------------------------------------------------
## F-test asks whether a GROUP of variables jointly matters.
## anova(restricted, full) does it.  Fill the TODO, then COMMIT + PUSH.
## ------------------------------------------------------------------

library(wooldridge); data("mlb1")

## ---- Demo: do batting stats jointly matter? ----
## What you're learning: variables weak on their own t-tests can matter as a group.
ur <- lm(log(salary) ~ years + gamesyr + bavg + hrunsyr + rbisyr, data = mlb1)  # full
r  <- lm(log(salary) ~ years + gamesyr, data = mlb1)                             # drop 3 stats
anova(r, ur)                     # KNOW THIS: F-test comparing nested models
summary(ur)$fstatistic           # overall-significance F

## ================= PROBLEMS (your turn) =========================
## SSR_r = 198, SSR_ur = 183, q = 3 restrictions, df = n-k-1 = 347
SSR_r <- 198; SSR_ur <- 183; q <- 3; df <- 347
Fstat <- ______   # (a) F  (hint: ((SSR_r - SSR_ur)/q) / (SSR_ur/df))
## (b) c = qf(0.95, 3, 347) ~ 2.63.  Reject H0 (do the 3 variables jointly matter)?  ANSWER:
