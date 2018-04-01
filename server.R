#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(DT)
library(mlbench)
data("PimaIndiansDiabetes")
data("BostonHousing")

server <- function(input, output) {

  datasetInput <- reactive({
    switch(input$dataset,
           "Diabetes" = PimaIndiansDiabetes,
           "Boston Housing" = BostonHousing,
           "Cars" = mtcars)
  })
  
  output$caption <- renderText({
    input$caption
  })
  
  # Generate a summary of the dataset ----
  output$summary <- renderPrint({
    dataset <- datasetInput()
    summary(dataset)
  })
  
  # Show the data in Data Table View ----
  output$view <- DT::renderDataTable({
    datasetInput()
  })
}
