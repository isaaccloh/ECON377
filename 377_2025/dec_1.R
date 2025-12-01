library(wooldridge)

# Example 4.3
# Step one:
reg = lm(colGPA ~ hsGPA + ACT + skipped, data = gpa1)
summary(reg)

# T-value is betaj / se(betaj)
b3 = reg$coefficients[4]
seb3 = summary(reg)$coefficients[4,2]
tval3 = b3 / seb3

# Step two:
alpha = 0.05
df = nrow(gpa1) -3 -1 
c = qt(1 - alpha/2, df = df)

# Step three:
tval3
c
abs(tval3) > c # Reject

# Getting p-value
2 * (1 - pt(abs(tval3), df = df))
summary(reg) 

# Getting confidence intervals
p = 0.95
confint(reg, level = p)
