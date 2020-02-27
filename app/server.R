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
    
    if(input$lang == 'en')
    {
      connect_text <- 'Reconnecting soothsayeR to <b>everything</b>...'
    }
    
    if(input$lang == 'es')
    {
      connect_text <- 'Reconectando soothsayeR a <b>todo</b>...'
    }
    
    if(input$lang == 'bra')
    {
      connect_text <- 'Reconectando soothsayeR a <b>tudo</b>...'
    }
    
    shinyalert(
      className = 'sweet_connect',
      text = HTML(connect_text),
      imageUrl = 'img/gif_connection2.gif',
      html = TRUE,
      closeOnClickOutside = FALSE,
      showConfirmButton = FALSE,
      timer = 3000
    )
  })
  
  # HELP
  observeEvent(input$help, {
    
    if(input$lang == 'en')
    {
      help_text <- "
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
        and complete the request phrase anyway you want.
        </h4>
        
        
        <img src='img/request.PNG' height='150px' class = 'img_request'>"
    }
    
    if(input$lang == 'es')
    {
      help_text <- "
        <h4>
        SoothsayeR es una interfaz desarrollada en R basada en la vieja broma llamada '<b>Pedro Responde</b>'..
        </h4>
        
        <h4>
        La idea del juego es jugar con tus amigos haciendo preguntas de las quales tu ya sabes las respuestas,
        y hacerles creer que el R es quién está respondiendo ...
        </h4>
        
        <hr>
        
        <h3>
        <b>¿Cómo jugar con soothsayeR?</b> 
        </h3>
        
        <h4>
        Sólo necesita presionar <b>punto</b> (.) en el teclado 
        en la sesión de petición y luego escribir la respuesta en secreto.
        Cuando presionas <b>punto</b> en la entrada de texto de solicitud, todo lo que escriba se enmascarará, 
        entonces va a poder poner la respuesta sin que nadie se dé cuenta.
        </h4>
        
        <h4>
        Luego, cuando haya terminado de escribir la respuesta, 
        solo debe presionar punto nuevamente y completar la frase de solicitud de la forma que desee.
        </h4>
        
        
        <img src='img/request.PNG' height='150px' class = 'img_request'>"
    }
    
    if(input$lang == 'bra')
    {
      help_text <- "
        <h4>
        SoothsayeR é uma interface desenvolvida em R com base na velha brincadeira chamada '<b>Pedro Responde</b>'..
        </h4>
        
        <h4>
        A idéia do jogo é brincar com seus amigos, fazendo perguntas das quais você já sabe as respostas,
        e fazê-los acreditar que o R é quem está respondendo ...
        </h4>
        
        <hr>
        
        <h3>
        <b>Como brincar com o soothsayeR?</b> 
        </h3>
        
        <h4>
        Somente é necessário pressionar <b>ponto</b> (.) no teclado
        na sessão de solicitação e, em seguida, escrever a resposta em segredo.
        Quando você pressiona <b>ponto</b> na entrada de texto solicitada, 
        tudo o que você escrever será mascarado,
        Então você será capaz de colocar a resposta sem que ninguém perceba.
        </h4>
        
        <h4>
        Então, quando você terminar de escrever a resposta, 
        você só precisará pressionar ponto novamente e concluir a frase de solicitação da maneira que desejar.
        </h4>
        
        
        <img src='img/request.PNG' height='150px' class = 'img_request'>"
    }
    
    shinyalert(
      className = 'sweet_help',
      closeOnClickOutside = TRUE,
      closeOnEsc = TRUE,
      showConfirmButton = FALSE,
      title = 'soothsayeR...',
      text = HTML(help_text),
      html = TRUE)
  })
  
  
  # DEFINING THE ANSWER

  answer <- eventReactive(input$guess, {
   
     if(input$petition == "")
    {
      if(input$lang == 'en')
      {
        response = 'You need to ask me!'
        Sys.sleep(1.5)
        return(response)
      }
      if(input$lang == 'es')
      {
        response = '¡Necesitas preguntarme!'
        Sys.sleep(1.5)
        return(response)
      }
      if(input$lang == 'bra')
      {
        response = 'Você precisa me perguntar!'
        Sys.sleep(1.5)
        return(response)
      }
      
    }
    
    if(input$question == "")
    {
      if(input$lang == 'en')
      {
        response = 'No question, no guess!'
        Sys.sleep(1.5)
        return(response)
      }
      
      if(input$lang == 'es')
      {
        response = '¡Si no hay duda no voy a adivinar!'
        Sys.sleep(1.5)
        return(response)
      }
      
      if(input$lang == 'es')
      {
        response = 'Sem dúvida, sem palpites!'
        Sys.sleep(1.5)
        return(response)
      }

    }
    
    if(input$question != "" && input$final_answer != "")
    {
      response = input$final_answer
      Sys.sleep(1.5)
      return(response)
    } 
    
    if(input$question != "" && input$final_answer == "")
    {
      
      if(input$lang == 'en')
      {
        answer_options <- c(
          "Why should I answer to that?",
          "Please try again tomorrow. Or never...",
          "I'm tired... Try again another time.",
          "Not now, I'm busy. Maybe later..",
          "I lost the connection. Reconnect me, please!")
      }
      
      if(input$lang == 'es')
      {
        answer_options <- c(
          "¿Por qué debería responder a eso?",
          "Por favor intente de nuevo mañana. O nunca...",
          "Estoy cansado ... vuelve a intentarlo otra vez.",
          "Ahora no, estoy ocupado. Quizas mas tarde..",
          "Perdí la conexión. ¡Reconectame, por favor!")
      }
      
      if(input$lang == 'bra')
      {
        answer_options <- c(
          "Por que eu deveria responder isso?",
          "Por favor, tente novamente amanhã. Ou nunca...",
          "Estou cansado ... Tente novamente outra hora.",
          "Agora não, estou ocupada. Talvez mais tarde..",
          "Eu perdi a conexão. Reconecte-me, por favor!")
      }
      
      response = sample(answer_options,1)
      Sys.sleep(1.5)
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
  
  
  # TRANSLATING INTERFACE
  
  observeEvent(input$lang,{
    
    if(input$lang == 'en')
    {
      updateActionButton(
        session = session,
        inputId = "help",
        label   = "Help"
      )
      
      updateActionButton(
        session = session,
        inputId = "connect",
        label   = "Reconnect"
      )
      
      updateTextInput(
        session = session,
        inputId     = 'petition', 
        label       = 'Request:', 
        value       = "", 
        placeholder = 'R please answer my question, it is very important!'
      )
      
      updateTextInput(
        session = session,
        inputId     = 'question', 
        label       = 'Question:', 
        value       = "", 
        placeholder = 'Make your question...'
      )
      
      updateActionButton(
        session = session,
        inputId = "guess",
        icon = icon('magic'),
        label   =  HTML("<b>GUESS</b>")
      )
      
    }
    
    if(input$lang == 'es')
    {
      updateActionButton(
        session = session,
        inputId = "help",
        label   = "Ayuda"
      )
      
      updateActionButton(
        session = session,
        inputId = "connect",
        label   = "Reconectar"
      )
      
      updateTextInput(
        session = session,
        inputId     = 'petition', 
        label       = 'Petición:', 
        value       = "", 
        placeholder = 'R por favor conteste mi pregunta, es muy importante!'
      )
      
      updateTextInput(
        session = session,
        inputId     = 'question', 
        label       = 'Pregunta:', 
        value       = "", 
        placeholder = 'Haga su pregunta...'
      )
      
      updateActionButton(
        session = session,
        inputId = "guess",
        icon = icon('magic'),
        label   =  HTML("<b>Adivinar</b>")
      )
      
    }
    
    if(input$lang == 'bra')
    {
      updateActionButton(
        session = session,
        inputId = "help",
        label   = "Ajuda"
      )
      
      updateActionButton(
        session = session,
        inputId = "connect",
        label   = "Reconectar"
      )
      
      updateTextInput(
        session = session,
        inputId     = 'petition', 
        label       = 'Solicitação:', 
        value       = "", 
        placeholder = 'R por favor responda minha pergunta, é muito importante!'
      )
      
      updateTextInput(
        session = session,
        inputId     = 'question', 
        label       = 'Pergunta:', 
        value       = "", 
        placeholder = 'Faça sua pergunta...'
      )
      
      updateActionButton(
        session = session,
        inputId = "guess",
        icon = icon('magic'),
        label   =  HTML("<b>Adivinhar</b>")
      )
      
    }
        
  })
  

  
  
})
