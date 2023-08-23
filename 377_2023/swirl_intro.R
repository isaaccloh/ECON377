## Getting Swirl set up. Hit Ctrl + Enter (or Cmd + Enter on Macs) to run a line

# Install swirl
install.packages('swirl') # you only need to do this once

# Load swirl
library(swirl) # do this at the beginning of every session

# Install our course swirl
install_course_github("ikebf", "377_swirl") # you should have to do this only once

# Beginning swirl
swirl() # do this when you want to start swirl
bye() # this exits swirl at any point. Your progress is saved
swirl::info() # this gives you a handy reference for swirl commands

## PLEASE ENTER YOUR NAME LIKE THIS: lohi (last name, first initial)

## IN CASE I MESS YOU UP and we have to reinstall the 377_swirl course, uncomment
## the following three lines and run them all once
# library(swirl)
# uninstall_course("377_swirl")
# install_course_github("ikebf", "377_swirl")