library(shiny)

shinyUI(fluidPage(
    titlePanel("Titanic Survival Predictor"),
    
    sidebarLayout(
        sidebarPanel(
            helpText(paste("Please enter your age, gender and ticket type.",
                           "To get your probability of surviving on the Titanic,",
                           'press the "Survived?" button')),
            
            selectInput("Age", h4("Age"),
                        c("Child", "Adult")),
            br(),
            radioButtons("Sex", h4("Gender"), c("Male", "Female")),
            br(),
            selectInput("Class", h4("Ticket type"),
                        c("1st class", "2nd class",
                          "3rd class", "Crew member")
            ),
            br(),
            submitButton("Survived?")
        ),
        
        mainPanel(
            htmlOutput("text")
        )
    )
))