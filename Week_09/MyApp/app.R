# Kristen Howard
#
#------------------------------------
library(shiny)
ui<-fluidPage('Modeling Queenz') # Input functions &  Output functions
server<-function(input,output){}
shinyApp(ui = ui, server = server)
#------------------------------------
# Lets create an input with a *Input function. . . Then you add this into the ui. Lets do this below
sliderInput(inputId = "num", # Have to have an input ID
            label = "Choose a number",
            value = 25, min = 1, max = 100
            )
#-----------------------------------
library(shiny)
ui<-fluidPage(sliderInput(inputId = "num", # Have to have an input ID
                          label = "Choose a number", # Label above the slider
                          value = 23, min = 0, max = 13897 # values for the slider
))
server<-function(input,output){}
shinyApp(ui = ui, server = server)
#------------------------------------ Next step - adding in plotOutput. . . should not create anything new
ui<-fluidPage(
  sliderInput(inputId = "num"
              , # ID name for the input
              label = "Choose a number"
              , # Label above the input
              value = 25, min = 1, max = 100 # values for the slider
  ),
  plotOutput("hist") #creates space for a plot called hist
)
server<-function(input,output){}
shinyApp(ui = ui, server = server)
#------------------------------------- 
ui<-fluidPage(
  sliderInput(inputId = "num"
              , # ID name for the input
              label = "Choose a number"
              , # Label above the input
              value = 25, min = 1, max = 100 # values for the slider
  ),
server<-function(input,output){
  output$hist <- renderPlot({ # basic ggplot goes here
                                # R code to make the hist output goes here
                                # {} allows us to put all our R code in one nice chunck
    data<-tibble(x = rnorm(100)) # 100 random normal points
    ggplot(data, aes(x = x))+ # make a histogram
      geom_histogram()
  })
}
shinyApp(ui = ui, server = server)
#--------------------------------------------
ui<-fluidPage(
  sliderInput(inputId = "num"
              , # ID name for the input
              label = "Choose a number"
              , # Label above the input
              value = 25, min = 1, max = 100 # values for the slider
  ),
  plotOutput("hist") #creates space for a plot called hist
)
server<-function(input,output){
  output$hist <- renderPlot({
    # {} allows us to put all our R code in one nice chunck
    data<-tibble(x = rnorm(input$num)) # 100 random normal points
    ggplot(data, aes(x = x))+ # make a histogram
      geom_histogram() 
    