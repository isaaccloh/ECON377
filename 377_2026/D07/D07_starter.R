## >>> GET & SAVE (details in the R guide) -------------------------
## GET, git mode  -> run in the Console:
##   download.file("https://raw.githubusercontent.com/isaaccloh/ECON377/main/377_2026/D07/D07_starter.R", "D07.R")
## GET, easy mode -> copy this file from github.com/isaaccloh/ECON377 (377_2026/D07) into a new script
## SAVE your work -> commit + push D07.R to your own econ377 repo (or upload it on github.com)
## ----------------------------------------------------------------

## ECN 377 - Day 7 STARTER  |  Correlation, conditional expectation & conditional variance
## ------------------------------------------------------------------
## We use real data: wages and education (wooldridge::wage1).
## Fill each ______ as we go in class, then COMMIT + PUSH.
## ------------------------------------------------------------------

library(wooldridge); data("wage1")

## ===== 1. Correlation:  Cor(X,Y) = Cov(X,Y) / ( sd(X)*sd(Y) )  -- unitless, in [-1, 1] =====
## On real data, R computes it in one call:
______              # correlation of educ and wage   -- cor(wage1$educ, wage1$wage)
## Positive -> they move together.  But correlation is NOT causation (think confounders).

## ===== 2. Conditional expectation:  E[Y | X = x] = the AVERAGE of Y within the X = x subgroup =====
## Average wage among people with exactly 12 years of education (HS diploma):
______              # E[wage | educ = 12]   -- mean(wage1$wage[wage1$educ == 12])
______              # E[wage | educ = 16]   -- same idea, educ == 16 (college)
## The conditional mean RISES with education.

## ===== 3. Conditional variance:  Var(Y | X = x) = the SPREAD of Y within the X = x subgroup =====
______              # Var(wage | educ = 12)  -- var(wage1$wage[wage1$educ == 12])
______              # Var(wage | educ = 16)  -- same idea, educ == 16
## Which subgroup's wages are more spread out?  (income "fans out" at higher education)

## ================= YOUR TURN =========================
## (a) E[wage | educ = 14]  (should land between the educ=12 and educ=16 means):
______              # mean of wage among educ == 14
## (b) In one sentence (comment): does the positive cor(educ, wage) PROVE school raises pay?
##     Name one confounder.  ANSWER:
