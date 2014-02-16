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
      # Skapa graf
     time=(1:365)
     output=seq(0,36.4,.1)
     output1=output-1
      a <- rHighcharts:::Chart$new()
      a$title(text = "Processing time")
      a$subtitle(text = "Ongoing and ended cases")
      a$xAxis(title = list(text = "Days"))
      a$yAxis(title = list(text = "Return"))
      
      a$data(x = time, y = output, type = "line", name = "Ended (aggregated)")
      a$data(x = time, y = output1, type = "line", name = "Ongoing")
      
      return(a)
    })
    
    #bar graphs
    output$bar <- renderChart({      
  
    a <- rHighcharts:::Chart$new()
      a$title(text = "DHY Adjusted")
      a$subtitle(text = "subtitle")
      #a$xAxis(title = list(text = "Date"), categories=as.character(data$cdate)
      a$xAxis(categories = data$cdate)
      a$yAxis(title = list(text = "Return"))
      a$data(x = data$cdate, y = data$DHY.Adjusted, type = "column", name = "Returns")
  
      return(a)
    })
})
