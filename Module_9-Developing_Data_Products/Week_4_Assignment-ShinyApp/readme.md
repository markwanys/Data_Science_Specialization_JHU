# README - COVID Data Exploration - Shiny App

## Overview
The purpose of this shiny app is allow users to perform quick exploration of the owid-covid-data dataset. The dataset was downloaded from the following website:
https://covid.ourworldindata.org/data/owid-covid-data.csv

The app allows the user to choose a selection of wealthy and poor nations ranked by GDP per capita. The user is also allowed to select dependent and independent variables from a picklist of numeric columns available in the dataset.

Please refer to the following link for more details:
https://ourworldindata.org/coronavirus-source-data

## Input
1. Select up to 30 weathy and poor countries
![input1](input1.png)

2. Select y and x variables
![input2](input2.png)

3. Click Submit
![input2](input2.png)

## Output
1. A Plotly scatter plot with markers colour coded by GDP/capita (wealthy vs poor)
![output1](output1.png)

2. Separate line of best fits for wealthy and poor countries

3. Line of best fit equations for both categories
![output2](output2.png)