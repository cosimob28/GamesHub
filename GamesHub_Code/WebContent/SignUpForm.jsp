<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.gameshub.bean.Gioco,it.gameshub.bean.Carrello, it.gameshub.bean.ItemOrder"%>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="css/bootstrap.min.css" >
	  <link rel="stylesheet" href="css/StileRegistrazione.css" >
	  <link rel="stylesheet" href="css/fontawesome-all.css">
	  <link rel="icon" href="img/website/favicon.png">
	<title>Registrazione</title>
	
	<style type="text/css">
	.error{
	color: red;
	}
	</style>
</head>

<body>

 <script src="js/jquery.min.js"></script>
    <script src ="js/bootstrap.min.js"></script>

    <jsp:include page="Header.jsp"/>
    
   <div class="container">

<hr>
    
    <div class="card bg-light">
<article class="card-body mx-auto" style="max-width: 400px;">
	<h4 class="card-title mt-3 text-center">Se hai già un account </h4>
	<p>
		 <a href="ButtonLoginControl" class="btn btn-block btn-twitter"> <i class="fa fa-sign-in-alt"></i>   Login </a>
			
	</p>
	<p class="divider-text">
        <span class="bg-light">O</span>
    </p>
    <h4 class="card-title mt-3 text-center">Crea un account </h4>
    
	<form name="form" id="form" action="RegistrazioneControl" method="post" onsubmit="return validate(this)">
	
	<div class="form-group input-group">
    	 <div class="input-group-prepend">
		    <span class="input-group-text" > <i class="fa fa-venus-mars"></i> </span>
		</div>
		<div class="form-control" style="border:none; background: inherit; height:40px;">
	    	
    	
    	<fieldset>
			<input type="radio" name="inputSesso" class="sr-only" id="male" value="Uomo" checked>
  			<label for="male"><img width="35px" height="35px" alt="male" src="img/website/male.png"></label>
  			<input type="radio" name="inputSesso" class="sr-only" id="female" value="Donna">
  			<label for="female"><img width="35px" height="35px" src="img/website/female.png" alt="female"></label>
		</fieldset>
	</div>
	</div> 
	<div class="form-group input-group">
		<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-user"></i> </span>
		 </div>
		 
        <input name="inputName" class="form-control" placeholder="Nome" type="text" id="nome" required>
        <input name="inputCognome" class="form-control" placeholder="Cognome" type="text" id="cognome" required>
    </div> 
    <p id="nomeError" class="error"></p>
    <p id="cognomeError" class="error"></p>
	<div class="form-group input-group">
		<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-calendar-alt"></i> </span>
		 </div>
        <input name="data" class="form-control" type="date" id="data" required>
       
    </div> 
    
      
	
     <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-user-circle"></i> </span>
		 </div>
        <input name="UserName" id ="userName" class="form-control" placeholder="Username" type="text" required>
    </div> 
      <p id="userNameError" class="error"></p>   
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-envelope"></i> </span>
		 </div>
        <input name="email" class="form-control" placeholder="Indirizzo Email" type="text" id="mail" required>
    </div> 
     <p id="mailError" class="error"></p>   
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-phone"></i> </span>
		</div>
    	<input name="phone" class="form-control" placeholder="Numero di telefono" type="text" id="phone" required>   	    
    </div> 
       <p id="phoneError" class="error"></p>   
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-address-card"></i> </span>
		</div>
		<input name = "cf" class="form-control" type="text" placeholder="Codice Fiscale" id="cf" required>
	</div> 
	<p id="cfError" class="error"></p>  
	<div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-home"></i> </span>
		</div>
		<input name="indirizzo" class="form-control" type="text" placeholder="Indirizzo" id="indirizzo" required>
		<p id="indirizzoError" class="error"></p> 
	</div> 
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-lock "></i> </span>
		</div>
        <input name="password" class="form-control" placeholder="Crea password" type="password" id="password" required>
    </div> 
        <p id="passwordError" class="error"></p>   
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-lock "></i> </span>
		</div>
        <input name="repeat" class="form-control" placeholder="Ripeti password" type="password" id="passwordRepeat" required>
    </div>  
       <p id="passwordValError" class="error"></p> 
          
     
	                  
    <div class="form-group">
        <button type="submit" class="btn btn-primary btn-block" > Crea un Account  </button>
    </div>       
                                                                  
</form>
</article>
</div> 

</div> 

<script>	
    /* Dichiarazione variabili booleane per controllo campi*/
    var mailCorrect = false;
    var numberCorrect = false;
    var passwordCorrect = false;
    var passwordValCorrect = false;
    var usernameCorrect = false;
    var addressCorrect = false;
    var nameCorrect = false;
    var surnameCorrect = false;
    var cfCorrect = false;
    
    /* Funzioni di validazione campi*/	 
	 
    
      /**
		 * Funzione utilizzata per validare il formato dell'email
		 * 
		 */
    
	 function ValidateEmail(uemail)
		{
		   var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
		   if(uemail.value.match(mailformat))
		   {
			   $("#mail").css({"border-color":"#00fd00"});
			   $("#mailError").text("");
		     return true;
		   }
		   else
		   {
			   $("#mail").css({"border-color":"red"});
		      $("#mailError").text("Email non valida, scrivere un email in un formato corretto.Es: example@live.it");
		      return false;
		   }
	    }
		
	 /**
		 * Funzione utilizzata per validare il formato del numero di telefono
		 * 
		 */
		function phonenumber(inputtxt)
		{
		  var phoneno = /^\+?([0-9]{3})\)?([0-9]{7})$/;
		  if(inputtxt.value.match(phoneno))
		        {
			      $("#phone").css({"border-color":"#00fd00"});
			      $("#phoneError").text("");
		          return true;
		        }
		      else
		        {
		    	 $("#phone").css({"border-color":"red"});
		    	  $("#phoneError").text("Numero di telefono non valido!");
		        return false;
		        }
		}
		
		/**
		 * Funzione utilizzata per validare il formato dell'indirizzo.
		 * 
		 */
		function addressValidator(indirizzo)
		{
			var ind= /^(([A-Z])([a-z]+)(\s))+(\d+)(,)(\s?)(([A-Z])([a-z]+)(\s?))+$/;
			if(indirizzo.value.match(ind)) 
			{ 
				$("#indirizzo").css({"border-color":"#00fd00"});
				$("#indirizzoError").text("");
			    return true;
			}
			else
			{ 
				$("#indirizzo").css({"border-color":"red"});
			   $("#indirizzoError").text("L'indirizzo deve essere del formato es. 'Via Genova 24, Roma'");
				
			     return false;
			}
			    	
		}
		
		/**
		 * Funzione utilizzata per validare il formato del nome
		 * 
		 */
		function nameValidator(nome)
		{
			var nomeReg= /^(([A-Z])([a-z]+)(\s?))+$/;
			if(nome.value.match(nomeReg)) 
			{ 
				$("#nome").css({"border-color":"#00fd00"});
				$("#nomeError").text("");
			    return true;
			}
			else
			{ 
				$("#nome").css({"border-color":"red"});
			   $("#nomeError").text("Formato del Nome errato");
				
			     return false;
			}
			    	
		}
		
		/**
		 * Funzione utilizzata per validare il formato del cognome
		 * 
		 */
		function surnameValidator(cognome)
		{
			var cognomeReg= /^(([A-Z])([a-z]+)(\s?))+$/;
			if(cognome.value.match(cognomeReg)) 
			{ 
				$("#cognome").css({"border-color":"#00fd00"});
				$("#cognomeError").text("");
			    return true;
			}
			else
			{ 
				$("#cognome").css({"border-color":"red"});
			   $("#cognomeError").text("Formato del Cognome errato");
				
			     return false;
			}
			    	
		}
		
		
		/**
		 * Funzione utilizzata per validare il formato del codice fiscale
		 * 
		 */
		function cfValidator(cf)
		{
			var cfReg= /^(?:(?:[B-DF-HJ-NP-TV-Z]|[AEIOU])[AEIOU][AEIOUX]|[B-DF-HJ-NP-TV-Z]{2}[A-Z]){2}[\dLMNP-V]{2}(?:[A-EHLMPR-T](?:[04LQ][1-9MNP-V]|[1256LMRS][\dLMNP-V])|[DHPS][37PT][0L]|[ACELMRT][37PT][01LM])(?:[A-MZ][1-9MNP-V][\dLMNP-V]{2}|[A-M][0L](?:[1-9MNP-V][\dLMNP-V]|[0L][1-9MNP-V]))[A-Z]$/;
			if(cf.value.match(cfReg)) 
			{ 
				$("#cf").css({"border-color":"#00fd00"});
				$("#cfError").text("");
			    return true;
			}
			else
			{ 
				$("#cf").css({"border-color":"red"});
			   $("#cfError").text("Formato del CF errato");
				
			     return false;
			}
			    	
		}
		
		/**
		 * Funzione utilizzata per validare il formato della password
		 * 
		 */
		function passwordValidator(password)
		{
			var passw= /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])\w{6,}$/;
			if(password.value.match(passw)) 
			{ 
				$("#password").css({"border-color":"#00fd00"});
				$("#passwordError").text("");
			    return true;
			}
			else
			{ 
				$("#password").css({"border-color":"red"});
			   $("#passwordError").text("La password deve contenere almeno un numero, una lettera minuscola e una maiuscola e deve essere lunga almeno sei caratteri che possono essere lettere, numeri o underscore");
				
			     return false;
			}
			    	
		}
		
		/**
		 * Funzione utilizzata per validare il campo ripeti password
		 * 
		 */
		function passwordRepeat(password,repeat){
			
			if(repeat.value != password.value){
				$("#passwordRepeat").css({"border-color":"red"});
				 $("#passwordValError").text("Le due password non coincidono!");
				 return false;
			}
			else {
				$("#passwordRepeat").css({"border-color":"#00fd00"});
				 $("#passwordValError").text("");
				return true;
			}
		}
	
	/* Funzione chiamata al submit */
	 function validate(form){
		  

			if(!mailCorrect)
			return false;
			
			if(!numberCorrect)
		    return false;
		   
			if(!passwordCorrect)
				return false;
			
			if(!passwordValCorrect)
				return false;
			
			if(!usernameCorrect)
				return false;
	  		if(!addressCorrect)
				return false;
	  		if(!nameCorrect)
				return false;
	  		if(!surnameCorrect)
				return false;
	  		if(!cfCorrect)
				return false;
			return true;
	    }
	  
	  /* $("#mail").change(function(){
		 mailCorrect = ValidateEmail(this);
		 
	 });  */
	 
	 $("#phone").change(function(){
		 numberCorrect = phonenumber(this);
		 
	     });
	 
	 $("#password").change(function(){
		 passwordCorrect = passwordValidator(this);
		 if(($('#passwordRepeat').val().length)>0)
		 	passwordValCorrect = passwordRepeat(form.password,form.passwordRepeat);
	     });
	 
	 $("#passwordRepeat").change(function(){
		 passwordValCorrect = passwordRepeat(form.password,this);
		 
	     });
	 
	 $("#indirizzo").change(function(){
		 addressCorrect = addressValidator(form.indirizzo,this);
		 
	     });
	 $("#nome").change(function(){
		 nameCorrect = nameValidator(form.nome,this);
		 
	     });
	 $("#cognome").change(function(){
		 surnameCorrect = surnameValidator(form.cognome,this);
		 
	     });
	 $("#cf").change(function(){
		 cfCorrect = cfValidator(form.cf,this);
		 
	     });
    
    
    
    
	  /**
		 * Funzione utilizzata per verificare che l'username
	        inserito non sia stato già utilizzato.
		 * 
		 */
    
    $(document).ready(function(){
    	 $("#userName").on("keyup click change",function (e){
    		   var userName = $(this).val();
    		   var xhttp = new XMLHttpRequest();
     			xhttp.onreadystatechange = function() {
     				if (xhttp.readyState == 4) {
     	      			var result = xhttp.responseText;
     	      			var r = eval('('+result+')');
     	      			
     	      			if(r.avviso=="true"){ //se esiste già un account con lo stesso user
     	      				$("#userNameError").text("UserName non disponibile");
     	      			 	$("#userName").css({"border-color":"red"});
     	      			 	usernameCorrect = false;
     	      			}else if(r.avviso=="false"){ //lo username è disponibile
     	      				$("#userNameError").text("");
     	      				$("#userName").css({"border-color":"#00fd00"});
     	      				usernameCorrect = true;
     	     	      	}   
     	      			else if(r.avviso=="spazio"){ 
     	      				$("#userNameError").text("Lo UserName non può contenere spazi");
     	      			 	$("#userName").css({"border-color":"red"});
     	      			 	usernameCorrect = false;
     	      			} 
     	      			else {
     	      				$("#userName").css({"border-color":"#e6e6e6 "});
     	      			    $("#userNameError").text("");
     	      			 	usernameCorrect = false;
     	      			}	
     	    		}
     			};
     			
     			xhttp.open("POST", "UsernameControl", true);
      			xhttp.setRequestHeader("content-type","application/x-www-form-urlencoded");
      			xhttp.setRequestHeader("connection","close");
      			xhttp.send("userName="+userName+"&azione="+"controlloUserName");	
    	       // return false;	   
        });
    	 
  
  
    /**
	 * Funzione utilizzata per verificare che l'email 
        inserita non sia stata già utilizzata.
	 * 
	 */
   	 $("#mail").on("keyup  change",function (e){
   		   var email = $(this).val();
   			mailCorrect = ValidateEmail(this);
   			if(mailCorrect){
   		   		var xhttp = new XMLHttpRequest();
    				xhttp.onreadystatechange = function() {
    					if (xhttp.readyState == 4) {
    					
    					
	    	      			var result = xhttp.responseText;
	    	      			var r = eval('('+result+')');
	    	      			
	    	      			if(r.avviso=="true"){ //se esiste già un account con lo stessa email
	    	      				$("#mailError").text("Email già utilizzata");
	    	      			 	$("#mail").css({"border-color":"red"});
	    	      			 	mailCorrect = false;
	    	      			}else if(r.avviso=="false"){ //l'email non è stata mai utilizzata
	    	      				
		    	      				$("#mailError").text("");
		    	      				$("#mail").css({"border-color":"#00fd00"});
		    	      				mailCorrect = true;
	    	      				
	    	      			
	    	     	      	}   
	    	      			else if(r.avviso=="spazio"){ 
	    	      				$("#mailError").text("L'email non può contentere spazi");
	    	      			 	$("#mail").css({"border-color":"red"});
	    	      			 	mailCorrect = false;
	    	      			} 
	    	      			else {
	    	      				$("#mail").css({"border-color":"#e6e6e6 "});
	    	      			    $("#mailError").text("");
	    	      			 	mailCorrect = false;
	    	      			}
    					}	
    	    		};
    			}
    			
    			xhttp.open("POST", "EmailControl", true);
     			xhttp.setRequestHeader("content-type","application/x-www-form-urlencoded");
     			xhttp.setRequestHeader("connection","close");
     			xhttp.send("email="+email);	
   	       // return false;	   
       }); 
    });
    </script>
    
    
    
    
    
    
    
    
</body>
</html>