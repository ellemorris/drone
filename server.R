# Server application
shinyServer(function(input, output) {
  
  # Reactive text
  output$title <- renderText({
    paste(input$process, input$year, sep = ", ")
  })
  
  output$text <- renderText({
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged."
  })
  
  output$text2 <- renderText({
    paste("Key indicators", input$year)
  })
  
  # Data
  data <- reactive({
    .data[
      process %in% input$process
      ]
  })
  
  
  #piechart
  output$pie <- renderChart({
    a <- rHighcharts:::Chart$new()
    a$title(text = "Fruits")
    a$data(x = c("Apples","Bananas","Oranges"), y = c(15, 20, 30), type = "pie", name = "Amount")
    return(a)
  })
  
  #scatterplot
  output$scatter <- renderChart({
    a <- rHighcharts:::Chart$new()
    a$title(text = "title")
    a$subtitle(text = "subtitle")
    a$chart(type = "scatter")
    a$legend(align = "right", verticalAlign = "middle", layout = "vertical")
    a$xAxis(title = list(text= "Time"))
    a$yAxis(title = list(text= "Returns"))
    
    a$data(x = c("Apples","Bananas","Oranges"), y = c(15, 20, 30), name = "Returns")
    return(a)
  })
  
  #line graphs
  output$line <- renderChart({          
      dfr=.testdata
      a <- rHighcharts:::Chart$new()
      a$title(text = "Average Monthly Returns")
      #a$xAxis(categories = mdf$Date)
      a$yAxis(title = list(text = "Return"))
      a$data(x = mdf$Date, y = mdf$AvgValue, type = "line", name = "Avg. Returns")
      
      return(a)
  })
  
  #bar graphs
  output$bar <- renderChart({      
    dfr=.testdata
    a <- rHighcharts:::Chart$new()
    a$title(text = "Average Monthly Returns")
    #a$xAxis(categories = mdf$Date)
    a$yAxis(title = list(text = "Return"))
    a$data(x = mdf$Date, y = mdf$AvgValue, type = "column", name = "Avg. Returns")
    
    return(a)
  })
})
