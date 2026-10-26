## >>> GET & SAVE (details in the R guide) -------------------------
## GET, git mode  -> run in the Console:
##   download.file("https://raw.githubusercontent.com/isaaccloh/ECON377/main/377_2026/D18/D18_starter.R", "D18.R")
## GET, easy mode -> copy this file from github.com/isaaccloh/ECON377 (377_2026/D18) into a new script
## SAVE your work -> commit + push D18.R to your own econ377 repo (or upload it on github.com)
## ----------------------------------------------------------------

## ECN 377 - Day 18 STARTER  |  MLR Examples 3.2 and 3.1;  omitted-variable bias (3.23)
## ------------------------------------------------------------------
## Type the examples along with class. Fill each ______ in the problems, then upload to GitHub.
## ------------------------------------------------------------------

library(wooldridge)

## ---- Example 3.2 (wage1): log(wage) on educ, exper, tenure ----
## regress, then save the coefficients


## predict wage at educ = 16, exper = 4, tenure = 2 (remember exp())


## % change in wage: +1 year educ; +1 exper and +1 tenure


## ---- Example 3.1 (gpa1): colGPA on hsGPA and ACT ----
## regress; change in colGPA-hat from +10 ACT, hsGPA fixed


## compare: the SLR of colGPA on ACT


## the regression plane: scatter3d() from car   (first time only: install.packages(c("car", "rgl")))


## ---- Omitted-variable bias (Example 3.3, gpa1) ----
## delta1: regress hsGPA (omitted) on ACT (included)


## check (3.23): SLR slope = MLR slope + (hsGPA slope) * delta1


## ================= PROBLEMS (your turn) =========================
## (a) log(wage)-hat = 0.28 + 0.092*educ + 0.0041*exper + 0.022*tenure
pct_a <- ______     # (a) % change in wage from +4 years educ, exper and tenure fixed   (hint: 100 * 0.092 * 4)
## (b) colGPA-hat = 1.29 + 0.453*hsGPA + 0.0094*ACT
pred_b <- ______    # (b) colGPA at hsGPA = 3.0, ACT = 30   (hint: 1.29 + 0.453*3.0 + 0.0094*30)
## (c) b2 > 0 and delta1 > 0: SLR slope biased up or down?   ANSWER:
## (d) b2 > 0 and delta1 < 0: which way?                     ANSWER:
## (e) When is there NO omitted-variable bias?               ANSWER:
