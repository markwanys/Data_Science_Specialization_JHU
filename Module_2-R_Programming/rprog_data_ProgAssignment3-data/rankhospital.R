rankhospital <- function(state, outcome, num = "best") {
  ## Read outcome data
  outcome_data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
    ## Check that state, outcome, and num are valid
  state_upper<-toupper(state)
  outcome_lower<-tolower(outcome)
  if (sum(outcome_data$State==state_upper)==0) stop("invalid state")
  if (outcome_lower!="heart attack" & outcome_lower!="heart failure" & outcome_lower!="pneumonia") stop("invalid outcome")
  if (num!="best" & num!="worst" & !is.numeric(num)) stop("invalid rank")
  
  rankfunc <- function(x){
    if (num=="best") return(1) 
    else if (num=="worst") return(nrow(x))
    else return(num)
  }
  
  ## Return hospital name in that state with the given rank
  CapStr <- function(x) {
    a <- strsplit(x, " ")[[1]]
    paste(toupper(substring(a,1,1)),substring(a,2),sep="",collapse=".")
  }
  
  outcome_format <- paste("Hospital.30.Day.Death..Mortality..Rates.from.", CapStr(outcome_lower),sep="")
  
  outcome_data_reduced <- outcome_data[,c("Hospital.Name","State",outcome_format)]
  outcome_data_reduced[outcome_format] <- as.numeric(outcome_data_reduced[[outcome_format]])
  outcome_data_reduced_noNA <- outcome_data_reduced[!is.na(outcome_data_reduced[,outcome_format]),]
  
  df_split <- split(outcome_data_reduced_noNA,outcome_data_reduced_noNA$State)
  df_split_state <- df_split[[state]]
  df_split_state_ranked <- df_split_state[order(df_split_state[[outcome_format]],df_split_state$Hospital.Name),]
  num <- rankfunc(df_split_state_ranked)
  df_split_state_ranked[num,"Hospital.Name"]
}