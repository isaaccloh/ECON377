## ECN 377 - Day 17 STARTER  |  Omitted-variable bias: SLR vs MLR, formula 3.23
## ------------------------------------------------------------------
## SLR slope = MLR slope + (effect of omitted var) * (its correlation with X).
## Fill the TODO, then COMMIT + PUSH.
## ------------------------------------------------------------------

library(wooldridge); data("gpa1")

## ---- Demo: the bias, live (Example 3.3) ----
b_slr <- lm(colGPA ~ ACT, data = gpa1)$coefficients["ACT"]        # SLR: ~0.0271
mlr   <- lm(colGPA ~ ACT + hsGPA, data = gpa1)$coefficients
b_mlr <- mlr["ACT"]; b2 <- mlr["hsGPA"]                           # MLR: 0.0094, 0.453
d1    <- lm(hsGPA ~ ACT, data = gpa1)$coefficients["ACT"]         # delta1: ~0.0389

## formula (3.23): SLR slope = MLR slope + b2 * delta1
c(SLR = b_slr, check = b_mlr + b2 * d1)                           # both ~ 0.0271

## ================= PROBLEMS (your turn) =========================
## (a) b2 > 0 and delta1 > 0: SLR slope biased up or down?   ANSWER:
## (b) b2 > 0 and delta1 < 0: which way?                     ANSWER:
## (c) When is there NO omitted-variable bias?               ANSWER:
