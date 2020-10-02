---
title: "README"
author: "Mark Wan"
date: "10/2/2020"
output: rmarkdown::github_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)

```

## **Overview**

This readme file details the steps executed by the author to product the 'tidydataset'.

## **Contents**

Repo consists of 5 files

1. CODEBOOK.md - Markdown document that specifies all variables in data set.
2. README.md - Markdown document deatils step-by-step transformations.
3. run_analysis.R - R script used to transform source data to 'a tidy data set.'tidydataset'.
4. tidyset.txt - Output from the aforementioned R script.
5. UCI HAR Dataset - Folder that contains source information.


## **R script pre-requisites**

Below are files required to execute run_analysis.R

* ".\\UCI HAR Dataset\\train\\X_train.txt"
* ".\\UCI HAR Dataset\\train\\y_train.txt"
* ".\\UCI HAR Dataset\\train\\subject_train.txt"
* ".\\UCI HAR Dataset\\test\\X_test.txt"
* ".\\UCI HAR Dataset\\test\\y_test.txt"
* ".\\UCI HAR Dataset\test\\subject_test.txt"
* ".\\UCI HAR Dataset\\features.txt"

Below are the required packages and R version

* dplyr with version:
```{r dplyr_version, echo=FALSE} 
packageVersion("dplyr")
```

* R version:
```{r r_version, echo=FALSE} 
package_version(R.version)
```

Once all required files have been extracted, and all packages loaded, execute run_analysis in the "." directory. Script will produce "tidydataset" text file in "." directory. 

## **Transformation Steps**

### Step 1
Read source files into data frames.

### Step 2
Rename activity labels and features column names. Rename subject column headers.

### Step 3  
Row bind test and train sets. Column bind test and train sets with subject set (row-binded).

### Step 4
Extract mean and std features.

### Step 5
Merge y with activity labels. Use descriptive names for y-labels and feature variables.

### Step 6
Column bind features with labels. Then column bind with subject column.

### Step 7
Write dataframe into "tidydataset.txt".

