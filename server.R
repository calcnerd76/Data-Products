library(shiny)

shinyServer(function(input, output, session) {
  
  output$independent <- renderUI({
    checkboxGroupInput("independent", "Independent Variables:",names(mtcars)[!names(mtcars) %in% input$dependent],names(mtcars)[!names(mtcars) %in% input$dependent])
  })
  
  runRegression <- reactive({
    lm(as.formula(paste(input$dependent," ~ ",paste(input$independent,collapse="+"))),data=mtcars)
  })
  
  output$regTab <- renderTable({
    if(!is.null(input$independent)){
      summary(runRegression())$coefficients
    } else {
      print(data.frame(Warning="Please select one or more independent variables."))
    }
  })
  
})