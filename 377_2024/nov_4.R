library(wooldridge)

# Example of multicollinearity
?vote1
vote1$totexpend = vote1$expendA + vote1$expendB
View(vote1)
reg = lm(voteA ~ expendA + expendB + totexpend, data = vote1)
summary(reg) # Perfect collinearity

## Example 3.6
reg_SLR = lm(log(wage) ~ educ, data = wage2)
summary(reg_SLR)

reg_MLR = lm(log(wage) ~ educ + IQ, data = wage2)
summary(reg_MLR)

# PS8, Q15
reg_d = lm(faminc ~ cigs, data = bwght)
d1tilde = reg_d$coefficients[2]

reg_hat = lm(bwght ~ cigs + faminc, data = bwght)
b2hat = reg_hat$coefficients[3]

# PS8, Q10
sum(wage1$female == 0 & wage1$nonwhite == 1) / nrow(wage1)
