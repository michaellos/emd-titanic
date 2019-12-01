library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Titanic - would you survive?"),

    hr(),

    h3("Provide the following details"),
    
    # Sidebar with a slider input for number of bins
    sidebarLayout(
        
        fluidRow(
            # column(3,
            #        h3("Buttons"),
            #        actionButton("action",
            #                     label = "Action"),
            #        br(),
            #        br(),
            #        submitButton("Submit")),
            
            column(3, 
                   textInput("text", label = h3("First name"), 
                             value = "")), 
            
            column(3, 
                   textInput("text", label = h3("Second name"), 
                             value = "")), 
            
            column(3,
                   selectInput("select", label = h3("Select box"), 
                               choices = list("Male" = 1, "Female" = 2), selected = 1)),
        ),
        
        fluidRow(
            
            column(3, 
                   textInput("text", label = h3("Age"), 
                             value = "")), 
            
            column(3,
                   selectInput("select", label = h3("Ticket class"), 
                               choices = list("1st" = 1, "2nd" = 2, "3rd" = 3), selected = 3)),
            column(3,
                   br(),
                   br(),
                   br(),
                   submitButton("Submit")),
        ),

        
        # sidebarPanel(
        #     sliderInput("bins",
        #                 "Number of bins:",
        #                 min = 1,
        #                 max = 50,
        #                 value = 30)
        # ),

        # Show a plot of the generated distribution
        # mainPanel(
        #     plotOutput("distPlot")
        # )
    )
))
