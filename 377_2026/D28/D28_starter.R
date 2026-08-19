## >>> GET & SAVE (details in the R guide) -------------------------
## GET, git mode  -> run in the Console:
##   download.file("https://raw.githubusercontent.com/isaaccloh/ECON377/main/377_2026/D28/D28_starter.R", "D28.R")
## GET, easy mode -> copy this file from github.com/isaaccloh/ECON377 (377_2026/D28) into a new script
## SAVE your work -> commit + push D28.R to your own econ377 repo (or upload it on github.com)
## ----------------------------------------------------------------

## ECN 377 - Day 28 STARTER  |  Course review
## ------------------------------------------------------------------
## Mixed practice for the comprehensive final. Fill the blanks, then check the key.
## ------------------------------------------------------------------

## (a) log(wage)-hat = 0.30 + 0.09*educ -- interpret the slope in %:
##     ANSWER (comment):

## (b) SST = 500, SSR = 350
R2 <- ______        # 1 - SSR/SST

## (c) beta-hat = 0.4, se = 0.1
bhat <- 0.4; se <- 0.1
tstat <- ______     # bhat/se
##     Reject H0: beta=0 at 5% (two-sided, c=2)?  ANSWER (comment):

## (d) 95% CI for (c) using c = 2
lower <- ______     # bhat - 2*se
upper <- ______     # bhat + 2*se
##     Is 0 inside?  ANSWER (comment):

## (e) wage-hat = 0.6 - 1.8*female + 0.5*educ -- the c.p. wage gap:
gap <- ______       # the female coefficient
