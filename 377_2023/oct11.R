# Clear environment
rm(list = ls())

# Load wooldridge
library(wooldridge)

# Run example regression
reg = lm(bwght ~ cigs, data = bwght)

# Unexplained part
reg$residuals

# Explained part
reg$fitted.values

# Histogram of cigs smoked
hist(bwght$cigs)

## Showing that SST = (n-1) * var(Y)
SST = sum((bwght$bwght - mean(bwght$bwght))^2)

# Alternative method
n = nrow(bwght)
SST_2 = (n - 1) * var(bwght$bwght)
SST == SST_2

## Showing that SSE = (n-1) * var(Yhat)
SSE = sum((reg$fitted.values - mean(bwght$bwght))^2)

# Alternative method
SSE_2 = (n - 1) * var(reg$fitted.values)
SSE == SSE_2

## Showing that SSR = (n-1) * var(residuals)
SSR = sum(reg$residuals^2)

# Alternative method
SSR_2 = (n-1) * var(reg$residuals)
SSR == SSR_2

## Showing that SST = SSR + SSE
SST 
SSR + SSE

## Calculating R-squared
SSE / SST # Method 1
1 - SSR / SST # Method 2
summary(reg)$r.squared # Best method
