rankall <- function(outcome, num = "best") {
  ## Read outcome data
  outcome_data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  ## Check that outcome and num are valid
  outcome_lower<-tolower(outcome)
  if (outcome_lower!="heart attack" & outcome_lower!="heart failure" & outcome_lower!="pneumonia") stop("invalid outcome")
  if (num!="best" & num!="worst" & !is.numeric(num)) stop("invalid rank")
  
  rankfunc <- function(x){
    if (num=="best") return(1) 
    else if (num=="worst") return(nrow(x))
    else return(num)
  }
  
  ## For each state, find the hospital of the given rank
  CapStr <- function(x) {
    a <- strsplit(x, " ")[[1]]
    paste(toupper(substring(a,1,1)),substring(a,2),sep="",collapse=".")
  }
  
  outcome_format <- paste("Hospital.30.Day.Death..Mortality..Rates.from.", CapStr(outcome_lower),sep="")
  
  outcome_data_reduced <- outcome_data[,c("Hospital.Name","State",outcome_format)]
  outcome_data_reduced[outcome_format] <- as.numeric(outcome_data_reduced[[outcome_format]])
  outcome_data_reduced_noNA <- outcome_data_reduced[!is.na(outcome_data_reduced[,outcome_format]),]
  
  df_split <- split(outcome_data_reduced_noNA,outcome_data_reduced_noNA$State)
  df_split_ranked <- lapply(df_split, function(x) x[order(x[[outcome_format]],x$Hospital.Name),])
  df_split_ranked2 <- lapply(df_split_ranked, function(x) x[rankfunc(x),])
  df_split_ranked2_comb <- do.call('rbind',df_split_ranked2)
  df_split_ranked2_comb <<- df_split_ranked2_comb[,!(names(df_split_ranked2_comb) %in% outcome_format)]
  
  ## Return a data frame with the hospital names and the
  ## (abbreviated) state name
  df_split_ranked2_comb[,"State"] <- rownames(df_split_ranked2_comb)
  colnames(df_split_ranked2_comb) <- c("hospital","state")
  df_split_ranked2_comb
  
}