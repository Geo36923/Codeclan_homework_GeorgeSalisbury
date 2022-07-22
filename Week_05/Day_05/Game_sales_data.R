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
  titlePanel("Game sales data"),
  sidebarLayout(
    sidebarPanel(
      selectInput(
        inputId = "console",
        label = "Which console?",
        choices = unique(game_sales$platform)
      )
    )
  ),
  sidebarPanel(
    selectInput(
      inputId = "developer",
      label = "Which developer?",
      choices = unique(game_sales$developer)
    )
  ),
  selectInput(
    inputId = "release date",
    label = "When did the game come out?",
    choices = unique(game_sales$year_of_release)
  ),
  sliderInput(
      inputId = "rating",
      label = "What's the critic rating?",
      value = 5.0, min = 0, max = 10
    ),
  mainPanel(
    plotOutput(
      "game_sales_plot"
    )
  ),
game_sales$

server <- function(input, output, session) {
  output$game_sales_plot <- renderPlot({
    game_sales %>% 
      ggplot()+
      aes(x = console, y = sales, fill = genre) +
      
  }
    
  )
  
}

shinyApp(ui, server)