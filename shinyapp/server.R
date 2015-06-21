library(shiny)
data(Titanic)
df <- data.frame(Titanic)

shinyServer(function(input, output) {
    survived <- reactive({
        survived <- df$Freq[df$Class == strsplit(input$Class, " ")[[1]][1]
                            & df$Sex == input$Sex & df$Age == input$Age
                            & df$Survived == "Yes"]
    })
    
    deceased <- reactive({
        deceased <- df$Freq[df$Class == strsplit(input$Class, " ")[[1]][1]
                            & df$Sex == input$Sex & df$Age == input$Age
                            & df$Survived == "No"]
    })
    
    output$text <- renderUI({
        if (survived() + deceased() == 0)
            prob.text <- sprintf(paste("Your probability of surviving",
                                       "cannot be determined. Good luck!"))
        else
            prob.text <- sprintf("Your probability of surviving is: %.2f",
                                 survived() / (survived() + deceased()))
        HTML(paste(sprintf("You're a %s %s with a %s ticket.",
                           tolower(input$Sex),
                           tolower(input$Age),
                           input$Class),
                   sprintf("Survived: %d", survived()),
                   sprintf("Deceased: %d", deceased()),
                   prob.text,
                   sep="<br/>"))
    })
})