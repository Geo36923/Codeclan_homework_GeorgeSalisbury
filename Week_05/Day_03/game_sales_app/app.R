library(janitor)
library(CodeClanData)
library(tidyverse)
library(assertr)
library(shiny)
library(bslib)
game_sales

# Define UI for application that draws a histogram
ui <- fluidPage(
  theme = bs_theme(version = 5, bootswatch = "vapor"),
  titlePanel("Game Sales"),
  tabsetPanel(
    tabPanel(
    "Genre Select",
    selectInput(
      inputId = "Genre",
      label = "Choose your genre",
      choices = c("Action", "Adventure", "Fighting", "Misc", "Platform", "Puzzle",
                  "Racing", "Role-playing", "Shooter", "Simulation", "Sports", "Strategy")                  )
    ),
  
  tabPanel(
  "Console select",
  selectInput(
    inputId = "Console",
    label = "Choose your console",
    choices = c("3DS", "DS", "GBA", "GC", "PC", "PS", "PS2", "PS3", "PS4", "PSP", "PSV", "Wii", "WiiU",
                "XBOX", "X360", "XOne")
  )
  ),
tabPanel("Plot",
  plotOutput("game_plot")

        )
    )
)

# The purpose of this graph is to show the varying sales of games narrowed 
# down by the console and the genre
# Define server logic required to draw a histogram
server <- function(input, output, session) {
  output$game_plot <- renderPlot(
    game_sales %>%
      #filter(name == input$name) %>%
      filter(genre == input$Genre) %>%
      filter(platform == input$Console) %>%
      #mutate(overall_sales = sum(sales %in% platform)) %>% 
      ggplot() +
      aes(x = name, y = sales, fill = platform) +
      geom_col(bars = 30, col = "white") +
      xlab("console")+
      ylab("sales")+
      scale_fill_manual(values = c("3DS" = "red", 
                                   "DS" = "grey9",  
                                   "GBA" = "pink",
                                   "GC" = "purple",
                                   "PC" = "grey",
                                   "PS" = "brown",
                                   "PS2" = "blue",
                                   "PS3" = "black",
                                   "PS4" = "orange",
                                   "PSV" = "white",
                                   "Wii" = "steelblue",
                                   "WiiU" = "violet",
                                   "XB" = "light green",
                                   "X360" = "dark green",
                                   "XOne" = "dark red")) +
      theme_minimal()
  
  ) 
}
# Run the application 
shinyApp(ui = ui, server = server)
