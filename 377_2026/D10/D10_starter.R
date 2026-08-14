## ECN 377 - Day 10 STARTER  |  lm(), fitted values, residuals, SSR
## ------------------------------------------------------------------
## lm() is the shortcut for the OLS line we derived by hand on Day 9.
## Fill the TODO, then COMMIT + PUSH.
## ------------------------------------------------------------------

library(wooldridge); data("wage1")

## ---- Demo: lm(), fitted values, residuals ----
## What you're learning: reg holds the line; $ pulls out its pieces.
reg <- lm(wage ~ educ, data = wage1)   # KNOW THIS: fit a regression.  help(lm)
reg$coefficients                        # -0.90 and 0.54  (same as Day 9)
reg$fitted.values[1:5]                  # yhat_i (predictions)
reg$residuals[1:5]                       # uhat_i = y_i - yhat_i
sum(reg$residuals^2)                     # SSR = total squared miss

## ---- Demo: CEO salary example ----
data("ceosal1")
creg <- lm(salary ~ roe, data = ceosal1)
creg$coefficients                        # 963.19 + 18.50*roe
predict(creg, data.frame(roe = 30))      # predicted salary at roe = 30

## ================= PROBLEMS (your turn) =========================
## Line: wage-hat = -0.90 + 0.54*educ.  A person: educ = 12, actual wage y = 9.0
b0 <- -0.90; b1 <- 0.54; y <- 9.0
yhat <- ______   # (a) fitted value       (hint: b0 + b1*12)
uhat <- ______   # (b) residual y - yhat
## (c) Over- or under-predicted? (comment)  ANSWER:
