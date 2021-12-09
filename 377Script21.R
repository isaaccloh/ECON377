# Q13, PS10
n = 62
k = 15
dof = n - k - 1
tval = -3.14
pt(tval, df = dof)

# Example of what R does
library(wooldridge)
reg = lm(wage ~ educ, data = wage1)
summary(reg)

# Q17, PS10
reg = lm(price ~ bdrms + assess + sqrft, data = hprice1)
confint(reg, level = .99)

# Example 12.1
reg = lm(wage ~ female + educ + exper + tenure, data = wage1)
summary(reg)

# Example 12.2
reg = lm(log(wage) ~ belavg + abvavg + educ + exper, 
         data = subset(beauty, female == 1))
summary(reg)
