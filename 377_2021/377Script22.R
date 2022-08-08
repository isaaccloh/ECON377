library(wooldridge)

# PS10, Q15
reg = lm(price ~ bdrms + assess + sqrft, data = hprice1)

se = summary(reg)$coefficients[3,2]

p = 0.97

dof = nrow(hprice1) - 3 - 1

c = qt((1 + p)/2, df = dof)

lowerbd = reg$coefficients[3] - se * c
upperbd = reg$coefficients[3] + se*c

cbind(lowerbd, upperbd)

# Easier way
confint(reg, level = p)

# Example of prediction

reg = lm(lwage ~ educ + exper + south + union, data = cps78_85)
reg$coefficients

# Predicting log wage for a person with our characteristics
predicted_logwage = (reg$coefficients[1] + reg$coefficients[2] * 4 
  + reg$coefficients[3] * 30 + reg$coefficients[4] * 1
  + reg$coefficients[5] * 0)

exp(predicted_logwage)

# Now get the confidence interval
p = 0.99
# Creating a new dataset
mydata = cps78_85

# Define new variables in mydata
mydata$educnew = mydata$educ - 4
mydata$expernew = mydata$exper - 30
mydata$southnew = mydata$south - 1
mydata$unionnew = mydata$union - 0

# Regress lwage on new vars, report conf int
reg = lm(lwage ~ educnew + expernew + southnew + unionnew,
         data = mydata)

confint(reg, level = p)

# Colonial style house question
reg = lm(price ~ sqrft + lotsize + colonial, data = hprice1)
summary(reg)

# Catholic babies
fertil2$interaction = fertil2$educ * fertil2$bicycle
reg = lm(children ~ educ + bicycles + interaction, data = fertil2 )
reg$coefficients

ls(fertil2)

subset(fertil2, bicycle == 1 & catholic ==1)
