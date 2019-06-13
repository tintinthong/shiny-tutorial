#this is a great script to know how to use Rshiny

ui <- fluidPage(
  

  fluidRow(
    numericInput("numberIn","x",10,min=1,max=100),
    numericInput("numberIn2","y",10, min=1,max=100),
    textOutput("numberOut"),
    textOutput("numberOut2"),
    textOutput("sumOut")
    
  )
  
)


# Define server logic for random distribution app ----

server <- function(input, output) {
  
  
  #make reactive variables  in server 
  x<-reactive({input$numberIn})
  y<-reactive({input$numberIn2})

  #make an output based on input 
  output$numberOut<-renderText({
     paste("this is x",input$numberIn)
    })
  
  #make an output based on input
  output$numberOut2<-renderText({
    paste("this is y ", input$numberIn2)
  })

  #make an output based on  reactive variables
  output$sumOut<-renderText(
    paste("this is the sum of x  and y",
          x()+y() #remmber must take reactive and  use as function
    )
  )
  
  #listen to changes in reactive inputs
  observe({
    print(paste("these are the values  of x and y ", x(), y()))
  })
  
}

shinyApp(ui = ui, server = server)




