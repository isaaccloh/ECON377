# Clear memory
rm(list = ls())

# Load wooldridge
library(wooldridge)

## Example 4.5
?hprice2

reg = lm(log(price) ~ log(nox) + log(dist) + rooms + stratio,
         data = hprice2)

alpha = 0.2

# Getting t-value
b1 = reg$coefficients[2]
se_1 = summary(reg)$coefficients[2,2]
tval = (b1 - (-1)) / se_1

# Critical value
df = reg$df.residual
c = qt(1 - alpha/2, df = df)
abs(tval) > c

## P-values
summary(reg)$coefficients

# P-values for previous hypothesis test
p = 2 * (1 - pt(abs(tval), df = df))
p

## PS 10
# Q10
reg = lm(log(salary) ~ log(sales) + roe + ros, data = ceosal1)
exp(reg$coefficients[1] + reg$coefficients[2] * log(9827)
    + reg$coefficients[3] * 36.1 + reg$coefficients[4] * 44)

# Q2/3: use Theorem 4.1 from Wooldridge

# Q7 
alpha = 4.37 / 100

# Q17
# Significance level is probability that we falsely reject
# the null hypothesis when it is true


# Q18
# Smaller sig level makes it harder to reject null hypothesis

# Q5
# beta_j is the c.p. effect of X_j on Y