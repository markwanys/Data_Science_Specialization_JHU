best <- function(state, outcome){
  ## Read outcome data
  outcome_data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")

  ## Check that state and outcome are valid
  state_upper<-toupper(state)
  outcome_lower<-tolower(outcome)
  if (sum(outcome_data$State==state_upper)==0) stop("invalid state")
  if (outcome_lower!="heart attack" & outcome_lower!="heart failure" & outcome_lower!="pneumonia") stop("invalid outcome")
  
  ## Return hospital name in that state with lowest 30-day death
  ## rate
  CapStr <- function(x) {
    a <- strsplit(x, " ")[[1]]
    paste(toupper(substring(a,1,1)),substring(a,2),sep="",collapse=".")
  }
  
  outcome_format <- paste("Hospital.30.Day.Death..Mortality..Rates.from.", CapStr(outcome_lower),sep="")
  
  outcome_data_reduced <- outcome_data[,c("Hospital.Name","State",outcome_format)]
  outcome_data_reduced[outcome_format] <- as.numeric(outcome_data_reduced[[outcome_format]])
  outcome_data_reduced_noNA <- outcome_data_reduced[!is.na(outcome_data_reduced[,outcome_format]),]
  
  minimum <- tapply(outcome_data_reduced_noNA[[outcome_format]],outcome_data_reduced_noNA$State,min)[state]

  best_hospitals <- outcome_data_reduced_noNA[outcome_data_reduced_noNA[outcome_format]==minimum &
                                                outcome_data_reduced_noNA["State"]==state ,"Hospital.Name"]
  sort(best_hospitals)[[1]]

  
}