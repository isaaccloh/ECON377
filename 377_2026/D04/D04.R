## >>> GET & SAVE (details in the R guide) -------------------------
## GET, git mode  -> run in the Console:
##   download.file("https://raw.githubusercontent.com/isaaccloh/ECON377/main/377_2026/D04/D04_starter.R", "D04.R")
## GET, easy mode -> copy this file from github.com/isaaccloh/ECON377 (377_2026/D04) into a new script
## SAVE your work -> commit + push D04.R to your own econ377 repo (or upload it on github.com)
## ----------------------------------------------------------------

## ECN 377 - Day 4  |  variance, sd, covariance, correlation.  (all SAMPLE calculations)
## We build this from scratch together -- pick your own numbers (poll the room!).

## --- Sample variance & sd ---
## put a few numbers in a vector called x
x <- c(2,1,3)
## find its mean
xbar <- mean(x)
## by hand: subtract the mean from each value, square, add up, divide by n - 1
sum((x-xbar)^2)/(length(x)-1)
## check it with the built-in variance function
var(x)
## the sd is the square root of the variance
sqrt(var(x))
sd(x)
## --- Sample covariance ---
## put two paired variables (same length) in vectors x and y
gta <- c(7,0,8)
miles = c(1,1,4)
## by hand: subtract each mean, multiply the pairs, add up, divide by n - 1
sum(gta - mean(gta)) * (miles - mean(miles)) / (length(gta) - 1)
## check it with the built-in covariance function
cov(gta,miles)

## --- Sample correlation ---
## the correlation is the covariance divided by (sd of x  times  sd of y)
cov(gta,miles) / (sd(gta) * sd(miles))
## check it with the built-in correlation function
cor()

## --- Nonlinear: log & exp (allow non-constant, curved relationships) ---
## make a range of positive x-values (call it x)
x <- seq(0.1,5, by = 0.1)
## plot log(x): it flattens out (diminishing).  then plot exp(x): it grows fast.
plot(x, log(x), type = "l", col = "blue")
plot(x, exp(x), type = "l", col = "red")
## check that exp undoes log, and log undoes exp (pick any positive number):
log(exp(5))
exp(log(5))
## remember: var, sd, cov, cor are all SAMPLE quantities -- our best guesses at the population's.
