## ECN 377 - Day 1  |  run this after you install R, to check your setup.
## (This is what we did together in class. Data comes from `wooldridge`.)

library(wooldridge)      # course datasets
data("wage1")            # 526 US workers, 1976

## Do people with more education earn more?
plot(wage1$educ, wage1$wage,
     xlab = "education (years)", ylab = "wage ($/hr, 1976)")
abline(lm(wage ~ educ, data = wage1), col = "steelblue", lwd = 3)

## Adding up and averaging -- put YOUR class poll numbers inside c(...):
songs <- c(3, 0, 12, 5, 8)   # how many Taylor Swift songs in the last 24h?
sum(songs)                    # add them up
length(songs)                 # how many
sum(songs) / length(songs)    # the mean, by hand
mean(songs)                   # ...or just mean()
