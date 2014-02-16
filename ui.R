#testss
shinyUI(bootstrapPage(

    # Add custom CSS
    tagList(
        tags$head(
            tags$title("Shiny Dashboard Example"),
            tags$link(rel="stylesheet", type="text/css",
                      href="style.css")
        )
    ),
    
    div(class="row",
        div(class="span2",
            selectInput("year", label = "Year", choices = .years, selected = max(.years))
        ),
        div(class="span2",
            selectInput("process", label = "Process", choices = .processes)
        )
    ),
    
    HTML("<hr>"),
    
    conditionalPanel(
        condition = "input.process",
        
        div(class="row",
            div(class="span6",
                chartOutput("flow")
            ),
            div(class="span6",
                chartOutput("days")
            )
        ),     
        div(class="row",
            div(class="span6",
                chartOutput("types")
            ),
            div(class="span6",
                textOutput("text"),
                br(),
                strong(textOutput("text2")),
                htmlOutput("summary")
            )
        ),
        
        div(class="row",
            div(class="span6",
                chartOutput("pie")
                )
            ),

        div(class="row",
            div(class="span6",
                chartOutput("scatter")
            )
        ),
        
        div(class="row",
            div(class="span6",
                chartOutput("line")
            )
        ),
        
        div(class="row",
            div(class="span6",
                chartOutput("bar")
              )
          )
        ),      
    HTML("<hr>")
        
))
