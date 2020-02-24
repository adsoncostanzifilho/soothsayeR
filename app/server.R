# server

shinyServer(function(input, output, session){
  
  # CONNECTING TO THE STARS - Start
  observeEvent(TRUE, {
    shinyalert(
      className = 'sweet_connect',
      text = HTML('Connecting soothsayeR to <b>everything</b>...'),
      imageUrl = 'img/gif_connection2.gif',
      html = TRUE,
      closeOnClickOutside = FALSE,
      showConfirmButton = FALSE,
      timer = 2500
      )

  })
  
  # CONNECTING TO THE STARS - Button
  observeEvent(input$connect, {
    shinyalert(
      className = 'sweet_connect',
      text = HTML('Reconnecting soothsayeR to <b>everything</b>...'),
      imageUrl = 'img/gif_connection2.gif',
      html = TRUE,
      closeOnClickOutside = FALSE,
      showConfirmButton = FALSE,
      timer = 3000
    )
  })
  
  # HELP
  observeEvent(input$help, {
    shinyalert(
      className = 'sweet_help',
      closeOnClickOutside = TRUE,
      closeOnEsc = TRUE,
      showConfirmButton = FALSE,
      title = 'The soothsayeR...',
      text = HTML(
        "
        <h4>
        SoothsayeR is an interface developed in R based on the old prank called '<b>Peter answers</b>'..
        </h4>
        
        <h4>
        The game's idea is to play with your friends making questions that you know the answer, 
        and make them believe that <b>soothsayeR</b> is who is answering...
        </h4>
        
        <hr>
        
        <h3>
        <b>How to play with soothsayeR?</b> 
        </h3>
        
        <h4>
        You just need to press <b>dot</b> (.) on the keyboard 
        in the request session and then write the answer secretly.
        When you press <b>dot</b> in the request text input everything you type will be masked, 
        so you could put the answer without anyone noticing.
        </h4>
        
        <h4>
        Then, when you have finished typing the answer you just need to press dot again 
        and complete the request frase anyway you want.
        </h4>
        
        
        <img src='img/request_ok.PNG' height='150px' class = 'img_request'>

        "
      ),
      html = TRUE)
  })
  
  # SHINY JS
  
  
  
  # DEFINING THE ANSWER

  answer <- eventReactive(input$guess, {
    if(input$question == "")
    {
      response = 'No question no guess!'
      return(response)
    }
    if(input$question != "" && input$final_answer != "")
    {
      response = input$final_answer
      return(response)
    } 
    if(input$question != "" && input$final_answer == "")
    {
      answer_options <- c(
        "Why should I answer to that?",
        "Please try again tomorrow. Or never...",
        "I'm tired... Try again another time.",
        "Not now, I'm busy. Maybe later..",
        "I lost the connection.. Reconnect me, please!")
      
      response = sample(answer_options,1)
      return(response)
    }
    
  })
  
  
  # R ANSWER OUTPUT# text output
  output$resp <- renderText({
    answer()
  })
  
  
 
  # CLEAN INPUTS
  onclick(
    id = "petition",
    add = TRUE,
    expr = updateTextInput(
      session = session, 
      inputId = "petition", 
      value = ""
    )
  )
  
  onclick(
    id = "petition",
    add = TRUE,
    expr = updateTextInput(
      session = session, 
      inputId = "question", 
      value = ""
    )
  )
  

  
  
})
