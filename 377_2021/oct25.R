#Plotting a multiple regression model with k = 2 (two independent variables)

#install.packages('car') #Do this once
#install.packages('rgl') #Do this once
library(car)
library(rgl)

#Example 7.1 illustration
scatter3d(log(crime) ~ log(police) + enroll, data = campus)

#Illustration with apple dataset of omitted variables bias
library(wooldridge)
plot(econmath$act, econmath$colgpa, xlab = 'ACT score', ylab = 'College GPA', 
     main = 'College GPA vs ACT scores')
reg = lm(colgpa ~ act, data = econmath) #Simple linear regression
abline(reg) 
summary(reg)

reg_2 = lm(colgpa ~ act + hsgpa, data = econmath) # Multiple linear regression
summary(reg_2)

scatter3d(colgpa ~ hsgpa + act, data = econmath, zlab = 'ACT',
          xlab = 'HS GPA', ylab = 'College GPA') #Multiple linear regression

#Note that the slope associated with ACT decreases significantly once we control
#for high school GPA!

## PS7
# Q14
reg = lm(log(wage) ~ educ + IQ, data = wage2)

exp(reg$coefficients[1] + 
      reg$coefficients[2] * 12 +
      reg$coefficients[3] * 109)
