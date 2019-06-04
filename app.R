library(shiny)

#this is a great script to know how to use Rshiny

ui <- fluidPage(
  

  fluidRow(
    numericInput("numberIn","Number Input",10,min=1,max=100),
    numericInput("numberIn2","Number Input",10, min=1,max=100),
    textOutput("numberOut"),
    textOutput("numberOut2"),
    textOutput("sumOut"),
    textOutput("global")
    
  )
  
)


# Define server logic for random distribution app ----

server <- function(input, output) {
  
  
  x<-reactive({input$numberIn})
  
  y<-reactive({input$numberIn2})

  output$numberOut<-renderText({
     input$numberIn
    })
  
  output$numberOut2<-renderText({
    input$numberIn2
  })

  output$sumOut<-renderText(
    x()+y() #remmber must take reactive and  use as function
  )
  
  observe({
    print(paste("this is whatever", x(), y()))
  })
  
  
  output$global<-renderText(
    'whatever'
  )
}

shinyApp(ui = ui, server = server)




