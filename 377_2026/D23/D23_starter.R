## >>> GET & SAVE (details in the R guide) -------------------------
## GET, git mode  -> run in the Console:
##   download.file("https://raw.githubusercontent.com/isaaccloh/ECON377/main/377_2026/D23/D23_starter.R", "D23.R")
## GET, easy mode -> copy this file from github.com/isaaccloh/ECON377 (377_2026/D23) into a new script
## SAVE your work -> commit + push D23.R to your own econ377 repo (or upload it on github.com)
## ----------------------------------------------------------------

## ECN 377 - Day 23 STARTER  |  One-sided t-tests
## ------------------------------------------------------------------
## t = beta-hat / se, and under H0: beta = 0 it has a t distribution with df = n - K - 1.
## H1: beta > 0  ->  reject H0 if t > c,  c = qt(1 - alpha, df)   (right tail)
## H1: beta < 0  ->  reject H0 if t < c,  c = qt(alpha, df)       (left tail, c is negative)
## Fill each ______ and ANSWER, then upload to GitHub.
## ------------------------------------------------------------------

library(wooldridge)

## ---- Demo: is the return to experience positive? (Example 4.1) ----
## What you're learning: H1: beta > 0 uses the RIGHT tail.
data("wage1")
reg <- lm(log(wage) ~ educ + exper + tenure, data = wage1)
s <- summary(reg)$coefficients
t_exper <- s[3, 3]                         # row 3 = exper, column 3 = t value
c_05 <- qt(0.95, df = reg$df.residual)     # 5% critical value
c_01 <- qt(0.99, df = reg$df.residual)     # 1% critical value
t_exper
c_05
c_01

## ---- Demo: do larger schools do worse? (Example 4.2) ----
## What you're learning: H1: beta < 0 uses the LEFT tail, so c is negative.
data("meap93")
reg <- lm(math10 ~ totcomp + staff + enroll, data = meap93)
s <- summary(reg)$coefficients
t_enroll <- s[4, 3]                        # row 4 = enroll, column 3 = t value
c_left <- qt(0.05, df = reg$df.residual)   # 5% critical value, left tail
t_enroll
c_left

## ================= PROBLEMS (your turn) =========================
## H0: beta = 0 vs H1: beta > 0, alpha = 0.05, df = 40
c1 <- ______   # (a) critical value   (hint: qt(1 - alpha, df = 40))
## (b) t = 2.4 : reject or fail to reject?   ANSWER:
##     t = 0.9 :                              ANSWER:
##     t = -3.0 :                             ANSWER:

## H0: beta = 0 vs H1: beta < 0, alpha = 0.05, df = 30
c2 <- ______   # (c) critical value   (hint: qt(alpha, df = 30))
## (c) Is c2 positive or negative?            ANSWER:
## (d) t = -2.10 : reject?                    ANSWER:
##     t = -1.20 : reject?                    ANSWER:
