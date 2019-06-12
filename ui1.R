

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
#helpText()	Help text that can be added to an input form
#numericInput()	A field to enter numbers
#radioButtons()	A set of radio buttons
#selectInput()	A box with choices to select from
#sliderInput()	A slider bar
#submitButton()	A submit button
#textInput()	A field to enter text

#https://shiny.rstudio.com/tutorial/written-tutorial/lesson3/

# this is using sidebarLayout

ui <- fluidPage(
  
  titlePanel("This is my shiny app"),
 

    sidebarPanel(
      helpText("Inside my sidebarPanel"),
      sliderInput("sliderID",
                  "This is my slider",
                  min = 0,
                  max = 1000,
                  value = 500)
    ),
    mainPanel(
      
      
      textInput("textInputID", "this is the text input"),
      dateInput("dateInputID","this is the date input"),
      fileInput("fileInputID","this is the file input")
      
    )
    
    
    

  
)


server <-function(input,output){
  
}
  
shinyApp(ui,server)
  

# Do not use sidebarLayout as to confuse people
  
  
  