#this is a great script to know how to use Rshiny

#load data

#avergae win
#average points
#average assists 
#average rebounds
#average steals 
#average turnovers
#average fieldgoal percentage
#average 3pointshots percentage



ui <- fluidPage(
  
  titlePanel("Raptors vs Everyone Else"),
  
  sidebarLayout(
    sidebarPanel(
      #select team other than raptors
      selectInput(),
      
      #select category for other players
      selectInput(),
      
      #select category to plot league level
      selectInput()
      
    ),
    mainPanel(
      
      fluidRow(
        
        # #raptors vs team
        # column(6,
        #        
        #        #bar graph here
        #        
        #        ),
        # 
        # column(6,
        #        
        #        #
        #       
        #        
        #        )
      ),
      
      #league level
      fluidRow(
        
        #plot line  graph of league
      
      )
      
      
      
      
    )
  )
  
)


# Define server logic for random distribution app ----

server <- function(input, output, session) {
  
  

}

shinyApp(ui = ui, server = server)