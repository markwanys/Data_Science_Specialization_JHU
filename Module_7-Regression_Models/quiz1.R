q1 <- function() {
  x <- c(0.18, -1.54, 0.42, 0.95)
  w <- c(2, 1, 3, 1)
  min <- sum(x*w)/sum(w)
  min
}

q2 <- function() {
  x <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)
  y <- c(1.39, 0.72, 1.55, 0.48, 1.19, -1.59, 1.23, -0.65, 1.49, 0.05)
  b1 <- sum(y*x)/sum(x^2)
  b1
}

q3 <- function() {
  data(mtcars)
  reg <- lm(mpg~wt, data=mtcars)
  reg$coefficients[2]
}

q4 <- function() {
  r <- 0.5
  ratio <- 2
  slope <- r*ratio
}

q5 <- function() {
  r <- 0.4
  quiz1 <- 1.5
  quiz2 <- r*quiz1
  quiz2
}

q6 <- function() {
  r <- 0.4
  quiz1 <- 1.5
  quiz2 <- r*quiz1
  quiz2
}

q7 <- function() {
  x <- c(8.58, 10.46, 9.01, 9.64, 8.86)
  x_norm <- (x-mean(x))/sd(x)
  x_norm[1]
}

q8 <- function() {
  x <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)
  y <- c(1.39, 0.72, 1.55, 0.48, 1.19, -1.59, 1.23, -0.65, 1.49, 0.05)
  reg <- lm(y~x)
  reg$coefficients[1]
}

q9 <- function() {
  x <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)
  mean(x)
}




