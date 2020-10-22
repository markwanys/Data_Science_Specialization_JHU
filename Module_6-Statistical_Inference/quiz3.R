q6 <- function() {
  x2<-4
  x1<-6
  s2<-0.5
  s1<-2
  n1<-100
  n2<-100
  df_num<- (s1^2/n1+s2^2/n2)^2
  df_den<- s1^4/(n1^3-n1^2)+s2^4/(n2^3-n2^2)
  df<-df_num/df_den
  (x1-x2)+c(-1,1)*qnorm(0.95)*sqrt(s1^2/n1+s2^2/n2)
}
        
q7 <- function() {
  x2<--3
  x1<-1
  s2<-1.5
  s1<-1.8
  n1<-9
  n2<-9
  df<-n2+n1-2
  vp_num<-(n1-1)*s1^2+(n2-1)*s2^2
  sp<-sqrt(vp_num/df)
  (x2-x1)+c(-1,1)*qt(0.95,df)*sp*sqrt(1/n1+1/n2)
}