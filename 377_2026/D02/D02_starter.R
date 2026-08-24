## >>> GET & SAVE (details in the R guide) -------------------------
## GET, git mode  -> run in the Console:
##   download.file("https://raw.githubusercontent.com/isaaccloh/ECON377/main/377_2026/D02/D02_starter.R", "D02.R")
## GET, easy mode -> copy this file from github.com/isaaccloh/ECON377 (377_2026/D02) into a new script
## SAVE your work -> commit + push D02.R to your own econ377 repo (or upload it on github.com)
## ----------------------------------------------------------------

## ECN 377 - Day 2  |  first R session: the mean, real data, a first line.

## (1) The mean, from our own numbers  -- we fill this in together
## step 1: put our class poll numbers in a vector -- use c()
poll <- ______
## step 2: add them all up -- use sum()
______
## step 3: how many are there? (n) -- use length()
______
## step 4: the mean = sum / length ... or just mean()
______

## (2) Real data: dataset$variable
library(wooldridge); data("wage1")   # 526 workers, 1976
summary(wage1)                        # snapshot of every variable
mean(______)                          # TODO: fill in wage1$wage       -- center
sd(wage1$wage)                        # spread
hist(wage1$wage)                      # shape
cor(wage1$educ, wage1$wage)           # do they move together? (not causation!)

## ================= PROBLEMS (your turn) =========================
mean_wage <- ______           # (a) the mean wage        (hint: mean(wage1$wage))
## (b) Is wage1 cross-section, time-series, or panel?   ANSWER (comment):
