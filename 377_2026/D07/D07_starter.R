## >>> GET & SAVE (details in the R guide) -------------------------
## GET, git mode  -> run in the Console:
##   download.file("https://raw.githubusercontent.com/isaaccloh/ECON377/main/377_2026/D07/D07_starter.R", "D07.R")
## GET, easy mode -> copy this file from github.com/isaaccloh/ECON377 (377_2026/D07) into a new script
## SAVE your work -> commit + push D07.R to your own econ377 repo (or upload it on github.com)
## ----------------------------------------------------------------

## ECN 377 - Day 7 STARTER  |  Correlation, conditional expectation & conditional variance
## ------------------------------------------------------------------
## We use real data: wages and education (wooldridge::wage1).
## Fill each ______ as we go in class, then COMMIT + PUSH.
## ------------------------------------------------------------------

library(wooldridge); data("wage1")

## ===== 1. Correlation:  Cor(X,Y) = Cov(X,Y) / ( sd(X)*sd(Y) )  -- unitless, in [-1, 1] =====
## On real data, R computes it in one call:
______              # correlation of educ and wage   -- cor(wage1$educ, wage1$wage)
## Positive -> they move together.  But correlation is NOT causation (think confounders).

## ===== 2. Conditional expectation:  E[Y | X = x] = the AVERAGE of Y within the X = x subgroup =====
## Average wage among people with exactly 12 years of education (HS diploma):
______              # E[wage | educ = 12]   -- mean(wage1$wage[wage1$educ == 12])
______              # E[wage | educ = 16]   -- same idea, educ == 16 (college)
## The conditional mean RISES with education.

## ===== 3. Conditional variance:  Var(Y | X = x) = the SPREAD of Y within the X = x subgroup =====
______              # Var(wage | educ = 12)  -- var(wage1$wage[wage1$educ == 12])
______              # Var(wage | educ = 16)  -- same idea, educ == 16
## Which subgroup's wages are more spread out?  (income "fans out" at higher education)

## ================= YOUR TURN =========================
## (a) E[wage | educ = 14]  (should land between the educ=12 and educ=16 means):
______              # mean of wage among educ == 14
## (b) In one sentence (comment): does the positive cor(educ, wage) PROVE school raises pay?
##     Name one confounder.  ANSWER:

## ================= OPTIONAL DEMO (run it and look -- nothing to fill in) =================
## SEE conditional expectation & variance: a scatter of wage vs educ, with a sideways
## kernel-density estimate of wage drawn at educ = 12 and educ = 16.
##   * the DOT (center of each hump) = E[wage | educ]      -- conditional EXPECTATION
##   * the WIDTH/spread of each hump = Var(wage | educ)    -- conditional VARIANCE
plot(wage1$educ, wage1$wage, pch = 16, col = "grey70",
     xlab = "education (years)", ylab = "wage",
     main = "Conditional distribution of wage given education")

show_group <- function(ed, col) {
  w <- wage1$wage[wage1$educ == ed]      # wages within this education subgroup
  d <- density(w)                        # kernel density estimate of that subgroup
  lines(ed + d$y / max(d$y) * 2.5, d$x, col = col, lwd = 2)  # density drawn sideways at x = ed
  abline(v = ed, col = col, lty = 3)                         # the vertical slice educ = ed
  points(ed, mean(w), pch = 19, col = col, cex = 1.4)        # dot = E[wage | educ = ed]
}
show_group(12, "blue")                   # HS diploma
show_group(16, "red")                    # college degree
legend("topleft", c("educ = 12 (HS)", "educ = 16 (college)"),
       col = c("blue", "red"), lwd = 2, bty = "n")
## Read it: the red hump sits HIGHER (bigger conditional mean) and is WIDER (bigger
## conditional variance) than the blue hump -- income rises AND fans out with education.
