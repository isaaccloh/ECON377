## ECN 377 - Day 7 STARTER  |  Conditional expectation & correlation
## ------------------------------------------------------------------
## E[Y | X] = the average of Y among people with that value of X.
## Fill the TODO, then COMMIT + PUSH.
## ------------------------------------------------------------------

library(wooldridge); data("wage1")

## ---- Demo: conditional expectation = subgroup average ----
## What you're learning: the conditional mean of wage rises with education.
mean(wage1$wage[wage1$educ == 12])    # E[wage | educ = 12]  (HS)
mean(wage1$wage[wage1$educ == 16])    # E[wage | educ = 16]  (college)

## ---- Demo: correlation ----
cor(wage1$educ, wage1$wage)           # KNOW THIS: positive, but NOT proof of cause

## ================= PROBLEMS (your turn) =========================
mean_educ12 <- ______   # (a) E[wage | educ=12]   (hint: mean(wage1$wage[wage1$educ==12]))
mean_educ14 <- ______   # (a) E[wage | educ=14]
cor_ew      <- ______   # (b) cor(educ, wage)
## (c) In one sentence (comment): does this correlation prove school raises pay?
##     Name one confounder.  ANSWER:
