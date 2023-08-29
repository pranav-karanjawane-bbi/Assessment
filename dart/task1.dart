//take 3 variables of types string, int and boolean
//among 3, 1 should be late, 1 should be nullable(i.e with this operator ?), 1 normal (null safety)
//create a random number within range 1 to 3
//depending on random number initialise one of the three variables(switch case to be used)
//for initialising variable use async function with timer of 2 secs (asnyc programming)
//at the end print all the three variables
//use exception handling while printing as only one of the three variables is initialised (exception handling)


import 'dart:math';

Future<void> main() async {
  
   await randomCase();
  print("Code implementation starts ");
}

Future<dynamic> randomCase() async {
  String? var1;
  int var2 = 0;
  late bool var3;
  Random random = Random();
  int randomNumber = random.nextInt(3) + 1;
//   int randomNumber = 3;
  switch(randomNumber){
      
    case 1 : {
       var1 = "pranav"; 
      Future.delayed(
        const Duration(seconds:2), ()=>
        print("This is printing case 1 : $var1")
      );
    }
      
      break;
    case 2 : {
      
      var2 = 23;
      Future.delayed(
        const Duration(seconds:2), ()=>
        print("This is printing case 2 : $var2")
      );
    }
      break;
    case 3 : {
       
      var3 = true;
      Future.delayed(
        const Duration(seconds:2), ()=>
        print("This is printing case 3 : $var3")
      );
  }
}
try{
  var1!.toLowerCase();
  print("$var1\n");
}
 catch(_){
   print("variable 1 is not assigned!!");
 }
  
  
    if(var2==0)
    {print("variable 2 is not assigned!!");}
    else{
      print("$var2");
    }

 


try{
   var3!.toString(); 
  print("$var3\n");
}
 catch(_){
   print("variable 3 is not assigned!!");
 }
}

