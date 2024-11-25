## Example 4.5
library(wooldridge)

reg = lm(log(price) ~ log(nox) + log(dist) + rooms + stratio, data = hprice2)
summary(reg)

b1 = reg$coefficients[2]
se1 = summary(reg)$coefficients[2,2]
t1 = (b1 - (-1)) / se1 
alpha = 0.05
df = nrow(hprice2) - 4 - 1
c = qt(1-alpha/2, df = df)
abs(t1) > c

# P-value
2 * (1 - pt(abs(t1), df = df))
