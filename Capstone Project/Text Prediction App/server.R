#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(sbo)

load("sbo_model5.Rda")
model <- sbo_predictor(sbo_model5)

# Define server logic required to draw a histogram
shinyServer(function(input, output, session) {
    
    observe({
        prediction <- predict(model, input$text_input)
        

        #reactive buttons
        output$prediction1_button <- renderUI({
            actionButton("prediction1_button", label = prediction,
                         style ='font-size:150%;
                             font-weight:bold;')
        })
        
        #button events
        prediction1 <- prediction
        observeEvent(input$prediction1_button, {
            newText <- paste(input$text_input, prediction1)
            updateTextAreaInput(session, "text_input", value = newText)
        })
    })
})
