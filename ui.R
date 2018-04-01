#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for dataset viewer app ----
ui <- fluidPage(
  
  # App title ----
  titlePanel("Data Selector"),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Sidebar panel for inputs ----
    sidebarPanel(
      
      # Input: Text for providing a caption ----
      # Note: Changes made to the caption in the textInput control
      # are updated in the output area immediately as you type
      textInput(inputId = "caption",
                label = "Caption:",
                value = "My Page Title"),
      
      # Input: Selector for choosing dataset ----
      selectInput(inputId = "dataset",
                  label = "Choose a dataset:",
                  choices = c("Diabetes", "Boston Housing", "Cars")),
      
      tags$br()
    ),
    
    # Main panel for displaying outputs ----
    mainPanel(
      h3(textOutput("caption", container = span)),
      tabsetPanel(
        tabPanel("Data Snapshot", DT::dataTableOutput("view")),
        tabPanel("Data Summary", verbatimTextOutput("summary"))
      )
    )
  )
)