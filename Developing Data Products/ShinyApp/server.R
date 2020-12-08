#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

shinyServer(function(input, output) {
    output$answer1 <- renderText({
        if(input$slider1 == 5){
            return(paste("<span style=\"color:green\">Good Job!</span>"))
            
        }else{
            return(paste("<span style=\"color:red\">Try Again!</span>"))
        }
    })
    
    ntext1 <- eventReactive(input$button1, {
        ("$0.05. A $0.05 ball plus a bat costing $1.05 will set you back $1.10. And, of course, $1.05 is exactly $1 more expensive than $0.05")
    })
    
    output$nText1 <- renderText({
        ntext1()
    
    })

    output$answer2 <- renderText({
        if(input$slider2 == 5){
            return(paste("<span style=\"color:green\">Good Job!</span>"))
            
        }else{
            return(paste("<span style=\"color:red\">Try Again!</span>"))
        }
    })
    

    ntext2 <- eventReactive(input$button2, {
        ("5 minutes - It takes exactly 5 minutes for 1 widget machine to make 1 widget. Therefore, it would take 5 minutes to make 100 widgets from 100 widget machines.")
    })
    
    output$nText2 <- renderText({
        ntext2()
    })
    
    output$answer3 <- renderText({
        if(input$slider3 == 47){
            return(paste("<span style=\"color:green\">Good Job!</span>"))
            
        }else{
            return(paste("<span style=\"color:red\">Try Again!</span>"))
        }
    })

    ntext3 <- eventReactive(input$button3, {
        ("47 days - If the area of the lake covered in lilypads doubles every day, it would only take one day for it to go from being half covered to fully covered. Take one day away from 48 days and you're left with 47")
    })
    
    output$nText3 <- renderText({
        ntext3()
    })
})
