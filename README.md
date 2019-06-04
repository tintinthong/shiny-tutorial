# shiny-tutorial
Quick quick way to get accustomed to shiny and build shiny Apps in seconds. 

The purpose of this tutorial is to get you up-and-running. Let's not pretend that this tutorial will make you a Shiny Genius like [Dean Attali][3].

## What is Shiny? 

Shiny is great way to visualise and observe changes in data while tweaking and turning inputs. Think "Turning knobs and seeing a graph change before your eyes"

One of the primary reasons you use Shiny is if you are familiar with R; Shiny is a very R-specific software that truly speeds up and empowers people who know R but are unaware of other languages, most commonly, researchers and educators.

## Installing Shiny

`install.packages('shiny')`

## R Shiny Structure 

Real Quick! 

In web application programming, you learn client-server architecture. The idea is that your "data model" (as they call it) always resides on the server. That means any changes in the client should immediately update the changes in the server before changing the client again. Rshiny adopts similar principles except that they call it the UI (the client) and the server (the server)

Think of it as a pizza place. 

1. Order #1: Pepperoni Pizza is ordered by a customer (the client)
2. The waiter tells the kitchen (the server) to cook up a Pepperoni Pizza 
3. The kitchen then passes the pizza to back to the customer.

If you have not learnt web apps, do not worry -- you do not need to know much about it to make full use of Rshiny.

## Run Some Examples

1. Just got to `example.R` file, load the shiny library.
2. Just run each line to see examples (a window should pop-up)

For further examples, look [here][1]

## Forget About the UI

I think for a  beginner, most of the noise comes from the UI components that Rshiny makes available. So I made the intro to UI very short,

Layout components are the "containers" or "divs" of your page. They layout your page into sections making it neat and organised.You often see these layout components, such as:

1. sidebarLayout
2. MainPanel
3. fluidPage
4. fluidRow
5. column

In RShiny they have control widgets. 


On the contrary, the UI is the thing I spend on thet most after getting used to Rshiny.

https://rstudio.github.io/shinydashboard/structure.html#valuebox

## Look at app.R 





## Reactivity

Reactivity 


## Things to Know 

1. ui.R and server.R 
2. global. R
3. Do not care too much about UI objects
4. Making HTML
5. Reactivity is embedded in a lot of functions
6. fluid


## Back to UI

## Resources 

There are extremely good resources to learn Rshiny [here][2]

[1] https://shiny.rstudio.com/gallery/
[2] https://shiny.rstudio.com/tutorial/
[3] https://deanattali.com/shiny/

