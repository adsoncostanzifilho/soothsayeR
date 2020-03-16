
ui <- fluidPage(
  column(
    width = 12,
    radioGroupButtons(
      inputId = "lang22",
      label = "", 
      choices = c(`<div class='br'></div>` = "es", 
                  `<div class='es'></div>` = "br", 
                  `<div class='en'></div>` = "en"),
      justified = TRUE
    )),
  
  textOutput("txt")
)

server <- function(input, output) {
  output$txt <- renderText({
    paste("You chose", input$test)
  })
}

shinyApp(ui, server)
