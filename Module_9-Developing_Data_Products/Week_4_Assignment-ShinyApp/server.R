library(shiny)
library(plotly)
library(dplyr)
library(RColorBrewer)

shinyServer(
  function(input, output, session) {
    covid_top <- reactive({
      covid_top_gdp %>%
        filter(location %in% input$top_country) %>%
        filter(!is.na(get(input$x_axis))) %>%
        filter(!is.na(get(input$y_axis))) 
    })
    
    covid_bot <- reactive({
      covid_bot_gdp %>%
        filter(location %in% input$bot_country) %>%
        filter(!is.na(get(input$x_axis))) %>%
        filter(!is.na(get(input$y_axis))) 
    })
      
    fit_top <- reactive({
      lm(get(input$y_axis)~get(input$x_axis), data=covid_top()) 
    })
    
    fit_bot <- reactive({
      lm(get(input$y_axis)~get(input$x_axis), data=covid_bot()) 
    })
    
    data_cols <- reactive({
      getPalette <- colorRampPalette(brewer.pal(12,"Paired"))
      cols <- getPalette(nrow(covid_top))
    })
    
    output$plot1 <- renderPlotly({
      fig <- plot_ly() %>%
        layout(title="", xaxis=list(title=input$x_axis), yaxis=list(title=input$y_axis))
      
      fig <- fig %>%
        add_markers(data=covid_top(), x=~get(input$x_axis), y=~get(input$y_axis), name='Wealthy Countries',text=~location) %>%
        add_lines(x=~get(input$x_axis),y=fitted(fit_top()),name="Wealthy Line-of-Best-Fit",line=list(shape="linear"))
      
      fig <- fig %>%
        add_markers(data=covid_bot(), x=~get(input$x_axis), y=~get(input$y_axis), name='Poor Countries',text=~location) %>%
        add_lines(x=~get(input$x_axis),y=fitted(fit_bot()),name="Poor Line-of-Best-Fit",line=list(shape="linear"))

      fig 
    })
    
    output$text1 <- renderText({
      paste0(input$y_axis," = ", round(coef(fit_top())[1],2)," + ",round(coef(fit_top())[2],2),"*", input$x_axis)
    })
    
    output$text2 <- renderText({
      paste0(input$y_axis," = ", round(coef(fit_bot())[1],2)," + ",round(coef(fit_bot())[2],2),"*", input$x_axis)
    })    

  
  }
)



