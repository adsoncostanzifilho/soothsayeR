# ui
require(shiny)
require(shinyWidgets)
require(shinyalert)
require(shinyjs)
require(shinycssloaders)
require(dplyr)

shinyUI(
  fluidPage(
    # shiny js
    useShinyjs(),
    #tags$head(includeScript("www/googleanalytics.js")),
    tags$script(src = "javascript.js"),
    
    ##-- Favicon ----
    tags$head(
      tags$link(
        rel = "shortcut icon", 
        href = "img/logo.ico"),
      
      #-- biblio js ----
      tags$link(
        rel="stylesheet", 
        type = "text/css",
        href = "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"),
      
      tags$link(
        rel="stylesheet", 
        type = "text/css",
        href = "https://fonts.googleapis.com/css?family=Open+Sans|Source+Sans+Pro")
    ),
    
    ##-- Logo ----
    list(
      tags$head(
        HTML('<link rel="icon", href="img/logo.PNG",type="image/png" />'))),
    
    # PAGE NAME
    div(
      style = "padding: 1px 0px; width: '100%'",
      titlePanel(
        title = "", 
        windowTitle = "soothsayeR")),
    
    # THEME 
    theme = "styles.css", 
    
    # ALERT
    useShinyalert(),  
    
    # START PAGE ----
    
    # LOGO
    column(
      width = 12, 
      div(img(src = "img/logo2.ico", height = "100px"))
    ),
    
    # HELP
    column(
      width = 12,
      class = 'help',
      actionButton(
        inputId = "help",
        label   = "Help",
        class   = 'btn_help')
    ),
    
    # RECONNECT
    column(
      width = 12,
      class = 'connect',
      actionButton(
        inputId = "connect",
        label   = "Reconnect",
        class   = 'btn_connect')
    ),
    
    # SET LANGUAGE
    column(
      width = 3,
      class = "lang",
      radioGroupButtons(
        inputId = "lang",
        label = "", 
        choices = c(`<div class='en'></div>`  = "en", 
                    `<div class='bra'></div>` = "bra", 
                    `<div class='es'></div>`  = "es"),
        justified = TRUE
      )
      
    ),
    
    br(), br(), br(), br(), br(), br(), br(),

    
    # INPUT RESPONSE
    column(
      width = 12,
      class = 'please',
      textInput(
        inputId     = 'petition', 
        label       = 'Request:', 
        value       = "", 
        placeholder = 'R please answer my question, it is very important!TESTE!')
    ),
    
    br(), br(), br(), br(), br(), br(),
    
    
    # INPUT QUESTION
    column(
      width = 12,
      class = 'please',
      textInput(
        inputId     = 'question', 
        label       = 'Question:', 
        value       = "", 
        placeholder = 'Make your question...')
    ),
    
    
    br(), br(), br(), br(), br(), br(), br(), 
    
    column(
      width = 3,
      actionButton(
        inputId = "guess",
        icon = icon('magic'),
        label   =  HTML("<b>GUESS</b>"),
        class   = 'btn_guess')
      
    ),
    
    column(
      width = 9,
      class = 'response',
      h1(textOutput("resp") %>% withSpinner(color = '#50849B'))
    )
    
  )
)