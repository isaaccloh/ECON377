install.packages('wooldridge') # To install wooldrige package

library(wooldridge)

# Example 4.8
View(rdchem) # View data
reg = lm(log(rd) ~ log(sales) + profmarg, data = rdchem)
summary(reg) # Summary of regression
b1 = reg$coefficients[2] # Coefficient
se1 = summary(reg)$coefficients[2,2]
p = 0.95
df = nrow(rdchem) - 2 - 1
c = qt((1+p)/2, df = df) 
b1 - c * se1 # Lower limit
b1 + c * se1 # Upper limit

# Easier way
confint(reg, level = p) # Caculates for all coefficients

# Problem 18, PS11
reg = lm(math10 ~ log(totcomp) + log(staff) + log(enroll), data= meap93)
mean = reg$coefficients[1] + reg$coefficients[2] * mean(log(meap93$totcomp)) + reg$coefficients[3] * mean(log(meap93$staff)) + reg$coefficients[4] * mean(log(meap93$enroll))
mean(meap93$math10) # Equivalent way, EASIER!

# Problem 5, PS11
reg = lm(log(rent) ~ log(pop) + log(avginc) + pctstu, data = rental)
summary(reg)
exp(reg$coefficients[1] + reg$coefficients[2] * log(36549) + reg$coefficients[3] * log(12499) + reg$coefficients[4] * 21)
