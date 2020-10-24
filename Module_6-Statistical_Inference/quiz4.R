q1 <- function() {
  base <- c(140,138,150,148,135)
  wk2 <- c(132,135,151,146,130)
  diff <- wk2-base
  t.test(diff)$p.value
}

q2 <- function() {
  ave <- 1100
  s <- 30
  n <- 9
  se <- 30/sqrt(9)
  1100+c(-1,1)*qt(0.975,n-1)*se
}

q4 <- function() {
  lambda <- 1/100
  poisson.test(10,T=1787,r=0.01, alternative="less")$p.value
}

q5 <- function() {
  n1<-9
  n2<-n1
  x1<--3
  x2<-1
  s1<-1.5
  s2<-1.8
  df<-n1+n2-2
  sp<-sqrt((s1^2+s2^2)/2)
  t <- (1--3)/(sp*sqrt(1/n1+1/n2))
  2*pt(t,df,lower.tail=FALSE)
}

q5 <- function() {
  n1<-9
  n2<-n1
  x1<--3
  x2<-1
  s1<-1.5
  s2<-1.8
  df<-n1+n2-2
  sp<-sqrt((s1^2+s2^2)/2)
  t <- (1--3)/(sp*sqrt(1/n1+1/n2))
  2*pt(t,df,lower.tail=FALSE)
}

q7 <- function(){
  n<-100
  h_a<-0.01
  s<-0.04
  power.t.test(n=n,delta=h_a-0,sd=s,type="one.sample",alternative = "one.sided")$power
}

q8 <- function(){
  power<-0.90
  h_a<-0.01
  s<-0.04
  power.t.test(power=0.9,delta=h_a-0,sd=s,type="one.sample",alternative = "one.sided")$n
}

