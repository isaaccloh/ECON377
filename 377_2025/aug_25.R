# Entering list of numbers as vector, saving it as vec
vec = c(1,2,3,2,1) # These do basically the same thing
vec <- c(1,2,3,2,1) # This is the 'cool' R way to do this ALT + - 

# How to get help with a command
?mean

# Accessing specific elements of vectors
vec[1]

# How to access the last element of a vector
vec[length(vec)]

# Doing Example A.1 in R
delta_X = -50 
beta_1 = 0.27
delta_Y = beta_1 * delta_X
print(delta_Y)

# This is the easier way to do it
200 * 0.27

# Example A.2
-9.8 * -2 + 0.03 * 300 # Use R like a calculator 
