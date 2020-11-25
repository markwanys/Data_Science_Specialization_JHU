library(dplyr)
library(lubridate)
library(plotly)

#download.file('https://covid.ourworldindata.org/data/owid-covid-data.csv','owid-covid-data.csv')
covid <- read.csv('owid-covid-data.csv', stringsAsFactors = FALSE,sep=',')
covid$date <- as.Date(covid$date,format="%Y-%m-%d")
covid$month_year <- format(covid$date, "%Y-%m")
covid$continent <- as.factor(covid$continent)
covid$location <- as.factor(covid$location)
covid <- covid %>%
  filter(across(c("total_cases_per_million","continent","location","gdp_per_capita"),~!is.na(.x)|(.x!=""))) %>%
  filter(location!=c('International','World')) %>%
  group_by(iso_code) %>%
  mutate(most_recent=max(date)) %>%
  filter(date==most_recent) %>%
  arrange(gdp_per_capita) %>%
  ungroup()

covid_top_gdp <- tail(covid,30)
covid_bot_gdp <- head(covid,30)
covid_top_gdp <- covid_top_gdp[,colSums(is.na(covid_top_gdp))!=nrow(covid_top_gdp)]
covid_bot_gdp <- covid_bot_gdp[,colSums(is.na(covid_bot_gdp))!=nrow(covid_bot_gdp)]
country_choices_top_gdp <- sort(as.character(unique(covid_top_gdp$location)))
country_choices_bot_gdp <- sort(as.character(unique(covid_bot_gdp$location)))

variables <- unique(c(names(covid_top_gdp),names(covid_bot_gdp)))
variable_choices <- sort(variables[sapply(covid[,variables],class)=="numeric"])