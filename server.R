library(shiny)
library(randomForest)
library(caret)
library(rpart)
library(mice)

set.seed(1)
data <- read.csv("titanic.csv", stringsAsFactors = FALSE)
# print(dim(data))

data_limited <- data[1:891, c("Pclass", "Sex", "Age")]
data_limited$Survived=as.factor(data$Survived)

# print(data_limited[!complete.cases(data_limited),])

init = mice(data_limited, maxit=0)
meth = init$method
predM = init$predictorMatrix

meth[c("Age")]="norm"
imputed = mice(data_limited, method=meth, predictorMatrix=predM, m=5)
data_limited <- complete(imputed)

ctrl <- trainControl(
  method = "repeatedcv",
  number = 10,
  repeats = 2)

fit <- train(Survived~ .,
            data = data_limited,
            method = "rf",
            trControl = ctrl,
            ntree = 100)

# print(fit)


shinyServer(function(input, output) {

  observeEvent(input$submitButton, {
    if(!is.na(input$numAge) & input$numAge>0 & input$numAge < 120) {
      sex <- input$selectSex
      Pclass <- as.numeric(input$selectClass)
      age <- input$numAge
      print(age)
      
      df <- data.frame(Pclass = Pclass, Sex = sex, Age = age)
      res <- predict(fit, newdata = df, type="prob")
      output$textResult <- renderText({  
        paste("Your chances to survive: ", res[2]*100, "%")
      }) 
    }
    else {
      output$textResult <- renderText({  
        paste("Provide at least your age!!!")
      }) 
    }
  })
})
