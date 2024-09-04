# September 4

# Example of covariance/correlation
xvec = c(2,0,-2)
yvec = c(0,1,2) # Make sure they are in same order
cov(xvec, yvec) # Covariance
cor(xvec, yvec) # Correlation

# Install wooldridge
install.packages('wooldridge')
library(wooldridge)
View(bwght) # Views dataset
?bwght # Info about dataset
plot(bwght$cigs, bwght$bwght) # Plot data
cor(bwght$cigs, bwght$bwght) # Correlation of data