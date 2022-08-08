# For 11/1

# Clear environment
rm(list=ls())

# Set working directory
setwd("C:/Users/Isaac/OneDrive - UNC-Wilmington/Econometrics/R")

# Load Wooldridge package
library(wooldridge)

####################
# Exercise 9.5

# First, regress wage on educ, exper, and tenure in wage1
reg3 = lm(wage ~ educ + exper + tenure, data = wage1)

# Set degrees of freedom to n - k - 1 (note k = 3)
n = nrow(wage1)
df = n - 3 - 1

# Get hsigma^2 estimate: first calculate SSR then divide by df. Then take square roots
SSR = sum(reg3$residuals^2)
hsigmasq = SSR/df
hsigma = sqrt(hsigmasq)

# Get R^2 from regressing educ on exper and tenure
reg3a = lm(educ ~ exper + tenure, data = wage1)
Rsqeduc = summary(reg3a)$r.squared

# Calculate the SST for educ
SSTeduc = var(wage1$educ) * (n-1)

# Finally, calculate the standard error for beta1 (coefficient on educ)
se_educ = hsigma/sqrt(SSTeduc * (1 - Rsqeduc))

# Compare this value with what you got from the lm command
summary(reg3)