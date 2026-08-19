## >>> GET & SAVE (details in the R guide) -------------------------
## GET, git mode  -> run in the Console:
##   download.file("https://raw.githubusercontent.com/isaaccloh/ECON377/main/377_2026/D01/D01_starter.R", "D01.R")
## GET, easy mode -> copy this file from github.com/isaaccloh/ECON377 (377_2026/D01) into a new script
## SAVE your work -> commit + push D01.R to your own econ377 repo (or upload it on github.com)
## ----------------------------------------------------------------

## ECN 377 - Day 1  |  run this after you install R, to check your setup.
## (This is what we did together in class. Data comes from `wooldridge`.)

library(wooldridge)      # course datasets
data("wage1")            # 526 US workers, 1976

## Do people with more education earn more?
plot(wage1$educ, wage1$wage,
     xlab = "education (years)", ylab = "wage ($/hr, 1976)")
abline(lm(wage ~ educ, data = wage1), col = "steelblue", lwd = 3)

## Adding up and averaging -- put YOUR class poll numbers inside c(...):
songs <- c(3, 0, 12, 5, 8)   # how many Taylor Swift songs in the last 24h?
sum(songs)                    # add them up
length(songs)                 # how many
sum(songs) / length(songs)    # the mean, by hand
mean(songs)                   # ...or just mean()
