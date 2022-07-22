library(assertr)
library(CodeClanData)
library(tidyverse)
library(bslib)
library(shiny)
library(shinyWidgets)

game_sales <- CodeClanData::game_sales
# time to start up the shiny app for calculating game_sales.  Thankfully, I did some work on this dataset earlier. ####
library(shiny)

ui <- fluidPage(
  fluidRow(
    
  )
)

server <- function(input, output, session) {
  
}

shinyApp(ui, server)