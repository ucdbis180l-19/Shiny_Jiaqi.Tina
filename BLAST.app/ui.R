#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  titlePanel("Worm and Plant BLAST Data"),
  
  helpText("This application creates a scatterplot to show how trait affects the relationship between score and sequence length of a worm and plant BLAST.  Please use the radio box below to choose a trait",
           "for coloring in the plot and values in each trait in the slider"),
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Sidebar to demonstrate various slider options ----
    sidebarPanel(
      radioButtons("trait", #the input variable that the value will go into
                   "Choose a trait to display the color of:",
                   c("pct_ident",
                     "gaps",
                     "mis",
                     "E")
      ),
      # Input: Simple integer interval ----
      sliderInput("pct_ident",
                  "Percent Identity",
                  min = 0,
                  max = 100,
                  value = 20),
      sliderInput("gaps",
                  "Gaps",
                  min = 0,
                  max = 60,
                  value = 10),
      sliderInput("mis",
                  "Mismatches",
                  min = 0,
                  max = 1200,
                  value = 300),
      sliderInput("E",
                  "E Value",
                  min = 0,
                  max = 10,
                  value = 2.5)),
    
    
    # Main panel for displaying outputs ----
    mainPanel(
      # Show a plot of the generated distribution
      plotOutput("scatterPlot"),
      # Output: Table summarizing the values entered ----
      tableOutput("values")
      
    ))))
  
 
  

 
                
  
  