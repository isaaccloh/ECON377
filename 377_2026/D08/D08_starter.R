## ECN 377 - Day 8 STARTER  |  The SLR model & E[Y|X]
## ------------------------------------------------------------------
## Model:  Y = b0 + b1*X + U,  so  E[Y|X] = b0 + b1*X  (a straight line).
## Today we only EVALUATE the line; estimating b0,b1 from data is Day 9.
## Fill the TODO, then COMMIT + PUSH.
## ------------------------------------------------------------------

## ---- Demo: the conditional-mean line ----
## Notes example:  E[colGPA | hsGPA] = 1.5 + 0.5*hsGPA
b0 <- 1.5; b1 <- 0.5
b0 + b1 * 3.6                      # expected college GPA at hsGPA = 3.6  ->  3.3
hsGPA <- seq(2, 4, by = 0.1)
plot(hsGPA, b0 + b1 * hsGPA, type = "l",
     xlab = "hsGPA", ylab = "E[colGPA | hsGPA]")   # the conditional-mean line

## ================= PROBLEMS (your turn) =========================
pred_30 <- ______   # (a) expected colGPA at hsGPA = 3.0   (hint: b0 + b1*3.0)
## (b) In one sentence (comment): what does E[U | X] = 0 say?
##     ANSWER:
## (c) In one sentence (comment): why might it fail for wage = b0 + b1*educ + U?
##     ANSWER:
