#install.packages("devtools")
#devtools::install_github("jhudsl/collegeIncome")
library(collegeIncome)
data(college)
#devtools::install_github("jhudsl/matahari")
library(matahari)
library(ggplot2)
library(GGally)
library(stats)

dance_start(value = FALSE, contents = FALSE)
names(college)
dim(college)
summary(college)
df_overall<-data.frame(row.names=unique(college$major_category))

for (category in unique(college$major_category)){
  college$major_category <- as.factor(college$major_category)
  college$major_category <- relevel(college$major_category,category)
  fit <- lm(median~major_category,college)
  df <- data.frame(summary(fit)$coef[c(-1),'Pr(>|t|)'])
  df[paste("major_category",category,sep=""),] <- NA
  colnames(df) <- category
  rownames(df) <- sapply(rownames(df),function(i) strsplit(i, "major_category")[[1]][[2]])
  df_overall<-merge(df_overall,df, by.x=0,by.y=0, all.x=TRUE)
  rownames(df_overall) <- df_overall$Row.names
  df_overall$Row.names <- NULL
}

mask1 <- df_overall <= 0.05
mask2 <- df_overall > 0.05
mask3 <- is.na(df_overall)

df_overall[mask1] <- "Different Income"
df_overall[mask2] <- "Not Significant"
df_overall[mask3] <- "NA"

print("Results based on P-values")
df_overall
dance_save("college_major_analysis.rds")