README
================
Mark Wan
10/2/2020

## **Overview**

This readme file details the steps executed by the author to product the
‘tidydataset’.

## **Contents**

Repo consists of 5 files

1.  CODEBOOK.md - Markdown document that specifies all variables in data
    set.
2.  README.md - Markdown document deatils step-by-step transformations.
3.  run\_analysis.R - R script used to transform source data to ‘a tidy
    data set.’tidydataset’.
4.  tidyset.txt - Output from the aforementioned R script.
5.  UCI HAR Dataset - Folder that contains source information.

## **R script pre-requisites**

Below are files required to execute run\_analysis.R

  - “.\\UCI HAR Dataset\\train\\X\_train.txt”
  - “.\\UCI HAR Dataset\\train\\y\_train.txt”
  - “.\\UCI HAR Dataset\\train\\subject\_train.txt”
  - “.\\UCI HAR Dataset\\test\\X\_test.txt”
  - “.\\UCI HAR Dataset\\test\\y\_test.txt”
  - “.\\UCI HAR Dataset\\subject\_test.txt”
  - “.\\UCI HAR Dataset\\features.txt”

Below are the required packages and R version

  - dplyr with version:

<!-- end list -->

    ## [1] '1.0.2'

  - R version:

<!-- end list -->

    ## [1] '4.0.2'

Once all required files have been extracted, and all packages loaded,
execute run\_analysis in the “.” directory. Script will produce
“tidydataset” text file in “.” directory.

## **Transformation Steps**

### Step 1

Read source files into data frames.

### Step 2

Rename activity labels and features column names. Rename subject column
headers.

### Step 3

Row bind test and train sets. Column bind test and train sets with
subject set (row-binded).

### Step 4

Extract mean and std features.

### Step 5

Merge y with activity labels. Use descriptive names for y-labels and
feature variables.

### Step 6

Column bind features with labels. Then column bind with subject column.

### Step 7

Write dataframe into “tidydataset.txt”.
