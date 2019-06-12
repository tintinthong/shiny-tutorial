# shiny-tutorial
Quick quick way to get accustomed to Shiny and build Shiny  apps in seconds. 

The purpose of this tutorial is to get you up-and-running. Let's not pretend that this tutorial will make you a Shiny Genius like [Dean Attali][3].

## What is Shiny? 

Shiny is great way to visualise and observe changes in data while tweaking and turning inputs. Think "Turning knobs and seeing a graph change before your eyes"

One of the primary reasons you use Shiny is if you are familiar with R; Shiny is a very R-specific software that truly speeds up and empowers people who know R but are unaware of other languages, most commonly, researchers and educators.

## Installing Shiny

```install.packages('shiny')```

```library(shiny)```

## R Shiny Structure 

In web application programming, you learn client-server architecture. The idea is that your "data model" (as they call it) always resides on the server. That means any changes in the client should immediately update the changes in the server before changing the client again. Rshiny adopts similar principles except that they call it the UI (the client) and the server (the server)

Think of it as a pizza place. 

1. Order #1: Pepperoni Pizza is ordered by a customer (the client)
2. The waiter tells the kitchen (the server) to cook up a Pepperoni Pizza 
3. The kitchen then passes the pizza to back to the customer.

If you have not learnt web apps, do not worry -- you do not need to know much about it to make full use of Rshiny.

## Run Some Examples

1. Just got to `builtInExample.R` file, load the shiny library.
2. Just run each line to see examples (a window should pop-up)

For further examples, look [here][1]

## UI

I think for a  beginner, most of the noise comes from the UI components that Rshiny makes available. So I made the intro to UI very short,

I made a frame called `uiFrame.R`: It shows the frame to place ui components in. When designing the UI, I placed in comments the UI layouts and UI widgets. Layout components are the "containers" or "divs" of your page. They layout your page into sections making it neat and organised. You often see these layout components. Widgets are  methods of inputting data, e.g. sliderInput or textInput. 

Layouts or Panel:

1. sidebarLayout
2. MainPanel
3. fluidPage
4. fluidRow
5. column
.. and more

Control widgets: 

1. numericInput
2. selectInput
3. submitButton
4. textInput
.. and more 

Think of it like lego. You stack the pieces up lego-by-lego to get your lego creation.

As an exercise, run through the files below.

1. uiFrame.R
2. u1.R
3. ui2.R

## Server 

Server is where all the hidden logic exists. What do you mean by hidden logic? Now that you have inputted the data from the ui, we need to use it to do something. We can take in the input logic and manipulate it. And send it back out to the ui so that we can observe a change. 

For example, 
1. Ask question from ui (ui):"What is Rick's favorite sauce at McDonalds?"
1. Take input (ui): "Szechuan Sauce"
2. Manipulate input (server): "Rick's favorite sauce at McDonalds = "+ input
3. Render output (server): Render manipulated input as text and pass it to ui --> it is now an output.
4. Show output (ui): Show output on ui (in this case, as a text). 

Similar to ui, the server logic also has a few components. 

Rendering components:

1. renderDataTable	
2. renderImage	
3. renderPlot
4. renderPrint
5. renderTable	
6. renderText
7. renderUI


Following that, when you render the outputs. You have to pass them back to the ui. 

UI output (these are within the ui function):

1. dataTableOutput	
2. htmlOutput	
3. imageOutput
4. plotOutput	
5. tableOutput	
6. textOutput	
7. uiOutput
8. verbatimTextOutput	


### Reactivity

You will find that when experimenting that occasionally the ui output does not react to the your input. s

Reactive is inside curly brackets,e.g. reactive({}),renderTable({})

Look at `app.Reactive.R`:

I made this app to show you the simple things you need to know. It demonstrates simple reactivity: storing your input into an intermediate reactive variable / manipulating two reactive inputs at the same time / observing reactive variables.

## Executing the Code

There are two structures of organising your shiny files. You can build ui and server in separate files. Or you can run them in a single file, which we will do in this tutorial. This file will be called `app<Name>.R` and will include a line.

```
shinyApp(ui,server)
```

## Assignments (Choose one of each)

Build these applications,
1. Business Oriented: Proportions to feed a Population, e.g. pie charts.
2. Api Oriented: Pull Data and Look at a Time Series
3. Statistics Oriented: Random Sampling 
4. Business Oriented: App proto-typing
5. Statistics Oriented: Confidence Intervals.

## Things to Know 

1. ui.R and server.R 
2. global. R
3. Do not care too much about UI objects
4. Making HTML
5. Reactivity is embedded in a lot of functions
6. fluid
7. Must make reactive variables


## Resources 

There are extremely good resources to learn Rshiny [here][2]

[1] https://shiny.rstudio.com/gallery/
[2] https://shiny.rstudio.com/tutorial/
[3] https://deanattali.com/shiny/
[4] https://rstudio.github.io/shinydashboard/structure.html#valuebox
<!-- Row-based layout and column based layout -->
[5] https://rstudio.github.io/shiny/tutorial/#welcome
<!-- Tutorial on Rshiny -->