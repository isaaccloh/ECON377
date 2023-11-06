# Clear environment
rm(list = ls())

library(wooldridge)
library(car)
library(rgl)

# MLR3 
?vote1

# Creating totexpend
vote1$totexpend = vote1$expendA + vote1$expendB
View(vote1)
lm(voteA ~ expendA + expendB + totexpend, data = vote1)

# Visualization of MLR3 failing
vote1$exA = vote1$expendA / vote1$totexpend
vote1$exB = vote1$expendB / vote1$totexpend
scatter3d(voteA ~ exA + exB, data = vote1)
