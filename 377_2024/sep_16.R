# Sept 16
# Visualization of conditional expectation
# install.packages('wooldridge') # Only do this once
library(wooldridge)

View(wage1)
?wage1
plot(wage1$educ, wage1$wage)

# SAMPLE conditional expectation
mean(wage1$wage[wage1$educ == 12])

# Gauss
sum(1:100)
