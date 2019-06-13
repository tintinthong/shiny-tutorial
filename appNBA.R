
library(tidyverse)
library(reshape2)
library(rlang)



data=read.csv("nba.games.stats.csv")
data=as_tibble(data)
data_TOR= data%>% filter(data$Team=="TOR")%>%select(Date ,WINorLOSS,Opponent, TeamPoints, OpponentPoints,Assists, Opp.Assists,TotalRebounds, Opp.TotalRebounds ,Steals, Opp.Steals, Blocks, Opp.Blocks, Turnovers, Opp.Turnovers, FieldGoals., Opp.FieldGoals., FreeThrows, Opp.FreeThrows , X3PointShots., Opp.3PointShots., TotalFouls, Opp.TotalFouls )%>%mutate(Date=as.Date(Date))

vec_except=c("Date","WINorLOSS","Opponent")
vec_names= colnames(data_TOR)
vec_names= colnames(data_TOR)[!vec_names %in% vec_except]


vec_except2=c("TeamPoints","OpponentPoints","Opp.Assists","Opp.TotalRebounds","Opp.Steals","Opp.Blocks","Opp.Turnovers","Opp.FieldGoals.","Opp.FreeThrows","Opp.3PointShots.","Opp.TotalFouls")
vec_names2= vec_names 
vec_names2=vec_names[!vec_names2 %in% vec_except2]

  
ui <- fluidPage(
  
  titlePanel("Raptors vs Everyone Else (2014/2015)"),
  
  sidebarLayout(
    sidebarPanel(
      #select team other than raptors
      selectInput("team", "Select a team to be head to head (H2H)", choices=levels(data_TOR$Opponent)),
      
      # #select category for other players
      selectInput("category","Stats category for right graph (H2H)",choices=vec_names2),
      
      # #select category for other players
      selectInput("category2","Stats category for big graph (Across league)",choices=vec_names)
      
      
      
    ),
    mainPanel(
      
      fluidRow(
        
        # #raptors vs team
        
        column(6,
               plotOutput("leftTopGraph")
               
               ),
        
        column(6,
               plotOutput("rightTopGraph")
               )
                
     
                
           
      ),
      
      #league level
      fluidRow(
        
        plotOutput("bottomGraph")
        
        #plot line  graph of league
      
      )
      
      
      
      
    )
  )
  
)


# Define server logic for random distribution app ----

server <- function(input, output, session) {
  
  team= reactive({
    #filtering out opponent
    data_TOR %>% filter(Opponent==input$team)
  })
  
  observe({
    # print(sym(input$category))
    # print(paste("Opp.",input$category,sep=""))
  })
  
  
  output$leftTopGraph=renderPlot({
    #data_TOR %>% filter(Opponent=="ATL")%>%group_by(WINorLOSS)%>%ggplot(aes(WINorLOSS))+geom_bar(aes(fill=WINorLOSS))
    team()%>%group_by(WINorLOSS)%>%ggplot(aes(WINorLOSS))+geom_bar(aes(fill=WINorLOSS),color ="black")+ggtitle("Total WINorLOSS")
  })
  

  
  output$rightTopGraph=renderPlot({
    
    
    #very weird. Solution to using sym(). Sorry. Typically two syms can't  be used  inside  summarise -- need to research 
    x=team()%>%summarise(mean=mean(!! sym(input$category)))%>%print()
    y=team()%>%summarise(meanOpponent=mean(!!sym(paste("Opp.",input$category,sep=""))))%>%print()

    merge(x,y )%>%melt()%>%ggplot(aes(x=variable,y=value))+geom_bar(aes(fill=variable),color="black",stat="identity")+ggtitle(paste("Average", input$category))
    # bind_rows(x,y) %>%print()
    
    
    
    #data_TOR%>% filter(Opponent==input$team)%>% group_by(Opponent)%>%summarise(mean= mean(!! sym(input$category)),meanOpponent=!! sym(paste("Opp.",input$category,sep="")))

    #%>%melt(id.vars='Opponent')%>%ggplot(aes(x=variable,y=value))+geom_bar(aes(fill=variable),color="black",stat="identity")
   
    
  })
  
  output$bottomGraph=renderPlot({
    ggplot(data_TOR, aes_string(x="Date", y=input$category2, group="Opponent")) +
      geom_line(aes_string(color="Opponent"))+
      scale_x_date(labels = function(x) format(x, "%d-%b-%Y"))+
      ggtitle(input$category2)

  })
  

}

shinyApp(ui = ui, server = server)