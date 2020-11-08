q1 <- function(){
  data("mtcars")
  mtcars$cyl <- as.factor(mtcars$cyl)
  fit <- lm(mpg~cyl+wt,mtcars)
  summary(fit)$coefficients
}

q2 <- function(){
  data("mtcars")
  mtcars$cyl <- as.factor(mtcars$cyl)
  fit <- lm(mpg~cyl,mtcars)
  fit_adj <- lm(mpg~cyl+wt,mtcars)
  co <- summary(fit)$coefficients['cyl8','Estimate']
  co_adj <- summary(fit_adj)$coefficients['cyl8','Estimate']
  matrix(c(co,co_adj),nrow=2,ncol=1,dimnames = list(c('Unadjusted','Adjusted'),c('Estimate')))
}

q3 <- function(){
  data("mtcars")
  library(lmtest)
  mtcars$cyl <- as.factor(mtcars$cyl)
  fit <- lm(mpg~cyl+wt,mtcars)
  fit_int <- lm(mpg~cyl+wt+wt*cyl,mtcars)
  lrtest(fit, fit_int)
}

q4 <- function(){
  data("mtcars")
  mtcars$cyl <- as.factor(mtcars$cyl)
  fit <- lm(mpg ~ I(wt * 0.5) + factor(cyl), data = mtcars)
  summary(fit)$coefficients
}

q5 <- function(){
  x <- c(0.586, 0.166, -0.042, -0.614, 11.72)
  y <- c(0.549, -0.026, -0.127, -0.751, 1.344)
  fit <- lm(y~x)
  max(hatvalues(fit))
}

q6 <- function(){
  x <- c(0.586, 0.166, -0.042, -0.614, 11.72)
  y <- c(0.549, -0.026, -0.127, -0.751, 1.344)
  fit <- lm(y~x)
  idx <- which(hatvalues(fit)==max(hatvalues(fit)))
  dfbeta(fit)[idx,'x']
}

q6 <- function(){
  x <- c(0.586, 0.166, -0.042, -0.614, 11.72)
  y <- c(0.549, -0.026, -0.127, -0.751, 1.344)
  fit <- lm(y~x)
  idx <- which(hatvalues(fit)==max(hatvalues(fit)))
  dfbeta(fit)[idx,'x']
}


