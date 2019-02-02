$( document ).ready( function () {
    $( '.dropdown-menu a.dropdown-toggle' ).on( 'click', function ( e ) {
        var $el = $( this );
        var $parent = $( this ).offsetParent( ".dropdown-menu" );
        if ( !$( this ).next().hasClass( 'show' ) ) {
            $( this ).parents( '.dropdown-menu' ).first().find( '.show' ).removeClass( "show" );
        }
        var $subMenu = $( this ).next( ".dropdown-menu" );
        $subMenu.toggleClass( 'show' );
        
        $( this ).parent( "li" ).toggleClass( 'show' );

        $( this ).parents( 'li.nav-item.dropdown.show' ).on( 'hidden.bs.dropdown', function ( e ) {
            $( '.dropdown-menu .show' ).removeClass( "show" );
        } );
        
         if ( !$parent.parent().hasClass( 'navbar-nav' ) ) {
            $el.next().css( { "top": $el[0].offsetTop, "left": $parent.outerWidth() - 4 } );
        }

        return false;
    } );
} );


/*


$(document).ready(function(){
  $('.dropdown-submenu a.test').on("click", function(e){
    $(this).next('ul').toggle();
    e.stopPropagation();
    e.preventDefault();
  });
});

*/


/*Validazione form */

//After form loads focus will go to User id field.
function firstfocus()
{
var uid = document.loginForm.userid.focus();
return true;
}

// This function will validate User id.
function userid_validation(mx,my)
{
var uid = document.loginForm.userid;
var uid_len = uid.value.length;
if (uid_len == 0 || uid_len >= my || uid_len < mx)
{
alert("User Id should not be empty / length be between "+mx+" to "+my);
uid.focus();
return false;
}
// Focus goes to next field i.e. Password.
document.loginForm.passid.focus();
return true;
}

// This function will validate Password.
function passid_validation(mx,my)
{
var passid = document.loginForm.passid;
var passid_len = passid.value.length;
if (passid_len == 0 ||passid_len >= my || passid_len < mx)
{
alert("Password should not be empty / length be between "+mx+" to "+my);
passid.focus();
return false;
}
// Focus goes to next field i.e. Name.
document.loginForm.username.focus();
return true;
}

// This function will validate Name.
function allLetter()
{ 
var uname = document.loginForm.username;
var letters = /^[A-Za-z]+$/;
if(uname.value.match(letters))
{
// Focus goes to next field i.e. Address.
document.loginForm.address.focus();
return true;
}
else
{
alert('Username must have alphabet characters only');
uname.focus();
return false;
}
}

// This function will validate Address.
function alphanumeric()
{ 
var uadd = document.loginForm.address;
var letters = /^[0-9a-zA-Z]+$/;
if(uadd.value.match(letters))
{
// Focus goes to next field i.e. Country.
document.loginForm.country.focus();
return true;
}
else
{
alert('User address must have alphanumeric characters only');
uadd.focus();
return false;
}
}

// This function will select country name.
function countryselect()
{
var ucountry = document.loginForm.country;
if(ucountry.value == "Default")
{
alert('Select your country from the list');
ucountry.focus();
return false;
}
else
{
// Focus goes to next field i.e. ZIP Code.
document.loginForm.zip.focus();
return true;
}
}

// This function will validate ZIP Code.
function allnumeric()
{ 
var uzip = document.loginForm.zip;
var numbers = /^[0-9]+$/;
if(uzip.value.match(numbers))
{
// Focus goes to next field i.e. email.
document.loginForm.email.focus();
return true;
}
else
{
alert('ZIP code must have numeric characters only');
uzip.focus();
return false;
}
}

// This function will validate Email.
function ValidateEmail()
{
var uemail = document.loginForm.email;
var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
if(uemail.value.match(mailformat))
{
document.loginForm.desc.focus();
return true;
}
else
{
alert("You have entered an invalid email address!");
uemail.focus();
return false;
}
} 

/* Validazione form di login da bottone submit con alert*/
function formValidation()
{
	var message=document.getElementById("UserError");
var uid = document.loginForm.userid;
var passid = document.loginForm.passid;

if(userid_validation(uid,5,12))
	if(passid_validation(passid,7,12)){
		message.innerHTML("User Id should not be empty / length be between "+mx+" to "+my);
		return true;
	}
return false;

} 
function userid_validation(uid,mx,my)
{
var uid_len = uid.value.length;
if (uid_len == 0 || uid_len >= my || uid_len < mx)
{
alert("User Id should not be empty / length be between "+mx+" to "+my);
uid.focus();
return false;
}
return true;
}
function passid_validation(passid,mx,my)
{
var passid_len = passid.value.length;

if (passid_len == 0 ||passid_len >= my || passid_len < mx)
{
alert("Password should not be empty / length be between "+mx+" to "+my);
//
passid.focus();
return false;
}
return true;
}


//Lift card and show stats on Mouseover
$('.product-card').hover(function(){
		$(this).addClass('animate');
					
	 }, function(){
		$(this).removeClass('animate');			
		
});	







