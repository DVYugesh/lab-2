function validateName() {
    /*Check whether name is entered or not.
    Throw an error if name field is empty.
    Error message will be "Full name is required."*/
  let name=document.getElementById("fullName").value;
  if (name=="") throw "Full name is required.";

}

function validateEmail() {
    /*Check whether email is valid or not, as per the rules stated in problem statement.
    Use regex and test() function to validate the email address.
    Throw an error if email is invalid.
    Error message will be "Invalid Email Address."*/
    let email=document.getElementById("email").value;
    const pattern=/^[a-z0-9]+@[a-z]+\.[a-z]{3}$/;
    if(pattern.test(email)!=true) throw "Invalid Email Address.";

}

function validatePassword() {
    /*Check whether password is made of atleast 8 characters.
    /If not, throw an error.
    Error message will be "Password must be at least 8 characters"*/
    let password1=document.getElementById("password").value;
    if (password1.length<8) throw "Password must be at least 8 characters.";
}

function ConfirmPassword() {
    /*Check whether the re-entered password is same as the password entered first.
    If not, throw an error.
    Error message will be "Passwords do not match"*/
    let password1=document.getElementById("password").value;
    let password2=document.getElementById("confirmPassword").value;
    if(password1!=password2) throw "Passwords do not match.";
}

function validateForm() {
    try {

        /*Check whether all fields are entered or not*/
        //Your code here
        let name=document.getElementById("fullName").value;
        let email=document.getElementById("email").value;
        let password1=document.getElementById("password").value;
        let password2=document.getElementById("confirmPassword").value;
        if(name==""||email==""||password1==""||password2=="") throw "All fields are required."

        validateName();
        validateEmail();
        validatePassword();
        ConfirmPassword();

        // Additional validation rules can be added here

        //After checking all the rules, if the program throws no error, it will reach this part of code.
        //Using "innerHTML" and "span" tag, give the message "Registration successful!" in GREEN colour to the div container "feedback" in index.html.
        //Your code here
       
        
        document.getElementById("feedback").innerHTML='<span style="color:green;">Registration successful!</span>';
      

    } catch (error) {
        //After checking all the rules, if the program throws an error, it will reach this part of code.
        //Using "innerHTML" and "span" tag, give the error message in RED colour to the div container "feedback" in index.html.
        //Your code here
       document.getElementById("feedback").innerHTML='<span style="color:red;">Error: '+error+'</span>'; 
       
    }
}
