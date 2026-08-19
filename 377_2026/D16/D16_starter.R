## >>> GET & SAVE (details in the R guide) -------------------------
## GET, git mode  -> run in the Console:
##   download.file("https://raw.githubusercontent.com/isaaccloh/ECON377/main/377_2026/D16/D16_starter.R", "D16.R")
## GET, easy mode -> copy this file from github.com/isaaccloh/ECON377 (377_2026/D16) into a new script
## SAVE your work -> commit + push D16.R to your own econ377 repo (or upload it on github.com)
## ----------------------------------------------------------------

## ECN 377 - Day 16 STARTER  |  MLR examples & interpretation
## ------------------------------------------------------------------
## The notes' Examples 3.1 (gpa1) and 3.2 (wage1).  Fill the TODO, commit + push.
## ------------------------------------------------------------------

library(wooldridge)

## ---- Demo: Example 3.1 (college GPA) ----
## What you're learning: each slope is a ceteris-paribus effect.
data("gpa1")
lm(colGPA ~ hsGPA + ACT, data = gpa1)$coefficients        # 1.29, 0.45, 0.0094

## ---- Demo: Example 3.2 (log-wage) ----
data("wage1")
lm(log(wage) ~ educ + exper + tenure, data = wage1)$coefficients   # 0.28, 0.092, 0.0041, 0.022

## ================= PROBLEMS (your turn) =========================
## colGPA-hat = 1.29 + 0.45*hsGPA + 0.0094*ACT
b0 <- 1.29; b1 <- 0.45; b2 <- 0.0094
pred     <- ______   # (a) colGPA at hsGPA=3.5, ACT=24   (hint: b0 + b1*3.5 + b2*24)
eff_hsGPA <- ______  # (b) +1 hsGPA, ACT fixed            (hint: b1)
eff_ACT10 <- ______  # (c) +10 ACT, hsGPA fixed           (hint: b2*10)
