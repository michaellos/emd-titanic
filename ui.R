library(shiny)

shinyUI(fluidPage(

    titlePanel("Titanic - would you survive?"),

    hr(),

    h3("Provide the following details"),
    
    sidebarLayout(
        
        fluidRow(
            
            column(3, 
                   textInput("textFirstName", label = h3("First name"), 
                             value = "")), 
            
            column(3, 
                   textInput("textSurname", label = h3("Surname"), 
                             value = "")), 
            
            column(3,
                   selectInput("selectSex", label = h3("Select your sex"), 
                               choices = list("Male" = "male", "Female" = "female"), selected = "male")),
        ),
        
        fluidRow(
            
            column(3,
                   numericInput("numAge", label = h3("Age"), value="")),
            
            column(3,
                   selectInput("selectClass", label = h3("Ticket class"), 
                               choices = list("1st" = 1, "2nd" = 2, "3rd" = 3), selected = 1)),
            column(3,
                   br(),
                   br(),
                   br(),
                   actionButton("submitButton", label = "Submit")),
                   
            
            column(3,
                   textOutput("textResult"))
        ),
    )
))
