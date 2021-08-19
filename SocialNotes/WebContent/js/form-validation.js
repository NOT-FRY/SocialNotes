function formValidation(){

  var nome = document.registrazione.firstName;
  var cognome = document.registrazione.lastName;
  var username = document.registrazione.username;
  var pwd = document.registrazione.password;
  var uemail = document.registrazione.email;

  if(allLetter(nome)){
    if(allLetter(cognome)){
      if(usernameValidation(username,3,12)){
        if(passwordValidation(pwd,5,12)){
          if(validateEmail(uemail)){
            return true;
          }
        }
      }
    }
  }
  return false;
}

function usernameValidation(uid,mx,my){
    uid.classList.remove("is-invalid");
    uid.classList.remove("is-valid");
	var feedback = document.getElementById("username-feedback");
  	var uid_len = uid.value.length;

	var stringLunghezza = "Il nome utente è obbligatorio. La lunghezza deve essere compresa tra 3 e 15 caratteri. Non sono ammessi caratteri speciali o spazi.";
	var stringDisponibile = "Il nome utente è già stato preso, si prega di selezionarne un altro";
	
	var usernameFormat = /^[A-Za-z0-9]{3,15}$/
	
  	if (!uid.value.match(usernameFormat)){
			
			feedback.innerHTML="";//tolgo tutto il testo del feedback negativo
			feedback.appendChild(document.createTextNode(stringLunghezza));
    	uid.classList.add("is-invalid");
    	uid.focus();
    	return false;
  	}
	//Faccio la chiamata AJAX per vedere se il nome utente è disponibile
	
	
	ajaxCall('CheckUsernameAvailableAJAX',checkUsernameAvailable, uid.value);
	function checkUsernameAvailable(isAvailable){
		if (isAvailable=="false"){
			if(feedback.hasChildNodes){
				feedback.innerHTML="";
			}
			feedback.appendChild(document.createTextNode(stringDisponibile));
			uid.classList.add("is-invalid");
    		uid.focus();
    		return false;
		}else{
			feedback.removeChild;
		}
   	}

  	uid.classList.add("is-valid");
  	return true;
}

function passwordValidation(passid,mx,my){
  passid.classList.remove("is-invalid");
  passid.classList.remove("is-valid");
  var passid_len = passid.value.length;
  //Per la lunghezza della password modificare anche i valori nell' espressione regolare 5,12
  var pwdformat = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{5,12}$/;
  if (passid_len == 0 ||passid_len >= my || passid_len < mx || !passid.value.match(pwdformat)){
    passid.classList.add("is-invalid");
    passid.focus();
    return false;
  }
  passid.classList.add("is-valid");
  return true;
}

function allLetter(uname){
  uname.classList.remove("is-valid");
  uname.classList.remove("is-invalid");
  var letters = /^[A-Za-z]+$/;
  if(uname.value.match(letters)){
    uname.classList.add("is-valid");
    return true;
  }
  else{
    uname.classList.add("is-invalid");
    uname.focus();
    return false;
  }
}

function validateEmail(uemail){
  	uemail.classList.remove("is-invalid");
  	uemail.classList.remove("is-valid");
	var feedback = document.getElementById("email-feedback");
	var stringValid="Per favore inserisci un indirizzo Email valido.";
	var stringUnavailable="L'indirizzo scelto è già esistente."
  	var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;

	if(!uemail.value.match(mailformat)){

		feedback.innerHTML="";
		feedback.appendChild(document.createTextNode(stringValid));
	    uemail.classList.add("is-invalid");
    	return false;
	}
	
	ajaxCall('CheckEmailAvailableAJAX',checkEmailAvailable, uemail.value);
	function checkEmailAvailable(isAvailable){
		if (isAvailable=="false"){
			if(feedback.hasChildNodes){
				feedback.innerHTML="";
			}
			feedback.appendChild(document.createTextNode(stringUnavailable));
			uemail.classList.add("is-invalid");
    		uemail.focus();
    		return false;
		}else{
			feedback.removeChild;
		}
	}
	uemail.classList.add("is-valid");
    return true;

}

function ajaxCall(url, callback, parameter) {
	var req = getXmlHttpRequest();
	try {

		req.onreadystatechange = getReadyStateHandler(req,callback);
		req.open('POST', url, true);
		req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		console.log("Open and send request");
		req.send("param=" + parameter);
	} catch (e1) {
	}
}

function getReadyStateHandler(req, responseTxtHandler) {
	return function() {
		
		if (req.readyState == 1) {
			console.log("Server connection");
		} else if ( req.readyState == 2 ) {
			console.log("Send request");
		} else if ( req.readyState == 3 ) {
				console.log("Receive response");
		} else if (req.readyState == 4) {
			console.log("Request finished and response is ready");
			if (req.status == 200 || req.status == 304) {
				responseTxtHandler(req.responseText);
			} else {
				console.log("Response error "+ req.status + " " + req.statusText);
			}
		} 

	};
}




function getXmlHttpRequest() {

	var xhr = false;
	var activeXoptions = new Array("Microsoft.XmlHttp", "MSXML4.XmlHttp",
			"MSXML3.XmlHttp", "MSXML2.XmlHttp", "MSXML.XmlHttp");

	try {
		xhr = new XMLHttpRequest();
		console.log("Get XML http request");
	} catch (e) {
	}

	if (!xhr) {
		var created = false;
		for (var i = 0; i < activeXoptions.length && !created; i++) {
			try {
				xhr = new ActiveXObject(activeXoptions[i]);
				created = true;
				console.log("Get ActiveXObject XML http request");
			} catch (e) {
			}
		}
	}
	return xhr;
}

