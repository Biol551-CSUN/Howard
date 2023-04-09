############
# Kristen Howard
# April 6th 2023
# A brief introduction into the utilization of the Shiny App

# Load Packages
library(shiny)
ui <- fluidPage() #stands for user interface, anything you want them to see has to 
                  # be in the ui.
server <- function(input, output) {} # yje function contains rendering experessions that creates the objects to display
shinyApp(ui = ui, server = server)

