#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#
library(tidyverse)
worm_plant <- read_tsv("~/Downloads/worm_vs_plant.blastout_v2.1.gz",col_names=FALSE)
colnames(worm_plant) <- c("query_id",
                          "subject_id",
                          "pct_ident",
                          "len",
                          "mis",
                          "gaps",
                          "qb",
                          "qe",
                          "sb",
                          "se",
                          "E",
                          "Score")
library(shiny)
library(ggplot2)

# Define server logic required to draw a boxplot
shinyServer(function(input, output) {
  
  # Expression that generates a boxplot. The expression is
  # wrapped in a call to renderPlot to indicate that:
  #
  #  1) It is "reactive" and therefore should re-execute automatically
  #     when inputs change
  #  2) Its output type is a plot
  
  output$scatterPlot <- renderPlot({
    
    # set up the plot
    plotdata <- worm_plant %>% filter(pct_ident > input$pct_ident,
                                      gaps > input$gaps,
                                      mis > input$mis,
                                      E > input$E)
    pl <- ggplot(data = plotdata,
                 #Use aes_string below so that input$trait is interpreted
                 #correctly.  The other variables need to be quoted
                 aes_string(x="len",
                            y="Score",
                            color = input$trait
                 )
    )
    
    # draw the boxplot for the specified trait
    pl + geom_point()
 
  })
  
  # Reactive expression to create data frame of all input values ----
  sliderValues <- reactive({
    
    data.frame(
      Name = c("Percent Identities",
               "Gaps",
               "Mismatches",
               "E Value"
      ),
      Value = as.character(c(input$pct_ident,
                             input$gaps,
                             input$mis,
                             input$E)),
      stringsAsFactors = FALSE)
    
  })
   
    
    # Show the values in an HTML table ----
    output$values <- renderTable({
      sliderValues()
    })
    
  })
  
  
