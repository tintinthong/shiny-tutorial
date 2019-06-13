
#LOAD LIBRARIES
library(shiny)

#dont use ggplot

#http://www.data.gov.my/data/ms_MY/dataset/analisis-mp-spm-mengikut-peratus-pencapaian-bagi-4561-additional-science-dan-bilangan-menduduki

#GLOBAL OBJECTS HERE

data=read.csv("StudentsPerformance.csv")
data = data[,"math.score"]
#x=rnorm(1000,50,10)

ui <- fluidPage(
  
  titlePanel("Scores for Students"),
  
  sidebarLayout(
    
    
    sidebarPanel(
      
      #INPUTS
        sliderInput("E","Mark for E (Red)",10,min=1, max=100),
        sliderInput("D","Mark for D (Orange)",20,min=1, max=100),
        sliderInput("C","Mark for C (Yellow)",40,min=1, max=100),
        sliderInput("B","Mark for B (Blue)",60,min=1, max=100),
        sliderInput("A","Mark for A (Green)",80,min=1, max=100)
        
        
    
      ),
    
    mainPanel(
      
      #OUTPUTS
     
      plotOutput("histogram"),
      
      fluidRow(
        column(4, 
               #a place to put a density/histogram 
               #with vertical lines
               
               tableOutput("freqTable")
               ),
        column(8,
    
               #show summary statistics
               h3(textOutput("mean")),
               h4(textOutput("n")),
               h4(textOutput("quantile"))
               )
        
      )
      
      
      
      
    
    
     
    )
  )
  
)


# Define server logic for random distribution app ----

server <- function(input, output,session) {
  
  #PLACE VARIABLES INSIDE HERE
  
  
  
  
  #PLACE REACTIVE VARIABLES IN HERE
    varE= reactive({input$E})
    varD= reactive({input$D})
    varC= reactive({input$C})
    varB= reactive({input$B})
    varA= reactive({input$A})
    #you can't reassigna an  input
    
   
    #a variable to keep summaries
    varSummary= reactive({
      list(mean=mean(data), sd=sd(data),quantile= fivenum(data))
    })
    
    varFreqTable= reactive({
      freqtable=table(cut(data,c(0,varE(),varD(),varC(),varB(),varA(),100),include.lowest=TRUE))
      attr(freqtable,"dimnames")[[1]]= paste(toupper(rev(letters[1:6])),attr(freqtable  ,"dimnames")[[1]])
      freqtable
    })
    
    
  #OBSERVE STUFF HERE 
  observe({
    print("whatever")
    print(varFreqTable)
  })
  
  # check for impossibilities
  observe({
    if(varE()>=varD()){
      
      updateSliderInput(session,"E",value=varD()-1)
    }
    if(varD()>=varC()){
      updateSliderInput(session,"D",value=varC()-1)
    }
    if(varC()>=varB()){
      updateSliderInput(session,"C",value=varB()-1)
    }
    if(varB()>=varA()){
      updateSliderInput(session,"B",value=varA()-1)
    }
  })

  #RENDER  ALL OUTPUTS
  output$table=renderDataTable({
    data

  })
  
  output$histogram=renderPlot({
    hist(data,col=rgb(0.1,0.1,0.1,0.5),main="Histogram of Math Scores",breaks=seq(0,100,1))
    hist(x, col=rgb(0.8,0.8,0.8,0.5), add=T,breaks=seq(0,100,1))
    # box()
    abline(v=varE(),col="red",lwd=2)
    abline(v=varD(),col="orange",lwd=2)
    abline(v=varC(), col="yellow",lwd=2)
    abline(v=varB(), col="blue",lwd=2)
    abline(v=varA(), col="green",lwd=2)
  })
  
  output$mean= renderText({
    paste("Average:", mean(data))
  })
  
  output$n= renderText({
    paste("N:",length(data))
  })
  
  output$quantile= renderText({
    paste("|",seq(0,100,25),"%:",fivenum(data))
  })
  
  output$freqTable= renderTable({
    varFreqTable()
  })
  
  
}

shinyApp(ui = ui, server = server)

#spm lower the bar
#lower bar




