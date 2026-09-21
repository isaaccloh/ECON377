## >>> GET & SAVE (details in the R guide) -------------------------
## GET, git mode  -> run in the Console:
##   download.file("https://raw.githubusercontent.com/isaaccloh/ECON377/main/377_2026/D07/D07_starter.R", "D07.R")
## GET, easy mode -> copy this file from github.com/isaaccloh/ECON377 (377_2026/D07) into a new script
## SAVE your work -> commit + push D07.R to your own econ377 repo (or upload it on github.com)
## ----------------------------------------------------------------

## ECN 377 - Day 7 STARTER  |  Correlation, conditional expectation & conditional variance
## ------------------------------------------------------------------
## Fill each ______ as we go in class, then COMMIT + PUSH.
## ------------------------------------------------------------------

library(wooldridge)
data("wage1")

## ===== 1. Population correlation from a probability table =====
## X, Y are correlated 0/1 coin flips.  Joint probabilities of the four (x, y) pairs:
xj <- c(0, 0, 1, 1)          # x for pairs (0,0) (0,1) (1,0) (1,1)
yj <- c(0, 1, 0, 1)          # y for those same pairs
pj <- c(0.4, 0.1, 0.1, 0.4)  # they tend to AGREE -> expect a positive relationship
EX  <- ______                # E[X]   = sum(xj * pj)
EY  <- ______                # E[Y]   = sum(yj * pj)
EXY <- ______                # E[XY]  = sum(xj * yj * pj)
Cov <- ______                # Cov(X,Y) = E[XY] - E[X]*E[Y]
## sd of a 0/1 variable: sd = sqrt(E[X^2] - E[X]^2), and X^2 = X here so E[X^2] = E[X]
sdX <- ______                # sqrt(EX - EX^2)
sdY <- ______                # sqrt(EY - EY^2)
Cor <- ______                # Cor = Cov / (sdX * sdY)   -- should come out to 0.6

## ===== 2. Conditional expectation:  E[Y | X = x] = average of Y within the X = x subgroup =====
## Build it in STEPS.  Goal: the average wage among people with exactly 12 years of educ.
is12 <- ______   # a BOOLEAN vector, TRUE for each person with educ == 12   (wage1$educ == 12)
w12  <- ______   # put the Boolean in [ ] to SELECT those people's wages     (wage1$wage[is12])
______           # E[wage | educ = 12] = the average of those wages          (mean(w12))
## Now educ == 16 (college), the same idea in one line:
______           # E[wage | educ = 16]   (mean(wage1$wage[wage1$educ == 16]))
## The conditional mean RISES with education.

## Special case  E[X | X] = X: condition on X and there's nothing left to average.
______           # E[educ | educ = 12] = mean of educ AMONG the educ==12 people (guess first!)

## ===== 3. Conditional variance:  Var(Y | X = x) = spread of Y within the X = x subgroup =====
______           # Var(wage | educ = 12)  -- var() of the SAME selected wages: var(w12)
______           # Var(wage | educ = 16)  -- var(wage1$wage[wage1$educ == 16])
## Which subgroup's wages are more spread out?  (income "fans out" at higher education)

## ================= YOUR TURN =========================
## (a) E[wage | educ = 14]  (Boolean -> select -> mean, like section 2):
______           #
## (b) We saw average wage RISES with education.  Does that PROVE school raises pay?
##     Name one confounder (comment).  ANSWER:

## ================= OPTIONAL DEMO (run it and look -- nothing to fill in) =================
## SEE conditional expectation & variance: a scatter of wage vs educ, with a sideways
## kernel-density estimate of wage drawn at educ = 12 and educ = 16.
##   * the DOT (center of each hump)   = E[wage | educ]    -- conditional EXPECTATION
##   * the BAR (+/- 1 sd about the dot) = sd(wage | educ)  -- conditional spread (variance)
plot(wage1$educ, wage1$wage, pch = 16, col = "grey70",
     xlab = "education (years)", ylab = "wage",
     main = "Conditional distribution of wage given education")

show_group <- function(ed, col) {
  w <- wage1$wage[wage1$educ == ed]      # wages within this education subgroup
  d <- density(w)                        # kernel density estimate of that subgroup
  m <- mean(w)
  s <- sd(w)   # conditional mean and standard deviation
  lines(ed + d$y / max(d$y) * 2.5, d$x, col = col, lwd = 2)     # density drawn sideways at x = ed
  arrows(ed, m - s, ed, m + s, angle = 90, code = 3,
         length = 0.05, col = col, lwd = 2)                     # bar = mean +/- 1 sd (spread)
  points(ed, m, pch = 19, col = col, cex = 1.4)                 # dot = E[wage | educ = ed]
}
show_group(12, "blue")                   # HS diploma
show_group(16, "red")                    # college degree
legend("topleft", c("educ = 12 (HS)", "educ = 16 (college)"),
       col = c("blue", "red"), lwd = 2, bty = "n")
## Read it: the red hump/dot sits HIGHER (bigger conditional mean) and its bar is LONGER
## (bigger conditional sd) than the blue -- income rises AND fans out with education.
