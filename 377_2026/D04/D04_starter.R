## >>> GET & SAVE (details in the R guide) -------------------------
## GET, git mode  -> run in the Console:
##   download.file("https://raw.githubusercontent.com/isaaccloh/ECON377/main/377_2026/D04/D04_starter.R", "D04.R")
## GET, easy mode -> copy this file from github.com/isaaccloh/ECON377 (377_2026/D04) into a new script
## SAVE your work -> commit + push D04.R to your own econ377 repo (or upload it on github.com)
## ----------------------------------------------------------------

## ECN 377 - Day 4  |  variance, sd, covariance, correlation.  (all SAMPLE calculations)
## Swap in your own numbers anywhere -- e.g. poll the room!

## --- Sample variance & sd ---
x <- c(0, 2, 7)                # our data (CHANGE THESE)
mean(x)                        # the mean
______                         # variance BY HAND  (hint: sum((x-mean(x))^2)/(length(x)-1))
var(x)                         # ...same thing
______                         # sd                (hint: sd(x)   or   sqrt(var(x)))

## --- Sample covariance ---
x <- c(2, 0, -2)               # two paired variables (CHANGE THESE)
y <- c(0, 1, 2)
______                         # covariance BY HAND (hint: sum((x-mean(x))*(y-mean(y)))/(length(x)-1))
cov(x, y)                      # ...same thing

## --- Sample correlation ---
______                         # from the parts    (hint: cov(x,y)/(sd(x)*sd(y)))
cor(x, y)                      # ...same thing

## remember: var, sd, cov, cor are all SAMPLE quantities.
