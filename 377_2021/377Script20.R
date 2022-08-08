library(wooldridge)

# Exercise 11.3
reg = lm(log(rd) ~ log(sales) + profmarg, 
         data = rdchem)

# Getting beta1hat
beta1hat = reg$coefficients[2]

# Getting standard error of beta1hat
se_b1hat = summary(reg)$coefficients[2,2]

# Degrees of freedom
dof = nrow(rdchem) - 2 - 1
dof = reg$df.residual

# Getting c 
p = 0.95
c = qt((1 + p)/2, df = dof)

# Construct CI
lower_bd = beta1hat - se_b1hat * c
upper_bd = beta1hat + se_b1hat * c
cbind(lower_bd, upper_bd)

# Easier way to construct CI
confint(reg, level = p)

# PS10, Q6
q = 0.05
c = qt(q, df = nrow(gpa1) - 2 - 1)

# PS10, Q10
tval = -1.56
n = 190
k = 13
dof = n - k - 1
pval = (1 - pt(abs(tval), df = dof) 
    + pt(-abs(tval), df = dof))

# Exercise to illustrate prediction CI's
mydata = happiness
p = 0.99

# Create transformed variables
mydata$prestige_new = happiness$prestige - 4
mydata$educ_new = happiness$educ - 7
mydata$tvhours_new = happiness$tvhours - 6

# Run the regression
reg = lm(vhappy ~ prestige_new + educ_new 
         + tvhours_new, data = mydata)

confint(reg, level = p)
