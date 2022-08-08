# Exercise 10.10 revisted
library(wooldridge)
reg = lm(colGPA ~ hsGPA + ACT + skipped, data = gpa1)
summary(reg)

# Computing two-sided p-value for ACT
dof = nrow(gpa1) - 3 - 1
tval = summary(reg)$coefficients[3,3]
p_ACT = (1 + pt(-abs(tval), df = dof) 
         - pt(abs(tval), df = dof))
print(p_ACT)

# Computing one-sided (positive alternative) p-value
p_ACT = 1 - pt(tval, df = dof)
print(p_ACT)

# Computing one-sided (negative alternative) p-value
tval = summary(reg)$coefficients[4,3]
p_skipped = pt(tval, df = dof)
print(p_skipped)

# Calculate a 97% confidence interval for ACT
p = 0.97
beta = reg$coefficients[3]
se_b = summary(reg)$coefficients[3,2]
c = qt((1 + p)/2, df = dof)
lowerbd = beta - se_b * c
upperbd = beta + se_b *c

