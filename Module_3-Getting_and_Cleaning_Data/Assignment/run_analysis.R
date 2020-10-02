run_analysis <- function(){
  #download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",destfile="assignment.zip")
  
  # Read tab separated files into data frames.
  X_train <- read.table(".\\UCI HAR Dataset\\train\\X_train.txt")
  y_train <- read.table(".\\UCI HAR Dataset\\train\\y_train.txt")
  subject_train <- read.table(".\\UCI HAR Dataset\\train\\subject_train.txt")
  
  X_test <- read.table(".\\UCI HAR Dataset\\test\\X_test.txt")
  y_test <- read.table(".\\UCI HAR Dataset\\test\\y_test.txt")
  subject_test <- read.table(".\\UCI HAR Dataset\\test\\subject_test.txt")
  
  activity_labels <- read.table(".\\UCI HAR Dataset\\activity_labels.txt")
  features <- read.table(".\\UCI HAR Dataset\\features.txt")
  
  # Rename activity labels and features column names. Rename subject column headers.
  names(subject_train) <- "subject"
  names(subject_test) <- "subject" 
  names(activity_labels) <- c("y_numeric","y_descriptive")
  names(features) <- c("feature_numeric","feature_descriptive")
  
  # Row bind test and train sets. Column bind test and train sets with subject set (row-binded).
  y <- rbind(y_train,y_test)
  X <- rbind(X_train,X_test)
  subject <- rbind(subject_train,subject_test)
  names(y) <- "y_numeric"
  names(X) <- features$feature_descriptive
  
  # Extract mean and std features.
  col_mean_std <- grep("(\\bmean|std\\(\\))",names(X))
  X_mean_std <- X[,col_mean_std]
  
  # Merge y with activity labels. Use descriptive names for y-labels and feature variables.
  y_act <- merge(y,activity_labels, by="y_numeric",all.x=TRUE)
  
  # Column bind features with labels. Then column bind with subject column.
  Xy <- cbind(cbind(X_mean_std,y_act),subject)
  Xy <- Xy[,-grep("y_numeric",names(Xy))]
  
  # Write dataframe into "tidydataset.txt".
  library("dplyr")
  output <- Xy %>%
    group_by(y_descriptive,subject) %>%
    summarise_all(funs(mean),na.rm=TRUE)
  
  write.table(output, "./tidydataset.txt", row.names = FALSE)
  
}

run_analysis()