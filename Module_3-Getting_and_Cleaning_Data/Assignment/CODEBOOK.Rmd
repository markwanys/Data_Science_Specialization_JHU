---
title: "CODE BOOK for the 'tidydataset' data table"
author: "Mark Wan"
date: "10/2/2020"
output: rmarkdown::github_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)

library(knitr)
tidydataset <- read.table("tidydataset.txt", header=TRUE)
df1 <- data.frame(sapply(tidydataset, class))
df1
names(df1) <- c("Class")
df1[,"Variable"] <- row.names(df1)
df1[,"Index"] <- seq_along(row.names(df1))
df1[,"Min"]<-unlist(lapply(tidydataset,min),use.names = FALSE)
df1[,"Max"]<-unlist(lapply(tidydataset,max),use.names = FALSE)
row.names(df1) <- seq_along(row.names(df1))
df1 <- df1[,c("Index","Variable","Class","Min","Max")]
df1[1,"Min"] <- NaN
df1[1,"Max"] <- NaN
df1[,"Min"] <- round(as.numeric(df1[,"Min"]),digits=2)
df1[,"Max"] <- round(as.numeric(df1[,"Max"]),digits=2)

lines <- readLines(".\\UCI HAR Dataset\\features_info.txt")
```

## **Overview**

This CODEBOOK provides information on 'tidydataset':\
1. Variable names,\
2. Variable class,\
3. Variable min,\
4. Variable max,\
5. Feature selection details.


```{r class_table, echo=FALSE,results='asis'}

kable(df1)
```

## **Feature Selection**

```{r comment='',echo=FALSE}
lines <- readLines(".\\UCI HAR Dataset\\features_info.txt")
cat(tail(lines,-3),sep = '\n')

```