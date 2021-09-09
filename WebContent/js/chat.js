
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

var chatID;

function funzione(){
	event.preventDefault();
	 var mess =  document.getElementById("mex").value;
  
   //	alert(chat);


   var user = document.getElementById("username").value;
   $.ajax({
   type:"POST",
	url: "InsertMessage",
   data: {mex: mess, chatID: chatID, username: user},
    mess: "mex=" + mess,
    chat: "chatID="+ chatID,
    username: "username="+ user,
   success: function(){
//	alert("Sul cesso");
	$("#messaggio1").remove();
    $("#messaggio2").remove();
  //  $("#listchat").append("<li class='chat-right' id='messaggio1'> <div class='chat-hour'>08:56 <span class='fa fa-check-circle'></span></div> <div class='chat-text'>Hi, Russell <br> I need more information about Developer Plan.</div> <div class='chat-avatar'> <img src='https://www.bootdey.com/img/Content/avatar/avatar3.png' alt='Retail Admin'> <div class='chat-name'>Sam</div> </div> </li> <li class='chat-left' id='messaggio2'> <div class='chat-avatar'> <img src='https://www.bootdey.com/img/Content/avatar/avatar3.png' alt='Retail Admin'> <div class='chat-name'>Russell</div> </div> <div class='chat-text'>Are we meeting today? <br>Project has been already finished and I have results to show you.</div> <div class='chat-hour'>08:57 <span class='fa fa-check-circle'></span></div> </li> ");
 },
   error: function(){
		alert("errore");
	}
	
});

}


function funzione3(parameter){
	   var chat = parameter;
        chatID = chat;
      var user = document.getElementById("username").value;
     $.ajax({
   type:"POST",
	url: "RetrieveMessages",
   data: "chatid=" + chatID,
   success: function(data){
	let messaggi = JSON.parse(data);
	       	    $("#messaggio1").remove();
         $("#messaggio2").remove();
    
   for (var mex of messaggi){
	if (mex["username"]==user)
	 $("#listchat").append("<li class='chat-right' id='messaggio1'> <div class='chat-hour'>"+mex["dataInvio"]+" <span class='fa fa-check-circle'></span></div> <div class='chat-text'>"+mex["testo"]+"</div> <div class='chat-avatar'> <img src='https://www.bootdey.com/img/Content/avatar/avatar3.png' alt='Retail Admin'> <div class='chat-name'>"+mex["username"]+"</div> </div> </li>");
       else
 $("#listchat").append("<li class='chat-left' id='messaggio2'> <div class='chat-avatar'> <img src='https://www.bootdey.com/img/Content/avatar/avatar3.png' alt='Retail Admin'> <div class='chat-name'>"+mex["username"]+"</div> </div> <div class='chat-text'>"+mex["testo"]+"</div> <div class='chat-hour'>"+mex["dataInvio"]+" <span class='fa fa-check-circle'></span></div> </li> ");
}
 },
   error: function(){
		alert("errore");
	}
	
});

	   }
/*
function funzione2(){
	//alert(chat);
	    //$("#messaggio1").remove();
         //$("#messaggio2").remove();
    $("#listchat").append("<li class='chat-right' id='messaggio1'> <div class='chat-hour'>08:56 <span class='fa fa-check-circle'></span></div> <div class='chat-text'>Hi, Russell <br> I need more information about Developer Plan.</div> <div class='chat-avatar'> <img src='https://www.bootdey.com/img/Content/avatar/avatar3.png' alt='Retail Admin'> <div class='chat-name'>Sam</div> </div> </li> <li class='chat-left' id='messaggio2'> <div class='chat-avatar'> <img src='https://www.bootdey.com/img/Content/avatar/avatar3.png' alt='Retail Admin'> <div class='chat-name'>Russell</div> </div> <div class='chat-text'>Are we meeting today? <br>Project has been already finished and I have results to show you.</div> <div class='chat-hour'>08:57 <span class='fa fa-check-circle'></span></div> </li> ");
} 
*/
 function RicevimentoMessaggi(){
	 $.ajax({
   type:"POST",
	url: "RetrieveMessages",
   data: "chatid=" + chatID,
   success: function(data){
	let messaggi = JSON.parse(data);
	       	    $("#messaggio1").remove();
         $("#messaggio2").remove();
    
   for (var mex of messaggi){
	 $("#listchat").append("<li class='chat-right' id='messaggio1'> <div class='chat-hour'>08:56 <span class='fa fa-check-circle'></span></div> <div class='chat-text'>"+mex["test"]+" <br> I need more information about Developer Plan.</div> <div class='chat-avatar'> <img src='https://www.bootdey.com/img/Content/avatar/avatar3.png' alt='Retail Admin'> <div class='chat-name'>Sam</div> </div> </li> <li class='chat-left' id='messaggio2'> <div class='chat-avatar'> <img src='https://www.bootdey.com/img/Content/avatar/avatar3.png' alt='Retail Admin'> <div class='chat-name'>Russell</div> </div> <div class='chat-text'>Are we meeting today? <br>Project has been already finished and I have results to show you.</div> <div class='chat-hour'>08:57 <span class='fa fa-check-circle'></span></div> </li> ");
}
 },
   error: function(){
		alert("errore");
	}
	
});
} 



$(document).ready(function() {
  $.ajaxSetup({ cache: false }); // This part addresses an IE bug.  without it, IE will only load the first number and will never refresh
  setInterval(function() {
	var stringa = "chat.jsp #listchat";
    $('#listchat').load(stringa);
  }, 1000); // the "3000" 
});
