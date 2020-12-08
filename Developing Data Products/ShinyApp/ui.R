#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

shinyUI(fluidPage(
    titlePanel("The world's shortest IQ test"),
    sidebarLayout(
        sidebarPanel(width = 8, 
            h3("Question 1"),         
            h4("A bat and a ball cost $1.10 in total. The bat costs $1 more than the ball. How much does the ball cost?"),
            sliderInput("slider1", "Slide Me!", 0, 110, 0),
            br(),
            br(),
            br(),
            br(),
            
            h3("Question 2"),
            h4("If it takes 5 machines 5 minutes to make 5 widgets, how long would it take 100 machines to make 100 widgets?"),
            sliderInput("slider2", "Slide Me!", 0, 100, 0),

            br(),
            br(),
            br(),
            br(),
            
            h3("Question 3"),
            h4("In a lake, there is a patch of lily pads. Every day, the patch doubles in size. If it takes 48 days for the patch to cover the entire lake, how long would it take for the patch to cover half of the lake? "),
            sliderInput("slider3", "Slide Me!", 0, 48, 0),

        ),
        mainPanel(width = 4,
                  htmlOutput("answer1"),
                  tags$head(tags$style("#answer1{font-size: 40px;
                         font-style: italic;
                         }"
                  )),
            actionButton("button1", "See answer"),
            verbatimTextOutput("nText1"),
            br(),
            br(),
            br(),
            br(),
            br(),
            br(),
            br(),
            br(),


            htmlOutput("answer2"),
            tags$head(tags$style("#answer2{font-size: 40px;
                         font-style: italic;
                         }"
            )),
            actionButton("button2", "See answer"),
            verbatimTextOutput("nText2"),
            br(),
            br(),
            br(),
            br(),
            br(),
            br(),
            br(),
            br(),

            
            htmlOutput("answer3"),
            tags$head(tags$style("#answer3{font-size: 40px;
                         font-style: italic;
                         }"
            )),
            actionButton("button3", "See answer"),
            verbatimTextOutput("nText3")
        )
    )
))

