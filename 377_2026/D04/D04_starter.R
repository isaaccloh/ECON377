## ECN 377 - Day 4 STARTER  |  Variance & standard deviation
## ------------------------------------------------------------------
## We build the SAMPLE variance by hand on the notes' numbers (0,2,7),
## then check it against var().  Fill the TODO, then COMMIT + PUSH.
## KNOW THIS: var() and sd() divide by n-1 (the SAMPLE versions).
## ------------------------------------------------------------------

## ---- Demo: variance by hand, then var() ----
## What you're learning: variance = average squared distance from the mean (over n-1).
x <- c(0, 2, 7)                          # the data from the notes
mean(x)                                  # x-bar = 3
x - mean(x)                              # deviations:  -3, -1, 4
(x - mean(x))^2                          # squared:      9,  1, 16
sum((x - mean(x))^2) / (length(x) - 1)   # variance BY HAND = 13  (divide by n-1!)
var(x)                                   # KNOW THIS: var() = the SAME 13
sd(x)                                    # KNOW THIS: sd = sqrt(variance) = sqrt(13)

## ================= PROBLEMS (your turn) =========================
## For x = (1, 5, 9): do it by hand with the pieces, then check with var()/sd().
x <- c(1, 5, 9)
xbar   <- ______     # (a) the mean            (hint: mean(x))
devs   <- ______     # (b) the deviations      (hint: x - mean(x))
var_x  <- ______     # (c) sample variance     (hint: sum(devs^2)/(length(x)-1))
sd_x   <- ______     # (d) standard deviation  (hint: sqrt(var_x))
c(var_x, var(x))     # your by-hand variance should match var(x)
