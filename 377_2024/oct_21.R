install.packages('car')
install.packages('rgl')
library(car)
library(rgl)
library(wooldridge)
?meap93
scatter3d(math10 ~ lnchprg + totcomp, data = meap93)

# Example of standard errors
reg = lm(log(wage) ~ educ, data = wage1)
n = nrow(wage1)
SSR = sum(reg$residuals^2)
SER = sqrt(SSR / (n-2)) # Standard error of reg
SSTX = (n-1) * var(wage1$educ) 
seb1 = SER / sqrt(SSTX)
seb1 # Standard error of b1hat

summary(reg)$sigma # SER shortcut
summary(reg)$coefficients[2,2] # Row, column: easier way to seb1
summary(reg)$coefficients[1,2]
