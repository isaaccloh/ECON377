## ECN 377 - Day 11 STARTER  |  Goodness of fit: SST = SSE + SSR, and R^2
## ------------------------------------------------------------------
## R^2 = fraction of the variation in Y explained by X = 1 - SSR/SST.
## Fill the TODO, then COMMIT + PUSH.
## ------------------------------------------------------------------

library(wooldridge); data("wage1")
reg <- lm(wage ~ educ, data = wage1)

## ---- Demo: R^2 from summary, then by hand ----
## What you're learning: R^2 = 1 - SSR/SST.
summary(reg)$r.squared                        # KNOW THIS: R^2
sst <- sum((wage1$wage - mean(wage1$wage))^2)  # total variation
ssr <- sum(reg$residuals^2)                     # unexplained variation
1 - ssr / sst                                   # = R^2

## ---- Demo: low R^2 is normal ----
data("bwght")
summary(lm(bwght ~ cigs, data = bwght))$r.squared   # ~ 0.023

## ================= PROBLEMS (your turn) =========================
## A regression has SST = 200 and SSR = 150.
SST <- 200; SSR <- 150
SSE  <- ______   # (a) explained sum of squares  (hint: SST - SSR)
R2   <- ______   # (b) R^2                        (hint: 1 - SSR/SST)
unexp <- ______  # (c) fraction unexplained       (hint: SSR/SST)
