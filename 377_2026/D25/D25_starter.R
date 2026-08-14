## ECN 377 - Day 25 STARTER  |  Dummy variables
## ------------------------------------------------------------------
## A dummy is a 0/1 column; its coefficient is the group difference (an intercept shift).
## Fill the TODO, then COMMIT + PUSH.
## ------------------------------------------------------------------

library(wooldridge); data("wage1")

## ---- Demo: the female wage gap ----
## What you're learning: the female coefficient is the c.p. gap at EVERY education level.
reg <- lm(wage ~ female + educ, data = wage1)
reg$coefficients        # intercept, female (the gap), educ

## many categories -> factor() makes the dummies and drops one base level:
lm(wage ~ factor(numdep) + educ, data = wage1)$coefficients

## ================= PROBLEMS (your turn) =========================
## wage-hat = 0.6 - 1.8*female + 0.51*educ
b0 <- 0.6; d0 <- -1.8; b1 <- 0.51
male_12   <- ______   # (a) male,   educ=12   (hint: b0 + d0*0 + b1*12)
female_12 <- ______   # (b) female, educ=12   (hint: b0 + d0*1 + b1*12)
## (c) The gap = female_12 - male_12. Does it depend on educ? (comment)  ANSWER:
