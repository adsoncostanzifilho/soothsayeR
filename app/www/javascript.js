window.onload = function(){ 
  
  var answerToggle = false;
  var answer       = "";
  var lang         = "en";
  var petition     = "R please answer my question, it is very important!                                                                                                                                   ";
  
  document.getElementById("petition").onkeypress = function change_letter(e)
  {
    
    lang = document.querySelector('input[name="lang"]:checked').value;
    
    if(lang === "en"){
      petition = "R please answer my question, it is very important!                                                                                                                                   ";
    }
    
    if(lang === "es"){
      petition = "R por favor conteste mi pregunta, es muy importante!                                                                                                                                   ";
    }
    
    if(lang === "bra"){
      petition = "R por favor responda minha pergunta, é muito importante!                                                                                                                                   ";
    }
    
    let len = document.getElementById("petition").value.length;
    
    let currentKey = e.key;
    
    const currentCode = e.which || e.code;
    
    if (!currentKey) 
    {
      currentKey = String.fromCharCode(currentCode);
    }
    
    if(e.key === ".")
    {
      answerToggle = !answerToggle;
      document.getElementById("petition").value += petition[len];
      console.log(answerToggle);
      return false;
    }
    
    else if (e.key.length === 1 && answerToggle)
    {
      answer += e.key;
      document.getElementById("petition").value += petition[len];
      console.log(answer);
      return false;
    }
  };


document.getElementById("guess").onclick = function(){
  Shiny.onInputChange("final_answer", answer);
  answer = "";
  answerToggle = false;
};

document.getElementById("petition").onclick = function(){
  document.getElementById("resp").innerHTML = "";
  answer = "";
  answerToggle = false;
};


};


