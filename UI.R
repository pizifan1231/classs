library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("test2"), 
  sidebarPanel(
    fileInput('file1', 'Choose CSV File',
              accept=c('text/csv','text/comma-separated-values,text/plain','.csv')),
    checkboxInput('abline', 'show abline', TRUE)
  ),
  mainPanel(
    "summary",
    verbatimTextOutput("textDisplay"),
    plotOutput("distPlot")
  )
))
