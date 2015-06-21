library(shiny)

shinyUI(pageWithSidebar(
  headerPanel('Developing Data Products-Performing Linear Regression'),
  
  sidebarPanel(
    h3('Running a Linear Model on the mtcars Dataset'),
    h3('Please select an outcome variable of the mtcars dataset. A linear regression on this variable will be performed.'),
    selectInput("dependent", "Dependent Variable:", c("mpg","cyl","disp","hp","drat","wt","qsec","vs","am","gear","carb")),
    h3('Please select one or more predictor variables of the mtcars dataset. A linear regression on the independent variable chosen will be performed against the predictor variables you choose.'),
    uiOutput("independent")
  ),
  
  mainPanel(tableOutput("regTab"))
))