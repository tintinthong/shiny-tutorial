
x<-seq(1,100)

ui <- fluidPage(

  titlePanel("Simulation of a Linear Model"),
  
  fluidRow(
    mainPanel(
      plotOutput("plot")
    )
    
  ),
  

  fluidRow(
    column(4,
           numericInput("m","Input the gradient here",value=2),
           numericInput("c","Input the y-intercept here",value=0)
           ),
    
    column(4,
           numericInput("sd", "Standard deviation of the errors",value=1,min=0.1)
           ),
    
    column(4,
           checkboxInput("show","Show data points or not",value=TRUE),
           radioButtons("color","Color of line",c("red","blue","green","orange"))
           )
  )
  
)


server <- function(input, output) {
  
  y=reactive({
    return(input$m*x+input$c+rnorm(length(x),0,input$sd))
    })
  
  mod=reactive({
    lm(y()~x)
  })
  
  output$plot=renderPlot({
    
    #big computation here like fetching an api then 
    #any dependents of input$ will change
    #the idea is to make separation
    #also to avoid duplicated code if you want different places to put it
     
     plot(0,type="n",xlim=c(min(x),max(x)),ylim=c(min(x),max(x)),xlab="x",ylab="y",main="y vs x")
     abline(input$c,input$m)
     if(input$show){
      points(x,y(),col=input$color)
      }
  #   
  })
  
  

}

shinyApp(ui = ui, server = server)




