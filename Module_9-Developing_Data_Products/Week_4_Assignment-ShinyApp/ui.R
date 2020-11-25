library(shiny)
library(shinyWidgets)

shinyUI(fluidPage(
  titlePanel("COVID Dataset Exploration"),
  sidebarLayout(
    sidebarPanel(
      pickerInput("top_country","Top 30 Wealthiest Countries (GDP/capita)", choices=country_choices_top_gdp, options = list(`actions-box` = TRUE),multiple = T,selected=country_choices_top_gdp),
      pickerInput("bot_country","Bottom 30 Poorest Countries (GDP/capita)", choices=country_choices_bot_gdp, options = list(`actions-box` = TRUE),multiple = T,selected=country_choices_bot_gdp),
      selectInput('y_axis','Y Variable',choices=variable_choices,selected="total_cases_per_million"),
      selectInput('x_axis','X Variable',choices=variable_choices,selected="gdp_per_capita"),
      submitButton("Submit")
    ),
    mainPanel(
      h3("COVID Scatter Plots - Wealthy vs Poor Nations"),
      plotlyOutput("plot1"),
      br(),
      p(strong("Line-of-Best-Fit")),
      p(strong("Wealthy Countries")),
      htmlOutput("text1"),
      br(),
      p(strong("Poor Countries")),
      htmlOutput("text2")
    )
  )
))
