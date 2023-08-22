function validate(){

    const firstName = document.getElementById('firstName').value;
    const lastName = document.getElementById('lastName').value;
    const email = document.getElementById('email').value;
    const phone = document.getElementById('phone').value;
    const pass = document.getElementById('password').value;

    
    // console.log(typeof firstName);
    var flag = 0;

    if (firstName.charAt(0) != firstName.charAt(0).toUpperCase()){
        window.alert('Name should have first letter captal');
        window.alert('Login failed');
        flag += 1;
    }
    
    var sizeFirst = firstName.length;

    for(var i = 0; i<sizeFirst; i++){
        if(firstName.charAt(i) == 1 || firstName.charAt(i) == 2 || firstName.charAt(i) == 3 || firstName.charAt(i) == 4 || firstName.charAt(i) == 5 || firstName.charAt(i) == 6 || firstName.charAt(i) == 7 || firstName.charAt(i) == 8 || firstName.charAt(i) == 9 || firstName.charAt(i) == 0){
            window.alert('Name cannot contain number');
            flag += 1;
        }
    }

    if (lastName.charAt(0) != lastName.charAt(0).toUpperCase()){
        window.alert("first letter should be uppercase in last name");
        window.alert("login failed");
        flag += 1;
    }

    var sizeLast = lastName.length;

    for(var i = 0; i<sizeLast; i++){
        if(lastName.charAt(i) == 1 || lastName.charAt(i) == 2 || lastName.charAt(i) == 3 || lastName.charAt(i) == 4 || lastName.charAt(i) == 5 || lastName.charAt(i) == 6 || lastName.charAt(i) == 7 || lastName.charAt(i) == 8 || lastName.charAt(i) == 9 || lastName.charAt(i) == 0){
            window.alert('Name cannot contain number');
            flag += 1;
        }
    }

    if (phone.length <10 || phone.length > 10){
        window.alert("phone number should be 10 numbers only");
        window.alert("login failed");
        flag += 1;
    }
    
    if (pass.length < 8  || pass.length > 15){
        window.alert("password length should be between 7 and 15");
        window.alert("login failed");
        flag += 1;
    }


    if(flag == 0){window.alert("Successfully login!");}

    return true;
 
}

function check(){
    const username = document.getElementById('username').value;
    const password = document.getElementById('password').value;

    

    const emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
    if(!emailPattern.test(username)){
        window.alert("enter a valid email");
        
        return false;
    }

    const passwordPattern = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$";
    if(!passwordPattern.test(password)){
        window.alert("pawword length must be between 9 and 14 and your password must contain atleast 1 uppercase alphabet, a number , special symbol ");
        
        return false;
    }

    return true;
}

