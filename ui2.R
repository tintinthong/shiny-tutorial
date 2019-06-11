
library(shiny)

### LAYOUTS ###

#titlePanel()
#sidebarLayout()
#fluidRow()
#sidebarPanel()
#mainPanel()
#wellPanel() 
#navListPanel()
#tabsetPanel()
#tabPanel()
#navBarPage()
#conditionalPanel()

#https://shiny.rstudio.com/articles/layout-guide.html

### WIDGETS ###
# name, label

#actionButton()	Action Button
#checkboxGroupInput()	A group of check boxes
#checkboxInput()	A single check box
#dateInput()	A calendar to aid date selection
#dateRangeInput()	A pair of calendars for selecting a date range
#fileInput()	A file upload control wizard
#helpText()  Helptext that can be added to an input form
#numericInput()	A field to enter numbers
#radioButtons()	A set of radio buttons
#selectInput()	A box with choices to select from
#sliderInput()	A slider bar
#submitButton()	A submit button
#textInput()	A field to enter text

#https://shiny.rstudio.com/tutorial/written-tutorial/lesson3/


ui <- fluidPage(
  
  titlePanel("Another titlePanel"),
  
  fluidRow(
    
    column(8,
           checkboxGroupInput(
             "checkboxGroupInputID",
             "this is the  checkbox GroupInput",
             choices= c("red","blue","white")
           ),
           
           textInput("textInputID","this is the textInput",
                     "Wubbalubba dub dub"),
           h1("This is a long paragraph  about nothing much"),
           p("MELAKA: Investigations are ongoing into the cause of death of 12 Orang Asli at Kampung Kuala Koh in Gua Musang, Kelantan, says Tun Dr Mahathir Mohamad.

             The Prime Minister said investigations would also focus on whether their deaths were caused by a “mystery disease”.
             
             “The government is concerned over the mass death but at this moment, the cause of death has yet to be ascertained,” he said after launching affordable homes at Lipat Kajang here Monday (June 10).
             
             On Sunday (June 9), Minister in the Prime Minister's Department P. Waytha Moorthy said that there were 14 Orang Asli deaths in the area but only two were confirmed to be from pneumonia following post-mortem examinations on the two victims.
             
             Bernama reported that a police operation to locate the graves of 12 Orang Asli from the Batek tribe, said to have died of pneumonia in Kampung Kuala Koh here over the past month, will begin on Tuesday (June 11).
             
             The 12 deceased were buried according to customary rituals in the jungle.
             
             Bukit Aman Internal Security and Public Order Department director Datuk Seri Acryl Sani Abdullah Sani said the operation would involve 30 members of the General Operation Force and policemen from Gua Musang District Police headquarters.
             
             He said several Orang Asli headmen would also join in the operation as they were more well-versed in all aspects of the jungle.
             
             Earlier, Dr Mahathir said the appointment of Latheefa Koya as the new chief commissioner of the Malaysian Anti-Corruption Commission (MACC) was based on her qualifications and straight personality.
             
             “There were many controversies circulating over Latheefa's appointment," 
           )
    
    
  ), 
  
  column(4, 
         radioButtons(
           "radioButtonsID",
           "this is the radio Buttons",
           choices=c("spotify","ares","torrent","npr")
         )
         
         )

  
  
  
)

)


server <-function(input,output){
  
}

shinyApp(ui,server)


