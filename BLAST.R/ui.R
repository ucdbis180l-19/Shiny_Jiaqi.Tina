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
  
  # Application title
  titlePanel("Worm and Plant BLAST Data"),

  # Some helpful information
  helpText("This application creates a scatterplot to show how trait affects the relationship between score and sequence length of a worm and plant BLAST.  Please use the radio box below to choose a trait",
           "for plotting"),
  
  # Sidebar with a radio box to input which trait will be plotted
  sidebarLayout(
    sidebarPanel(
      radioButtons("trait", #the input variable that the value will go into
                   "Choose a trait to display:",
                   c("pct_ident",
                     "len",
                     "mis",
                     "E")
      )),
    
    # Show a plot of the generated distribution
    mainPanel(plotOutput("scatterPlot")
    )
  )
))