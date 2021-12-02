library(dplyr)
data <- read_csv("adventofcode2.csv", col_names = FALSE)
df <- data.frame(direction=sapply(strsplit(data$X1," "), `[`, 1), amount=as.numeric(sapply(strsplit(data$X1," "), `[`, 2))) # Split the string into two parts

# Task 1
df1 <- df %>%
  group_by(direction) %>%
  summarise(Sum=sum(amount))
df1[4,] <- c("depth", df1[1,2]-df1[3,2]) # Make a depth row=down-up
df1 <- filter(df1, direction=="forward" | direction=="depth") # remove up and down rows
prod(df1[,2]) # Multiply the two together


# Task 2:
# If down, increase aim by X
# If up, increase aim by -X
# If forward, increase horiz by X, increase depth by X*aim
df2 <- df
aim <- 0
horizontal <- 0
depth <- 0
for (i in 1:length(df2$direction)) {
  if (df2[i,1]=="down") {
    aim <- aim + df2[i,2]
  } else if (df2[i,1]=="up") {
    aim <- aim - df2[i,2]
  } else {
    horizontal <- horizontal + df2[i,2]
    depth <- depth + aim*df2[i,2]
  }
}
cat("Horizontal: ", horizontal, ", Depth: ", depth, ", Product: ", horizontal*depth)