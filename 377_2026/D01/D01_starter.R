## >>> GET & SAVE (details in the R guide) -------------------------
## GET, git mode  -> run in the Console:
##   download.file("https://raw.githubusercontent.com/isaaccloh/ECON377/main/377_2026/D01/D01_starter.R", "D01.R")
## GET, easy mode -> copy this file from github.com/isaaccloh/ECON377 (377_2026/D01) into a new script
## SAVE your work -> commit + push D01.R to your own econ377 repo (or upload it on github.com)
## ----------------------------------------------------------------

## ECN 377 - Day 1  |  first R: the mean.  (Run after you install R + RStudio.)
## Nothing is due today except installing the tools; this just checks your setup.

## The mean = add them all up, divide by how many.
xvec <- c(0, 0, 6, 2, 1)     # song counts from the notes (n = 5) -- or your own poll
sum(xvec)                     # add them up
length(xvec)                  # how many (n)
sum(xvec) / length(xvec)      # the mean, by hand
mean(xvec)                    # ...or just mean()   ->  9/5 = 1.8

## TODO: put THREE of your own numbers in c(...) and find their mean.
my_nums <- ______             # e.g. c(4, 8, 6)
mean(my_nums)                 # your mean
