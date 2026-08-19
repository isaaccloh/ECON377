## >>> GET & SAVE (details in the R guide) -------------------------
## GET, git mode  -> run in the Console:
##   download.file("https://raw.githubusercontent.com/isaaccloh/ECON377/main/377_2026/D13/D13_starter.R", "D13.R")
## GET, easy mode -> copy this file from github.com/isaaccloh/ECON377 (377_2026/D13) into a new script
## SAVE your work -> commit + push D13.R to your own econ377 repo (or upload it on github.com)
## ----------------------------------------------------------------

## ECN 377 - Day 13 STARTER  |  Assumptions, unbiasedness, omitted-variable bias
## ------------------------------------------------------------------
## An omitted variable biases OLS if it (1) affects Y AND (2) is correlated with X.
## Fill the comments, then COMMIT + PUSH.
## ------------------------------------------------------------------

library(wooldridge); data("meap93")

## ---- Demo: OVB in the wild ----
## What you're learning: a "wrong sign" often means a confounder, not a real effect.
lm(math10 ~ lnchprg, data = meap93)$coefficients   # 32.14 and -0.319 (negative!)
## The negative slope does NOT mean free lunch lowers scores -- poverty drives both.

## ================= PROBLEMS (your turn) =========================
## Model: wage = b0 + b1*educ + U, with ability hiding in U.
## (a) Does ability (1) affect wage? (2) correlate with educ?   ANSWER:
## (b) Is the educ slope biased up or down? (Table 3.2)          ANSWER:
## (c) Which assumption fails?                                   ANSWER:
