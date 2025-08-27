# General way to calculate percent changes
x_new = 6
x_old = 4
pct_change = (x_new - x_old) / x_old * 100
print(pct_change)

# Calculating sample variance/standard deviation
x_vec = c(3,2,4) # Ctrl + enter to run

# Step one: subtract off the mean from the data
x_vec - mean(x_vec)

# Step two: square the results
(x_vec - mean(x_vec))**2

# Step three: sum the results, divide by n-1
SX2 = sum((x_vec - mean(x_vec))**2) / (length(x_vec) - 1)
print(SX2)

# Now, get the sample standard deviation
SX = sqrt(SX2)
print(SX)

# Easier R way to get sample variance, standard deviation
var(x_vec) # Sample variance
sd(x_vec) # Sample standard deviation
