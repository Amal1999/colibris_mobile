
import 'package:colibris_mobile/widgets/PhoneText.dart';
import 'package:flutter/material.dart';
 
 class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var child;

        
   Widget build(BuildContext context) {
         final topPadding = MediaQuery.of(context).padding.top;
           final formGlobalKey = GlobalKey < FormState > ();


    return SafeArea(
      child: Scaffold(
          body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 224, 233, 230), Color.fromARGB(255, 147, 201, 169),],

           begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: topPadding),
                
              SizedBox(height: 20),
               Image.asset("assets/colibris.png",
               width: 130,),
              SizedBox(height: 20),
             
               SizedBox(height: 20),
               const Text(
                "Login and request",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
               const Text(
                "your pickup ",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 50,),
              const Text("Using phone number", style: TextStyle(
                  fontSize: 15,
                  color: Color.fromARGB(255, 112, 109, 109),
                  fontWeight: FontWeight.bold,
                ),
              ),
               SizedBox(height: 20,),


   Row(    

              mainAxisAlignment: MainAxisAlignment.center,

    children: [
  
          FormValidationExample(),
         SizedBox(height:10),
        

    ]),
          SizedBox(width: 20,),
               const Text("Using Facebook", style: TextStyle(
                  fontSize: 15,
                  color: Color.fromARGB(255, 112, 109, 109),
                  fontWeight: FontWeight.bold,
                ),
              ),
                            SizedBox(height: 20),

             ElevatedButton(
  onPressed: () {
  },  style: ElevatedButton.styleFrom(
     primary: Color.fromARGB(255, 30, 116, 187),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              textStyle: const TextStyle(fontSize: 20),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30))
            ),
        
  child: Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Text('Login using Facebook',),
      // <-- Text
      SizedBox(
        width: 20,
      ),
      Icon( // <-- Icon
        Icons.facebook,
        size: 24.0,
      ),
    ],
  ),
),
                            SizedBox(height: 40,),

Text("You don't have an account?", style: TextStyle(
                  fontSize: 15,
                  color: Color.fromARGB(255, 8, 0, 0)        ,          fontWeight: FontWeight.bold,
                ),
              ),
                            SizedBox(height: 10,),

                 TextButton (onPressed: () {},
                    child: Text("Create account",style:TextStyle(color:Color.fromARGB(255, 56, 165, 110),decoration: TextDecoration.underline, ),
 ),),
              ])
              ))));
       

              
        
   }}

 