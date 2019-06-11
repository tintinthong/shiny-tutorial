
#LOAD LIBRARIES
library(shiny)
#dont use ggplot

#http://www.data.gov.my/data/ms_MY/dataset/analisis-mp-spm-mengikut-peratus-pencapaian-bagi-4561-additional-science-dan-bilangan-menduduki

#GLOBAL OBJECTS HERE

data=read.csv("./StudentsPerformance.csv")
# colnames(data)%>%print()
data2=data[,c("math.score","reading.score","writing.score")]

printSummary= function(vec){
  
  ls=list(name=deparse(substitute(data)),
          summary=summary(vec),
          sd=sd(vec))
  print(ls)
  return(ls)
}

ui <- fluidPage(
  
  titlePanel("Scores for Students"),
  
  sidebarLayout(
    
    
    sidebarPanel(
      
      #INPUTS
      
      wellPanel(
        sliderInput("E","Mark for E",10,min=1, max=100),
        sliderInput("D","Mark for D",20,min=1, max=100),
        sliderInput("C","Mark for C",40,min=1, max=100),
        sliderInput("B","Mark for B",60,min=1, max=100),
        sliderInput("A","Mark for A",80,min=1, max=100)
      )
    ),
    
    mainPanel(
      
      #OUTPUTS
     
      #show summary statistics
      #textOutput("textSummary"),
    
      
      
      #a place to put a density/histogram 
      #with vertical lines
      plotOutput("histogram"),
      
    
      #a place to render  a table 
      dataTableOutput("table")
    
     
    )
  )
  
)


# Define server logic for random distribution app ----

server <- function(input, output) {
  
  #PLACE VARIABLES INSIDE HERE
  mathScore = data[,"math.score"]

  #PLACE REACTIVE VARIABLES IN HERE
  varE= reactive({input$E})
  varD= reactive({input$D})
  varC= reactive({input$C})
  varB= reactive({input$B})
  varA= reactive({input$A})
  
  #a variable to keep summaries
  # output$math =fivenum(data[,"math.score"])
  # output$reading =fivenum(data[,"reading.score"])
  # output$writing =fivenum(data[,"writing.score"])
  
  #model for scores,  i.e. bell curve

  
  #OBSERVE STUFF HERE 
  observe({
    printSummary(mathScore)
  })

  #RENDER  ALL OUTPUTS
  output$table=renderDataTable({
    data2
  })
  
  output$histogram=renderPlot({
    plot(density(mathScore))
  })
  
  output$textSummary= renderText({
    printSummary(mathScore)
  })
  
  

}

shinyApp(ui = ui, server = server)




