## This is an example script for getting started with the first swirl assignment
# Installing the swirl package
install.packages('swirl') # You only need to do this once. After installation, comment this out

# Loading the swirl package. You have to do this every time you start an R session
library(swirl)

# Installing the course we will use for ECN377
install_course_github('isaaccloh', '377_swirl') # Again, only do this once

# Beginning the lesson
swirl()

# When prompted, enter your last name and first initial, e.g. lohi
lohi

# Select the '377 swirl' class
1

# Select lesson 1, 'Basic Building Blocks'
1

# Follow the prompts in the swirl console to complete the lesson. Enter your code in an Rscript with comments

# Q1
5 + 7

# Q2 
x <- 5 + 7 # Alt + - 

# Q3 (continue following swirl prompts)
x

# Q4, storing result of operation in new variable
y <- x - 3

# Q5 viewing the new variable
y

# Q6 creating vector
z <- c(1.1, 9, 3.14)

# Q7
?c

# Q8
z

# Q9
c(z, 555, z)

# Q10 
z * 2 + 100

# Q11
my_sqrt <- sqrt(z-1)

# Q12 we are creating a new vector of length 3
1

# Q13
my_sqrt

# Q14
my_div <- z / my_sqrt

# Q15 
1

# Q16
my_div

# Q17 vector recycling
c(1, 2, 3, 4) + c(0, 10)

# Q18
c(1, 2, 3, 4) + c(0, 10, 100)

# Q19 
z * 2 + 1000

# Q20 
my_div

# Copy and paste in Github