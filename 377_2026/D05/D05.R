## >>> GET & SAVE (details in the R guide) -------------------------
## GET, git mode  -> run in the Console:
##   download.file("https://raw.githubusercontent.com/isaaccloh/ECON377/main/377_2026/D05/D05_starter.R", "D05.R")
## GET, easy mode -> copy this file from github.com/isaaccloh/ECON377 (377_2026/D05) into a new script
## SAVE your work -> commit + push D05.R to your own econ377 repo (or upload it on github.com)
## ----------------------------------------------------------------

## ECN 377 - Day 5 STARTER  |  Covariance, correlation, logs
## ------------------------------------------------------------------
## Do two variables move together?  cov() and cor() answer that.
## Fill the TODO, then COMMIT + PUSH.
## ------------------------------------------------------------------

## --- Nonlinear: log & exp (allow non-constant, curved relationships) ---
## make a range of positive x-values (call it x)
x <- seq(0.5,5, by = 0.1)
## plot log(x): it flattens out (diminishing).  then plot exp(x): it grows fast.
plot(x, log(x), type = "l", col = "blue")
plot(x, exp(x), type = "l", col = "red")
## check that exp undoes log, and log undoes exp (pick any positive number):
log(exp(5))
exp(log(5))
## remember: var, sd, cov, cor are all SAMPLE quantities -- our best guesses at the population's.

## ---- Demo 1: the notes' 3-point table ----
## What you're learning: cov measures joint movement; cor rescales it to [-1, 1].
x <- c(2, 0, -2); y <- c(0, 1, 2)
cov(x, y)                     # KNOW THIS: sample covariance  = -2
cor(x, y)                     # KNOW THIS: correlation        = -1

## ---- Demo 2: real data ----
## What you're learning: education and wages move together (positively).
library(wooldridge); data("wage1")
cov(wage1$educ, wage1$wage)   # positive
cor(wage1$educ, wage1$wage)   # unitless strength

## ---- Demo 3: special functions ----
## What you're learning: exp undoes log.
log(c(1, exp(1), 10))         # KNOW THIS: natural log.  help(log)
exp(log(5))                   # exp(log(x)) = x

## ================= PROBLEMS (your turn) =========================
## For x = (1,3,5) and y = (2,2,8):
x <- c(1, 3, 5); y <- c(2, 2, 8)
cov_xy <- cov(x,y)     # (a) covariance     (hint: cov(x, y))
cor_xy <- cor(x_y)     # (b) correlation    (hint: cor(x, y))
## (c) In one sentence (comment): does a strong correlation prove causation? Why not?
##     ANSWER: A strong correlation does not prove causation. Only that both variables are driven by a shared factor.
