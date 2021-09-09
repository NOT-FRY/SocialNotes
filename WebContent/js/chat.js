
/*$(document).ready(function(){
    $("#testo").click(function(){
    $("#messaggio1").remove();
         $("#messaggio2").remove();
    $("#listchat").append("<li class='chat-right' id='messaggio1'> <div class='chat-hour'>08:56 <span class='fa fa-check-circle'></span></div> <div class='chat-text'>Hi, Russell <br> I need more information about Developer Plan.</div> <div class='chat-avatar'> <img src='https://www.bootdey.com/img/Content/avatar/avatar3.png' alt='Retail Admin'> <div class='chat-name'>Sam</div> </div> </li> <li class='chat-left' id='messaggio2'> <div class='chat-avatar'> <img src='https://www.bootdey.com/img/Content/avatar/avatar3.png' alt='Retail Admin'> <div class='chat-name'>Russell</div> </div> <div class='chat-text'>Are we meeting today? <br>Project has been already finished and I have results to show you.</div> <div class='chat-hour'>08:57 <span class='fa fa-check-circle'></span></div> </li> ");
      });

    
});*/


/*$(document).ready(function(){

$("#bottone").click(function(){
   var mess =  $("#mex").val();
   
   var chat = $("#chatcode").val();
console.log(chat);
   var user = $("#username").val();
   $.ajax({
   type:"POST",
	url: "InsertMessage",
   data: {mex: mess, chatID: chat, username: user},
   success: function(data){
   console.log("OTTIMO");
 },
   error: function(){
		console.log("errore");
	}
})
})
})  */

function funzione(){
	 var mess =  document.getElementById("mex").value;
   
   var chat = document.getElementById("chatcode").value;
console.log(chat);
   var user = document.getElementById("username").value;
   $.ajax({
   type:"POST",
	url: "InsertMessage",
   data: {mex: mess, chatID: chat, username: user},
   success: function(data){
   console.log("OTTIMO");
 },
   error: function(){
		console.log("errore");
	}
})
}

function funzione2(){
	 var chat = document.getElementById("chatcode").value;
	alert(chat);
	    $("#messaggio1").remove();
         $("#messaggio2").remove();
    $("#listchat").append("<li class='chat-right' id='messaggio1'> <div class='chat-hour'>08:56 <span class='fa fa-check-circle'></span></div> <div class='chat-text'>Hi, Russell <br> I need more information about Developer Plan.</div> <div class='chat-avatar'> <img src='https://www.bootdey.com/img/Content/avatar/avatar3.png' alt='Retail Admin'> <div class='chat-name'>Sam</div> </div> </li> <li class='chat-left' id='messaggio2'> <div class='chat-avatar'> <img src='https://www.bootdey.com/img/Content/avatar/avatar3.png' alt='Retail Admin'> <div class='chat-name'>Russell</div> </div> <div class='chat-text'>Are we meeting today? <br>Project has been already finished and I have results to show you.</div> <div class='chat-hour'>08:57 <span class='fa fa-check-circle'></span></div> </li> ");
}