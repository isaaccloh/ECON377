## >>> GET & SAVE (details in the R guide) -------------------------
## GET, git mode  -> run in the Console:
##   download.file("https://raw.githubusercontent.com/isaaccloh/ECON377/main/377_2026/D08/D08_starter.R", "D08.R")
## GET, easy mode -> copy this file from github.com/isaaccloh/ECON377 (377_2026/D08) into a new script
## SAVE your work -> commit + push D08.R to your own econ377 repo (or upload it on github.com)
## ----------------------------------------------------------------

## ECN 377 - Day 8 STARTER  |  The SLR model & E[Y|X]
## ------------------------------------------------------------------
## Model:  Y = b0 + b1*X + U,  so  E[Y|X] = b0 + b1*X  (a straight line).
## Today we only EVALUATE the line; estimating b0,b1 from data is Day 9.
## Fill the TODO, then COMMIT + PUSH.
## ------------------------------------------------------------------

## ---- Demo: colGPA as a linear function of hsGPA  (E[Y|X] = b0 + b1*X) ----
## Notes:  E[colGPA | hsGPA] = 1.5 + 0.5*hsGPA     (colGPA depends on hsGPA)
b0 <- ______                      # intercept
b1 <- ______                      # slope
hsGPA  <- seq(2, 4, by = 0.1)     # a range of hsGPA values (given)
colGPA <- ______                  # build the line from b0, b1, hsGPA
plot(hsGPA, colGPA, type = "l",
     xlab = "hsGPA", ylab = "E[colGPA | hsGPA]")   # then plot the line
______                            # predicted colGPA at hsGPA = 3.6

## ================= PROBLEMS (your turn) =========================
pred_30 <- ______   # (a) expected colGPA at hsGPA = 3.0   (hint: b0 + b1*3.0)
## (b) In one sentence (comment): what does E[U | X] = 0 say?
##     ANSWER:
## (c) In one sentence (comment): why might it fail for wage = b0 + b1*educ + U?
##     ANSWER:
