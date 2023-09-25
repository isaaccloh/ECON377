# Question 1
x_vec = c(8.2, 2.5, 2.7)
p_vec = c(1/2, 1/4, 1/4)

sum(sin(x_vec) * p_vec)

# Question 4
x_vec = c(8.5, 8.8, 6)
p_vec = c(1/2, 1/4, 1/4) 
EXsq = sum(x_vec^2 * p_vec)
EX = sum(x_vec * p_vec)
EXsq - EX^2

# Question 5
xvec = c(5.4, 6, 6.2)
probvec = c(1/2, 1/4, 1/4)
EXsq = sum(x_vec^2 * p_vec) 
EX = sum(x_vec * p_vec)
sqrt(EXsq - EX^2)

# Question 7
x_vec = c(5, 3, 7)
y_vec = c(2, 7, 5)
p_vec = c(1/4, 1/4, 1/2)
EXY = sum(x_vec * y_vec * p_vec)
EX = sum(x_vec * p_vec)
EY = sum(y_vec * p_vec)
EXY - EX * EY

# Question 9
-0.8 / (sqrt(1.9) * 3.5)

# Question 12
x_vec = c(1, 1, 2, 2, 1)
y_vec = c(1, 2, 1, 2, 1)
cor(x_vec, y_vec)

# Question 17 
x_data = c(7,6,7,4,1)
var(x_data)
