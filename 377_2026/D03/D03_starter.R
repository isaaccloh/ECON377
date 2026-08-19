## >>> GET & SAVE (details in the R guide) -------------------------
## GET, git mode  -> run in the Console:
##   download.file("https://raw.githubusercontent.com/isaaccloh/ECON377/main/377_2026/D03/D03_starter.R", "D03.R")
## GET, easy mode -> copy this file from github.com/isaaccloh/ECON377 (377_2026/D03) into a new script
## SAVE your work -> commit + push D03.R to your own econ377 repo (or upload it on github.com)
## ----------------------------------------------------------------

## ECN 377 - Day 3 STARTER  |  Linear functions & marginal effects
## ------------------------------------------------------------------
## No new dataset today -- we practice the "a line is an effect" idea in R.
## Fill the TODO with me, then COMMIT + PUSH your version.
## "KNOW THIS" = code you're responsible for on quizzes/problems.
## ------------------------------------------------------------------

## ---- Demo 1: a line is arithmetic on a vector ----
## What you're learning: R applies "164 + 0.27*x" to every element at once.
income  <- c(1000, 1200, 1500)   # KNOW THIS: c() builds a vector
housing <- 164 + 0.27 * income   # KNOW THIS: evaluate the line at each income
housing                          # predicted housing expenditure

## ---- Demo 2: marginal effect = slope * change in x ----
## What you're learning: the slope 0.27 is "+$0.27 of housing per +$1 of income".
0.27 * 200                       # income up $200  -> +$54
0.27 * (-50)                     # income down $50 -> -$13.50

## ---- Demo 3: ceteris paribus (hold the other variable fixed) ----
## quantity = 120 - 9.8*price + 0.03*income
## What you're learning: each slope is the effect of ONE variable, others fixed.
b1 <- -9.8; b2 <- 0.03           # the two slopes
b1 * 1 + b2 * 0                  # price up $1, income fixed     -> -9.8
b1 * 0 + b2 * (-100)             # income down $100, price fixed -> -3
______                          # TODO: price down $2 AND income up $300 (hint: b1*(-2) + b2*300)

## ================= PROBLEMS (your turn) =========================
## Wage line:  wage = -0.90 + 0.54 * educ    (dollars/hour, years of school)
b0 <- -0.90; b1_wage <- 0.54
wage_at_12   <- ______   # (a) predicted wage at educ = 12   (hint: b0 + b1_wage*12)
effect_1yr   <- ______   # (b) extra wage from ONE more year (hint: b1_wage * 1)
## (c) In one sentence (as a comment): what does the intercept -0.90 mean, and why is it not believable?
##     ANSWER:
