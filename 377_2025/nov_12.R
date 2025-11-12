library(wooldridge)

# Perfect colinearity
View(vote1)
vote1$totexpend = vote1$expendA + vote1$expendB
reg = lm(voteA ~ expendA + expendB + totexpend, data = vote1)
summary(reg)

# Example 3.6
reg = lm(log(wage) ~ educ, data = wage1)
summary(reg)
