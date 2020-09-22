Q1 <- function() {
  #download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv",destfile="IdahoHousing.csv")
  df1 <- read.csv("IdahoHousing.csv")
  df2 <- df1[!is.na(df1$VAL),]$VAL
  length(df2[df2==24])
}

Q2 <- function() {
  #download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx", destfile="NatGasAcqProg.xlsx",method="curl")
  df1 <- read_excel("NatGasAcqProg.xlsx",col_names=FALSE)
  dat <- df1[18:23,7:15]
  colnames(dat) <<- dat[1,]
  dat <- dat[-c(1),]
  dat$Zip <- as.numeric(dat$Zip)
  dat$Ext <- as.numeric(dat$Ext)
  sum(dat$Zip*dat$Ext,na.rm=T)
}

Q3 <- function() {
  fileUrl <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
  doc <- xmlTreeParse(fileUrl,useInternal=TRUE)
  rootNode <- xmlRoot(doc)
  vc <- xpathSApply(rootNode,"//zipcode",xmlValue)
  length(vc[vc==21231])
}

Q4 <- function() {
  DT <<- fread("IdahoHousing2.csv")
  system.time(DT[,mean(pwgtp15),by=SEX])
}