Q1 <-function(){
  
  library(httr)
  
  # 1. Find OAuth settings for github:
  #    http://developer.github.com/v3/oauth/
  oauth_endpoints("github")
  
  # 2. To make your own application, register at
  #    https://github.com/settings/developers. Use any URL for the homepage URL
  #    (http://github.com is fine) and  http://localhost:1410 as the callback url
  #
  #    Replace your key and secret below.
  myapp <- oauth_app("RGettingDataWeek2API",
                     key = "c8c86c8a769caa5e5db4",
                     secret = "ab9bfac90041be9a47b4fe8c89d4222b8c0ebbed"
  )
  
  # 3. Get OAuth credentials
  github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)
  
  # 4. Use API
  gtoken <- config(token = github_token)
  req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
  stop_for_status(req)
  
  json1=content(req)
  library(jsonlite)
  json2=jsonlite::fromJSON(toJSON(json1))
  json2$created_at[json2$name=="datasharing"]
}

Q2 <- function() {
  #download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv", destfile = "acs.csv")
  library(sqldf)
  acs<<-read.csv("acs.csv")
  sqldf("select pwgtp1, AGEP from acs where AGEP < 50")
}

Q3 <- function() {
  ans <- sqldf("select distinct AGEP from acs")
  print(ans)
  print(sum(unique(acs$AGEP)==ans)==length(unique(acs$AGEP)))
}

Q4 <- function() {
  url <- "http://biostat.jhsph.edu/~jleek/contact.html"
  con = url(url)
  htmlCode = readLines(con)
  print(nchar(htmlCode[10]))
  print(nchar(htmlCode[20]))
  print(nchar(htmlCode[30]))
  print(nchar(htmlCode[100]))
}

Q5 <- function() {
  df1 <<- read.fwf(file=url("https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"),widths=c(12, 7, 4, 9, 4, 9, 4, 9, 4),skip=4)
  sum(as.numeric(df1$V4))
  #<-readLines(url("https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"))[5]
  #lst<-strsplit(line5,split=" ")
  #lst[[1]][lst[[1]]!=""]
  #which(vect==1)
}

