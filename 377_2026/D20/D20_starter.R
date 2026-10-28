## >>> GET & SAVE (details in the R guide) -------------------------
## GET, git mode  -> run in the Console:
##   download.file("https://raw.githubusercontent.com/isaaccloh/ECON377/main/377_2026/D20/D20_starter.R", "D20.R")
## GET, easy mode -> copy this file from github.com/isaaccloh/ECON377 (377_2026/D20) into a new script
## SAVE your work -> commit + push D20.R to your own econ377 repo (or upload it on github.com)
## ----------------------------------------------------------------

## ECN 377 - Day 20 STARTER  |  Variances & standard errors;  Gauss-Markov, normality, the t-statistic
## ------------------------------------------------------------------
## The t-statistic = estimate / se = "how many standard errors from zero."
## Fill each ______ and ANSWER, then upload to GitHub.
## ------------------------------------------------------------------

library(wooldridge)
data("wage1")

## ---- Demo: read the standard errors ----
## What you're learning: precision lives in the se, not the estimate.
reg <- lm(wage ~ educ + exper, data = wage1)
summary(reg)$coefficients        # Estimate | Std. Error | t value | Pr(>|t|)

## ---- Demo: the t-statistic ----
## What you're learning: the "t value" column is beta-hat / se.
reg <- lm(wage ~ educ, data = wage1)
s <- summary(reg)$coefficients
s                                        # Estimate | Std. Error | t value | Pr(>|t|)
s[, "Estimate"] / s[, "Std. Error"]      # = the "t value" column

## ================= PROBLEMS (your turn) =========================
## Var(beta1-hat) = sigma^2 / SST_X.  Up or down?
## (a) error variance sigma^2 rises          ANSWER:
## (b) sample size n grows (SST_X grows)      ANSWER:
## (c) X barely varies (everyone similar X)   ANSWER:
## An estimate beta-hat = 0.54 with se = 0.05.
bhat <- 0.54
se <- 0.05
tstat <- ______   # (d) t = beta-hat / se   (hint: bhat/se)
## (d) Is |t| big (far from 0)?              ANSWER:
## (e) What null hypothesis does this t test? ANSWER:
