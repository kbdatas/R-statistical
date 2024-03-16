# R Programming Practice

####################### This is a comments: #####################
#### Use number sign# to explain the single or block of code ####
#################################################################

# Basic synax
print("Welcome to R")

# Without using the print function
"Welcome to R"

# Different variable in R
rvar1 <- "my first var1"
length(rvar1)
print(rvar1)

rvar2 <- c("pencil", "ballpen", "pen") 
rvar2[2] # Print index 2 which is "pencil"
str(rvar2) # Display the structure of rvar2
length(rvar2)

# Build in functions in R
print("Welcome to R") # Displays an R object on the R console.
min(2:10) # Calculates the minimum of numeric vector
max(2:10) # Calculates the maximum of a numeric vector.
sum(1:2) # Calculates the sum of a numeric vector.
mean(3:15) #Calculates the mean of a numeric vector.
range(1,2,3,4,5) # Ge the range
sequence(4,8) # Sequence function, show number sequence

# ncol # Function
# Let us crate a data frame for ncol function
data_frame <- data.frame(
  apple_price = c(2, 4, 6),
  mango_price = c(10, 20, 30),
  banana_price = c(6, 12, 24)
)
data_frame
max(data_frame[2]) # Show the max price of Mango Price which is in index 2
min(data_frame[2]) # Show the min price of Mango Price which is in index 2

# get the number of columns
ncol(data_frame)

# sum the number in rows
rowSums(data_frame)

# sum the number columns
colSums(data_frame)

# For loop function
for (i in 1:5)
  print(i)

# While loop function
a = 0
while (a < 10) {
  print(a)
  a=a+1
}

# Repeat loop function
sum <- 0  
{  
  a1<-readline(prompt="Enter any integer value below 5: " )  
  a1<-as.integer(a1)  
}  
repeat{  
  sum<-sum+a1  
  a1=a1+1  
  if(a1>5){  
    break  
  }  
}  
cat("The sum of numbers from the repeat loop is: ",sum)

# Set working directory
setwd("C:\\directory path\\")

# Read CSV file
read_csv_data <- read.csv("csvfile.csv")



