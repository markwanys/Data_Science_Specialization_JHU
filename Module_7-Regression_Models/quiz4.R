library(MASS)
data("InsectSprays")
library('dplyr')

q1 <- function() {
  shuttle <- mutate(shuttle, use = relevel(use, ref="noauto"))
  mdl <- glm(use~wind,family=binomial,data=shuttle)
  exp(predict(mdl, data.frame(wind=c('head'))))/exp(predict(mdl, data.frame(wind=c('tail'))))
}

q2 <- function() {
  shuttle <- mutate(shuttle, use = relevel(use, ref="noauto"))
  mdl <- glm(use~wind+magn,family=binomial,data=shuttle)
  exp(predict(mdl, data.frame(wind=c('head'),magn=c('Light'))))/exp(predict(mdl, data.frame(wind=c('tail'),magn=c('Light'))))
}

q4 <- function() {
  mdl <- glm(count~spray,family=poisson,data=InsectSprays)
  exp(predict(mdl, data.frame(spray=c('A'))))/exp(predict(mdl, data.frame(spray=c('B'))))
}

q6 <- function() {
  x <- -5:5
  y <- c(5.12, 3.93, 2.67, 1.87, 0.52, 0.08, 0.93, 2.05, 2.54, 3.87, 4.97)
  knots <- c(0)
  splineTerms <- sapply(knots, function(knot) (x>knot)*(x-knot))
  xMat <- cbind(x,splineTerms)
  mdl <<- lm(y~xMat)
  yhat <- predict(mdl)
  plot(x,y,frame=FALSE,pch=21,bg="lightblue",cex=2)
  lines(x,yhat,col="red",lwd=2)
  slope_post_knot <-  mdl$coef[3]+mdl$coef[2]
  slope_post_knot
}


