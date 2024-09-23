library(wooldridge)

# Example dataset
View(beauty)
nrow(beauty)

# Calculate b1hat
b1hat = cov(beauty$looks, beauty$wage) /
  var(beauty$looks)

b0hat = mean(beauty$wage) - b1hat * 
  mean(beauty$looks)

lm(wage ~ looks, data = beauty)
