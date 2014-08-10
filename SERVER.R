library(shiny)

shinyServer(function(input,output) {
  result <- reactive({
    inFile <- input$file1
    if (is.null(inFile)) return(NULL)
    d <- read.csv(inFile$datapath)
    d
  })
  
  output$distPlot <- renderPlot({
    data <- result()
    if(is.null(data)) return(NULL)
    x=data$x
    y=data$y
    lm.sol = lm(y~1+x)
    plot(x,y)
    if(input$abline)  abline(lm.sol,col="red")
  })

  output$textDisplay <- renderPrint({
    d <- result()
    if(is.null(d)) return(NULL)
    lm.sol<-lm(y~1+x,data = d)
    if (!is.null(lm.sol)){
      summary(lm.sol)
    }
    
  })  
  
  
})
