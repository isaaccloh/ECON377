## >>> GET & SAVE (details in the R guide) -------------------------
## GET, git mode  -> run in the Console:
##   download.file("https://raw.githubusercontent.com/isaaccloh/ECON377/main/377_2026/D04/D04_starter.R", "D04.R")
## GET, easy mode -> copy this file from github.com/isaaccloh/ECON377 (377_2026/D04) into a new script
## SAVE your work -> commit + push D04.R to your own econ377 repo (or upload it on github.com)
## ----------------------------------------------------------------

## ECN 377 - Day 4  |  variance, sd, covariance, correlation.  (all SAMPLE calculations)
## We fill in the blanks together -- swap in your own numbers (poll the room!)

## --- Sample variance & sd ---
x <- c(0, 2, 7)                # our data (change these)
mean(x)                        # the mean

## by hand: subtract the mean from each x, square, add up, divide by n - 1
______
## check it with the built-in variance function
______
## sd = the square root of the variance
______

## --- Sample covariance ---
x <- c(2, 0, -2); y <- c(0, 1, 2)   # two paired variables (change these)

## by hand: subtract each mean, multiply the pairs, add up, divide by n - 1
______
## check it with the built-in covariance function
______

## --- Sample correlation ---
## correlation = covariance divided by (sd of x  times  sd of y)
______
## check it with the built-in correlation function
______

## --- Nonlinear: log & exp (they allow non-constant, curved relationships) ---
x <- seq(0.5, 5, by = 0.1)
plot(x, log(x), type = "l")    # log: diminishing (flattens out)
plot(x, exp(x), type = "l")    # exp: grows ever faster
## show that exp undoes log, and log undoes exp (try the number 3):
______                         # log then exp
______                         # exp then log

## remember: var, sd, cov, cor are all SAMPLE quantities -- our best guesses at the population's.
