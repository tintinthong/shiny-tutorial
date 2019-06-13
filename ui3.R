

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
  

    
    tags$div(class = "header",id="crazydiv", checked = NA,
             tags$p("Ready to take the Shiny tutorial? If so"),
             tags$a(href = "shiny.rstudio.com/tutorial", "Click Here!")
    ),
  
    withTags({
      div(class="header", checked=NA,
          p("Ready to take the Shiny tutorial? If so"),
          a(href="shiny.rstudio.com/tutorial", "Click Here!")
      )
    }),
  
  HTML("<div>
       <strong>Raw HTML!</strong>
      <ol>
        <li>First list</li>
         <li>Second list</li>
      </ol>
       </div>"),
  
  
  tags$head(
    tags$style(
      HTML("

          #crazydiv{
            color:red;
            font-size: 10px;
          }

          li{
            color:blue;
          }
           
           
           ")
      
    )
  ),
  
  uiOutput("somehtml")
  
  
)

server <-function(input,output){
  
  
  output$somehtml<-renderUI({
    tags$p(
      "This is the content of p"
    )
  })
  
  
}

shinyApp(ui,server)


# Do not use sidebarLayout as to confuse people


