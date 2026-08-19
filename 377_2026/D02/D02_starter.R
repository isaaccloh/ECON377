## >>> GET & SAVE (details in the R guide) -------------------------
## GET, git mode  -> run in the Console:
##   download.file("https://raw.githubusercontent.com/isaaccloh/ECON377/main/377_2026/D02/D02_starter.R", "D02.R")
## GET, easy mode -> copy this file from github.com/isaaccloh/ECON377 (377_2026/D02) into a new script
## SAVE your work -> commit + push D02.R to your own econ377 repo (or upload it on github.com)
## ----------------------------------------------------------------

## ECN 377 - Day 2 STARTER  |  R setup + summary statistics
## ------------------------------------------------------------------
## Today's workflow: FORK the class repo on GitHub, CLONE it into RStudio,
## open this file, fill the TODO with me, then COMMIT + PUSH your version.
## Data comes from `wooldridge`.  "KNOW THIS" = code you're responsible for.
## ------------------------------------------------------------------

## First time only (once per computer):  install.packages("wooldridge")
library(wooldridge)      # KNOW THIS: loads the course datasets.  help(wooldridge)
data("wage1")            # KNOW THIS: load a dataset by name.      help(data)

## ---- Demo 1: look at a dataset ----
## What you're learning: summary() snapshots every variable; $ pulls one out.
summary(wage1)           # KNOW THIS: quick summary of a dataset.  help(summary)
head(wage1)              # the first few rows.                     help(head)

## ---- Demo 2: the mean = sum / count ----
## What you're learning: mean = (x1 + ... + xn)/n = sum(x)/length(x) = mean(x).
educ <- wage1$educ                 # KNOW THIS: $ pulls a variable out of a dataset
sum(educ) / length(educ)           # the mean, by hand (top: the sum; bottom: n)
______                             # TODO: the same thing with mean()  (hint: mean(educ))

## ---- Demo 3: spread ----
## What you're learning: sd() and var() measure how spread out the data are.
sd(educ)                 # KNOW THIS: standard deviation.  help(sd)
var(educ)                # KNOW THIS: variance (= sd^2).   help(var)

## ---- Demo 4: a picture ----
## What you're learning: a histogram shows the shape of one variable.
hist(wage1$wage)         # KNOW THIS: histogram of a variable.  help(hist)

## ================= PROBLEMS (your turn) =========================
## Use the wage1 dataset. Fill in each blank, then commit + push.
mean_wage <- ______      # (a) the mean wage             (hint: mean(wage1$wage))
sd_wage   <- ______      # (b) the standard deviation of wage
n         <- ______      # (c) the sample size n         (hint: nrow(wage1))
