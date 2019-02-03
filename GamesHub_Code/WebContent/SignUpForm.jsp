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
      <p id="demo1"></p>   
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-envelope"></i> </span>
		 </div>
        <input name="email" class="form-control" placeholder="Indirizzo Email" type="text" id="mail" required>
    </div> 
     <p id="demo2"></p>   
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-phone"></i> </span>
		</div>
    	<input name="phone" class="form-control" placeholder="Numero di telefono" type="text" id="phone" required>   	    
    </div> 
       <p id="demo3"></p>   
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-address-card"></i> </span>
		</div>
		<input name = "cf" class="form-control" type="text" placeholder="Codice Fiscale" id="cf" required>
		
	</div> 
	<div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-home"></i> </span>
		</div>
		<input name="indirizzo" class="form-control" type="text" placeholder="Indirizzo" id="indirizzo" required>
		
	</div> 
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-lock "></i> </span>
		</div>
        <input name="password" class="form-control" placeholder="Crea password" type="password" id="password" required>
    </div> 
        <p id="demo4"></p>   
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-lock "></i> </span>
		</div>
        <input name="repeat" class="form-control" placeholder="Ripeti password" type="password" id="passwordRepeat" required>
    </div>  
       <p id="demo5"></p> 
          
     
	                  
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
    
    
    /* Funzioni di validazione campi*/	 
	 
	 function ValidateEmail(uemail)
		{
		   var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
		   if(uemail.value.match(mailformat))
		   {
			   $("#mail").css({"border-color":"#00fd00"});
			   $("#demo2").text("");
		     return true;
		   }
		   else
		   {
			   $("#mail").css({"border-color":"red"});
		      $("#demo2").text("Email non valida, scrivere un email in un formato corretto.Es: example@live.it");
		      return false;
		   }
	    }
		
      
		function phonenumber(inputtxt)
		{
		  var phoneno = /^\+?([0-9]{3})\)?([0-9]{7})$/;
		  if(inputtxt.value.match(phoneno))
		        {
			      $("#phone").css({"border-color":"#00fd00"});
			      $("#demo3").text("");
		          return true;
		        }
		      else
		        {
		    	 $("#phone").css({"border-color":"red"});
		    	  $("#demo3").text("Numero di telefono non valido!");
		        return false;
		        }
		}
		
		function passwordValidator(password)
		{
			var passw= /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])\w{6,}$/;
			if(password.value.match(passw)) 
			{ 
				$("#password").css({"border-color":"#00fd00"});
				$("#demo4").text("");
			    return true;
			}
			else
			{ 
				$("#password").css({"border-color":"red"});
			   $("#demo4").text("La password deve contenere almeno un numero, una lettera minuscola e una maiuscola e deve essere lunga almeno sei caratteri che possono essere lettere, numeri o underscore");
				
			     return false;
			}
			    	
		}
		
		function passwordRepeat(password,repeat){
			
			if(repeat.value != password.value){
				$("#passwordRepeat").css({"border-color":"red"});
				 $("#demo5").text("Le due password non coincidono!");
				 return false;
			}
			else {
				$("#passwordRepeat").css({"border-color":"#00fd00"});
				 $("#demo5").text("");
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
	  	
			return true;
	    }
	  
	 $("#mail").change(function(){
		 mailCorrect = ValidateEmail(this);
		 
	 });
	 
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
	 
    
    
    
    
    
    
    
    
    $(document).ready(function(){
    	 $("#userName").on("keyup click",function (e){
    		   var userName = $(this).val();
    		   var xhttp = new XMLHttpRequest();
     			xhttp.onreadystatechange = function() {
     				if (xhttp.readyState == 4) {
     	      			var result = xhttp.responseText;
     	      			var r = eval('('+result+')');
     	      			
     	      			if(r.avviso=="true"){ //se esiste già un account con lo stesso user
     	      				$("#demo1").text("UserName non disponibile");
     	      			 	$("#userName").css({"border-color":"red"});
     	      			 	usernameCorrect = false;
     	      			}else if(r.avviso=="false"){ //lo username è disponibile
     	      				$("#demo1").text("");
     	      				$("#userName").css({"border-color":"#00fd00"});
     	      				usernameCorrect = true;
     	     	      	}   
     	      			else if(r.avviso=="spazio"){ 
     	      				$("#demo1").text("Lo UserName non può contenere spazi");
     	      			 	$("#userName").css({"border-color":"red"});
     	      			 	usernameCorrect = false;
     	      			} 
     	      			else {
     	      				$("#userName").css({"border-color":"#e6e6e6 "});
     	      			    $("#demo1").text("");
     	      			 	usernameCorrect = false;
     	      			}	
     	    		}
     			};
     			
     			xhttp.open("POST", "userName", true);
      			xhttp.setRequestHeader("content-type","application/x-www-form-urlencoded");
      			xhttp.setRequestHeader("connection","close");
      			xhttp.send("userName="+userName+"&azione="+"controlloUserName");	
    	       // return false;	   
        });
    	 
    
    	
    	 
    	 
    	 
    	 
    	 
    	 
    	 
    	 
    	 
    	 
    	 
    	 
    	 
    	 
    });
    </script>
    
    
    
    
    
    
    
    
</body>
</html>