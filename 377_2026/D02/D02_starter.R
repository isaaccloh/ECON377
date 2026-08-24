## >>> GET & SAVE (details in the R guide) -------------------------
## GET, git mode  -> run in the Console:
##   download.file("https://raw.githubusercontent.com/isaaccloh/ECON377/main/377_2026/D02/D02_starter.R", "D02.R")
## GET, easy mode -> copy this file from github.com/isaaccloh/ECON377 (377_2026/D02) into a new script
## SAVE your work -> commit + push D02.R to your own econ377 repo (or upload it on github.com)
## ----------------------------------------------------------------

## ECN 377 - Day 2  |  data types & causality; a first look at real data.
## Get this file, fill the TODOs with me, then SAVE it back to your repo (header above / R guide).

library(wooldridge)           # loads the course datasets
data("wage1")                 # 526 US workers, all in 1976 -- a CROSS-SECTION

## Do people with more education earn more?
cor(wage1$educ, wage1$wage)   # positive: more school goes with more pay...
## ...but correlation is NOT causation -- ability/background hide in the background.

## ---- For PS1: describing a variable (center / spread / shape) ----
summary(wage1)                # snapshot of every variable
mean(wage1$wage)              # center
sd(wage1$wage)                # spread (standard deviation)
hist(wage1$wage)              # shape

## ================= PROBLEMS (your turn) =========================
## (a) Is wage1 cross-section, time-series, or panel?   ANSWER (comment):
cor_ew <- ______              # (b) correlation of educ & wage   (hint: cor(wage1$educ, wage1$wage))
## (c) Name one confounder that could bias the educ -> wage link.   ANSWER (comment):
