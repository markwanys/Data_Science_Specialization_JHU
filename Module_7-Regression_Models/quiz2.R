q1 <- function() {
  x <- c(0.61, 0.93, 0.83, 0.35, 0.54, 0.16, 0.91, 0.62, 0.62)
  y <- c(0.67, 0.84, 0.6, 0.18, 0.85, 0.47, 1.1, 0.65, 0.36)
  fit <- lm(y~x)
  summary(fit)
}

q2 <- function() {
  x <- c(0.61, 0.93, 0.83, 0.35, 0.54, 0.16, 0.91, 0.62, 0.62)
  y <- c(0.67, 0.84, 0.6, 0.18, 0.85, 0.47, 1.1, 0.65, 0.36)
  n <- length(y)
  fit <- lm(y~x)
  se <- sqrt(sum(fit$residuals^2/(n-2)))
  se
}

q3 <- function() {
  data("mtcars")
  fit <- lm(mpg~wt, data=mtcars)
  wt_ave <- mean(mtcars$wt)
  predict(fit, newdata=data.frame(wt=c(wt_ave)),interval='confidence')
}

q5 <- function() {
  data("mtcars")
  fit <- lm(mpg~wt, data=mtcars)
  wt <- mtcars$wt
  n <- length(wt)
  x0 <-3
  
  sigma <- sqrt(sum(fit$residuals^2)/(n-2))
  print(summary(fit)$sigma)
  print(sigma)
  ssx <- with(mtcars, sum((wt-mean(wt))^2))
  beta0 <- summary(fit)$coefficients[1,1]
  beta1 <- summary(fit)$coefficients[2,1]
  se <- sigma * sqrt(1+1/n+(x0-mean(wt))^2/ssx)
  y_hat <- beta0+beta1*3
  
  print(y_hat + c(-1,1)*qt(0.975,fit$df)*se)
  predict(fit, newdata = data.frame(wt=c(3)),interval="prediction")
}

q6 <- function() {
  data("mtcars")
  fit <- lm(mpg~I(wt/2), data=mtcars)
  coef <- summary(fit)$coefficients
  coef[2,1] + c(-1,1)*qt(0.975,length(mtcars$wt)-2)*coef[2,2]
}

q10 <- function() {
  data("mtcars")
  fit_intercept_only <- lm(mpg~1, data=mtcars)
  rss_intercept_only <- sum(summary(fit_intercept_only)$residuals^2)
  fit_intercept_slope <- lm(mpg~wt, data=mtcars)
  rss_intercept_slope <- sum(summary(fit_intercept_slope)$residuals^2)
  rss_intercept_slope/rss_intercept_only
}

