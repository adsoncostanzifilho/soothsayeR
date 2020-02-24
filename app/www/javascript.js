window.onload = function(){ 
  
  var answerToggle = false;
  var answer = "";

  document.getElementById("petition").onkeypress = function change_letter(e)
  {
    let petition = 
    "SoothsayeR please answer my question, it is very important!                                                                                                                                   ";
    let len = document.getElementById("petition").value.length;
    
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


