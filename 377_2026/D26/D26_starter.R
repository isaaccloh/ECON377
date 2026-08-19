## >>> GET & SAVE (details in the R guide) -------------------------
## GET, git mode  -> run in the Console:
##   download.file("https://raw.githubusercontent.com/isaaccloh/ECON377/main/377_2026/D26/D26_starter.R", "D26.R")
## GET, easy mode -> copy this file from github.com/isaaccloh/ECON377 (377_2026/D26) into a new script
## SAVE your work -> commit + push D26.R to your own econ377 repo (or upload it on github.com)
## ----------------------------------------------------------------

## ECN 377 - Day 26 STARTER  |  Interactions
## ------------------------------------------------------------------
## An interaction (dummy * variable) lets the SLOPE differ by group.
## female*educ = female + educ + female:educ.  Fill the TODO, commit + push.
## ------------------------------------------------------------------

library(wooldridge); data("wage1")

## ---- Demo: does the return to education differ by gender? ----
## What you're learning: the female:educ coefficient is the SLOPE difference.
reg <- lm(wage ~ female * educ, data = wage1)   # KNOW THIS: * = both + interaction
reg$coefficients        # intercept, female, educ, female:educ

## ================= PROBLEMS (your turn) =========================
## return to school: males = b1 ; females = b1 + d1,  with b1 = 0.54, d1 = -0.09
b1 <- 0.54; d1 <- -0.09
ret_male   <- ______   # (a) males' return per year    (hint: b1)
ret_female <- ______   # (b) females' return per year  (hint: b1 + d1)
## (c) Who has the higher return, and by how much? (comment)  ANSWER:
