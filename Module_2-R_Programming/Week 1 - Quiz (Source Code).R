## Question 4
##If I execute the expression x <- 4L in R, what is the class of the object `x' as determined by the `class()' function?
x<-4L
class(x)

## Question 5
##What is the class of the object defined by x <- c(4, TRUE)?
x<-c(4,TRUE)
class(x)

## Question 6
##If I have two vectors x <- c(1,3, 5) and y <- c(3, 2, 10), what is produced by the expression rbind(x, y)?
x<-c(1,3,5)
y<-c(3,2,10)
rbind(x,y)

## Question 8
##Suppose I have a list defined as x <- list(2, "a", "b", TRUE). What does x[[1]] give me? Select all that apply.
x <- list(2, "a", "b", TRUE)
x[[1]]

## Question 9
##Suppose I have a vector x <- 1:4 and y <- 2:3. What is produced by the expression x + y?
x <- 1:4
y<-2:3
x+y

## Question 11
## Use the Week 1 Quiz Data Set to answer questions 11-20.
## In the dataset provided for this Quiz, what are the column names of the dataset?
x<-read.csv('hw1_data.csv')
x

## Question 12
## Extract the first 2 rows of the data frame and print them to the console. What does the output look like?
x[1:2,]

## Question 13
## How many observations (i.e. rows) are in this data frame?
dim(x)

## Question 14
## Extract the last 2 rows of the data frame and print them to the console. What does the output look like?
tail(x,2)

## Question 15
## What is the value of Ozone in the 47th row?
x[47,]

## Question 16
## How many missing values are in the Ozone column of this data frame?
sum(is.na(x$Ozone))

## Question 17
## What is the mean of the Ozone column in this dataset? Exclude missing values (coded as NA) from this calculation.
mean(x$Ozone, na.rm = TRUE)

## Question 18
## Extract the subset of rows of the data frame where Ozone values are above 31 and Temp values are above 90. What is the mean of Solar.R in this subset?
mean(x[x$Ozone>31 & x$Temp>90,]$Solar.R, na.rm=TRUE)

## Question 19
## What is the mean of "Temp" when "Month" is equal to 6?
mean(x[x$Month==6,]$Temp, na.rm=TRUE)

## Question 20
## What was the maximum ozone value in the month of May (i.e. Month is equal to 5)?
max(x[x$Month==5,]$Ozone,na.rm=TRUE)
