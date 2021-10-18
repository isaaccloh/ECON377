# For 10/18

####################
#Exercise 8.5

reg6 = lm(narr86 ~ pcnv + ptime86 + qemp86, data = crime1)

reg7 = lm(narr86 ~ pcnv + avgsen + ptime86 +
            + qemp86, data = crime1)

summary(reg7)