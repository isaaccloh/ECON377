## ECN 377 - Day 27 STARTER  |  Synthesis + AI audit
## ------------------------------------------------------------------
## Run one full analysis, read it carefully, then correct the AI's four mistakes.
## Fill the comments, then COMMIT + PUSH.
## ------------------------------------------------------------------

library(wooldridge); data("wage1")

## ---- The full analysis ----
## What you're learning: the skill is READING a regression, not running it.
reg <- lm(log(wage) ~ educ + exper + female, data = wage1)
summary(reg)      # estimates, se, t, p-values, overall F
confint(reg)      # 95% CIs

## ================= AUDIT THE AI (your turn) =========================
## The chatbot made FOUR errors. Write the correction for each (one line):
## (1) "educ coef 0.09 => +$0.09/hr per year":   CORRECTION:
## (2) "female is negative => being female CAUSES lower pay":  CORRECTION:
## (3) "the p-value on exper tests whether it equals 1":  CORRECTION:
## (4) "R^2 ~ 0.30, so the model is useless":  CORRECTION:
