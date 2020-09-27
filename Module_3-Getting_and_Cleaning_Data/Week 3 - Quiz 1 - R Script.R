Q1 <- function() {
  #download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", destfile = "IdahoHousingWk3Quiz.csv")
  agriculture <- read.csv("IdahoHousingWk3Quiz.csv")
  agricultureLogical <- (agriculture$ACR==3 & agriculture$AGS==6)
  which(agricultureLogical)
}

Q2 <- function() {
  #download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg", destfile = "Q2.jpg",mode="wb")
  img <- readJPEG("Q2.jpg",native=TRUE)
  quantile(img,c(0.3,0.8))
}

Q3 <- function() {
  #download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv", destfile = "GDP.csv",mode="wb")
  #download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv", destfile = "education.csv",mode="wb")
  library("dplyr")
  gdp <- read.csv("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv",skip=3,stringsAsFactors = FALSE) 
  gdp <- tibble(gdp) %>%
  select(c(1,2,4,5))
  
  names(gdp)[[1]]<-"CountryID"
  names(gdp)[[4]]<-"GDP_in_MM_USD"
  gdp <- filter(gdp, CountryID!="",Ranking!="")
  
  education <- read.csv("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv")
  education <- tibble(education)
  
  print(paste("# of matches = ",sum(gdp$CountryID %in% education$CountryCode)))
  merged_df <- merge(gdp,education, by.x="CountryID",by.y="CountryCode", all.x=TRUE)
  merged_df_sorted <<- arrange(merged_df, desc(as.numeric(Ranking)))
  print(paste("13th Country = ",merged_df_sorted$Long.Name[[13]]))
  
}
Q3()

Q4 <- function() {
  group_by(merged_df_sorted,Income.Group) %>%
  summarize(Mean = mean(as.numeric(Ranking), na.rm=TRUE))
}

Q5 <- function() {
  breaks <- quantile(as.numeric(merged_df_sorted$Ranking),probs=seq(0,1,0.2),na.rm=TRUE)
  merged_df_sorted$cuts <- cut(as.numeric(merged_df_sorted$Ranking),breaks=breaks)
  table(merged_df_sorted$cuts,merged_df_sorted$Income.Group)
  
}