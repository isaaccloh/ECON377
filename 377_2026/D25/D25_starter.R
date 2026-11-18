## >>> GET & SAVE (details in the R guide) -------------------------
## GET, git mode  -> run in the Console:
##   download.file("https://raw.githubusercontent.com/isaaccloh/ECON377/main/377_2026/D25/D25_starter.R", "D25.R")
## GET, easy mode -> copy this file from github.com/isaaccloh/ECON377 (377_2026/D25) into a new script
## SAVE your work -> commit + push D25.R to your own econ377 repo (or upload it on github.com)
## ----------------------------------------------------------------

## ECN 377 - Day 25 STARTER  |  Two-sided tests; testing beta = a
## ------------------------------------------------------------------
## H1: beta != 0  ->  reject H0 if |t| > c,  c = qt(1 - alpha/2, df)   (alpha/2 in EACH tail)
## H0: beta = a   ->  t = (beta-hat - a) / se, then the same steps.
## R's "t value" column always tests beta = 0.
## Fill each ______ and ANSWER, then upload to GitHub.
## ------------------------------------------------------------------

library(wooldridge)

## ---- Warm-up: Example 4.2 in logs (one-sided, H1: beta < 0) ----
## What you're learning: the log form gives a different conclusion than the level form.
data("meap93")
reg <- lm(math10 ~ log(totcomp) + log(staff) + log(enroll), data = meap93)
s <- summary(reg)$coefficients
t_enroll <- s[4, 3]                        # row 4 = log(enroll), column 3 = t value
c_left <- qt(0.05, df = reg$df.residual)   # 5% critical value, left tail
t_enroll
c_left

## ---- Demo: skipping class and ACT (Example 4.3, two-sided) ----
## What you're learning: compare |t| with c = qt(1 - alpha/2, df).
data("gpa1")
reg <- lm(colGPA ~ hsGPA + ACT + skipped, data = gpa1)
s <- summary(reg)$coefficients
s
c_two <- qt(0.975, df = reg$df.residual)   # 5% two-sided critical value
c_two
abs(s[4, 3])                               # row 4 = skipped
abs(s[3, 3])                               # row 3 = ACT

## ---- Demo: test H0: beta = 1 by hand (Example 4.4) ----
## What you're learning: the "t value" column tests beta = 0 only. For beta = 1, rebuild t.
data("campus")
reg <- lm(log(crime) ~ log(enroll), data = campus)
s <- summary(reg)$coefficients
tval <- (s[2, 1] - 1) / s[2, 2]                 # row 2 = log(enroll); column 1 estimate, column 2 se
c_right <- qt(0.95, df = reg$df.residual)       # H1: beta > 1
c_two <- qt(0.975, df = reg$df.residual)        # H1: beta != 1 (two-sided)
tval
c_right
c_two

## ================= PROBLEMS (your turn) =========================
## H0: beta = 0 vs H1: beta != 0, alpha = 0.05, df = 40
c3 <- ______   # (a) critical value   (hint: qt(1 - alpha/2, df = 40))
## (a) Is c3 bigger or smaller than the one-sided qt(0.95, df = 40) = 1.68? Why?   ANSWER:

## H0: beta = 0 vs H1: beta != 0, alpha = 0.05, c = 1.98
## (b) t = -3.2 : reject? (use |t|)           ANSWER:
##     t = 1.5 : reject?                      ANSWER:

## beta-hat = 0.8, se = 0.25. H0: beta = 1 vs H1: beta != 1, alpha = 0.05, use c = 2
t_c <- ______   # (c) t-statistic   (hint: (beta-hat - 1) / se)
## (c) Reject?                                ANSWER:

## (d) Example 4.5 in R: is the price elasticity of nox equal to -1?
data("hprice2")
reg <- lm(log(price) ~ log(nox) + log(dist) + rooms + stratio, data = hprice2)
s <- summary(reg)$coefficients
t_nox <- ______   # t for H0: beta = -1   (hint: row 2; (estimate - (-1)) / se)
## (d) With c = 1.96, reject H0: beta = -1?   ANSWER:
