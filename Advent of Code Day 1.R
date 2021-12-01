#Task 1:
data <- read_csv("adventofcode1.csv", col_names = FALSE)
sum(diff(data$X1) > 0) # count when increased

#Task 2:
library(zoo)
rolled_3 <- rollapply(data$X1, 3, sum) # Calculate a rolling sum, of 3
sum(diff(rolled_3) > 0) # count when increased