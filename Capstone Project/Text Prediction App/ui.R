#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinythemes)

# Define UI for application that draws a histogram
shinyUI(fluidPage(theme = shinytheme("superhero"),
                  titlePanel(
                  h3("John Hopkins University - Coursera - Data Science Specialization - Capstone Project", align = "center")),
                  sidebarPanel(
                  h3("The text predictor was built using the N-gram Stupid Back-off model algorithm, specifically the sbo R package."), 
                  h3("Instructions:"), 
                  h3("- Start typing any word to see your predictions below."),
                  h3("- Click the button to update the text with the next two predicted words or continue typing."),
                  ),
                  mainPanel(                             
                            headerPanel(h1("Next word Predictor")),
                            # first row - Text input
                            textAreaInput("text_input", "", value="", width = "200%", height = "200px"),
                            # second row - Button - Predicted word
                             div(style="display:inline-block;width:50%;text-align: center;",
                                 uiOutput("prediction1_button"))
                             ),
                            style = "float: none; margin: 0 auto")
)