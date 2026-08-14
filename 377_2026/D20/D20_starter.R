## ECN 377 - Day 20 STARTER  |  One-sided t-tests
## ------------------------------------------------------------------
## H1: beta > 0.  Reject H0 if  t > c,  where c = qt(1 - alpha, df).
## Fill the TODO, then COMMIT + PUSH.
## ------------------------------------------------------------------

library(wooldridge); data("wage1")

## ---- Demo: is the return to experience positive? (Example 4.1) ----
reg <- lm(log(wage) ~ educ + exper + tenure, data = wage1)
s <- summary(reg)$coefficients
t_exper <- s["exper", "t value"]        # t-stat for exper
c_05    <- qt(0.95, df = reg$df.residual)   # 5% one-sided critical value
c(t_exper = t_exper, c_05 = c_05)       # t > c  =>  reject H0

## ================= PROBLEMS (your turn) =========================
## H0: beta = 0 vs H1: beta > 0, alpha = 0.05, critical value c = 1.68
c <- 1.68
## (a) t = 2.4 : reject or fail to reject?   ANSWER:
## (b) t = 0.9 :                              ANSWER:
## (c) t = -3.0 (with H1: beta > 0) :         ANSWER:
