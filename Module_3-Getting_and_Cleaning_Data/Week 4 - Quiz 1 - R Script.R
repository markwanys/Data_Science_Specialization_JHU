Q1 <- function() {
  #download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv",destfile = "IdahoHousing3.csv") 
  df1 <- read.csv("IdahoHousing3.csv")
  lst <-strsplit(names(df1),split="wgtp")
  lst[[123]]
}

Q2 <- function() {
  #download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv",destfile = "GDP2.csv") 
  gdp <- read.csv("GDP2.csv",skip=3)
  gdp <- gdp[-c(1),]
  gdp <<- gdp[(gdp$Ranking!="") & (gdp$Economy!=""),]
  mean(as.numeric(gsub(",","",gdp$US.dollars.)),na.rm=TRUE)
}

Q2()

Q3 <- function() {
  length(grep("^United",gdp$Economy))
}

Q4 <- function() {
  #download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv",destfile = "education2.csv") 
  edu <- read.csv("education2.csv")
  merged_df <<- merge(gdp,edu,by.x="X",by.y="CountryCode",all.x=TRUE)
  length(grep("^Fiscal year end: June",merged_df$Special.Notes))
}

Q5 <- function() {
  library(quantmod)
  amzn = getSymbols("AMZN",auto.assign=FALSE)
  sampleTimes = index(amzn)
  sampleTimes_lubri <- ymd(sampleTimes)
  print(sum(year(sampleTimes_lubri)==2012))
  print(sum((year(sampleTimes_lubri)==2012) & (wday(sampleTimes_lubri)==2)))
}