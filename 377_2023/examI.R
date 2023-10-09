## Sample exam R file

# Q1
sum(c(4,9,7,3))

# Q2
x = c(1,8,2)
p = c(1/4, 1/2, 1/4)
sum(x * p)

# Q3
(92 - 80.8) / 80.8 * 100

# Q4
sqrt(5.3 - (-1.9)^2)

# Q5
1 / (sqrt(6.9) * sqrt(5.4))

# Q6
cov(c(4,3,6,9), c(2,7,5,3))

# Q7
x = c(9,9,4)
y = c(10,9,9)
p = c(1/2, 1/4, 1/4)
sum(x * y^2 * p)

# Q8
x = c(4,2,9)
y = c(9,3,6)
p = c(1/2, 1/4, 1/4)
exy = sum(x * y * p)
ex = sum(x * p)
ey = sum(y * p)
exy - ex * ey

# Q11
library(wooldridge)
cor(sleep75$educ, sleep75$exper)

# Q13
-0.14 * 88

# Q14
3 + 7 * 3981

# Q15
# Just report beta1

# Q16
0.37 * 1.6

# Q17 
# Always 0!

