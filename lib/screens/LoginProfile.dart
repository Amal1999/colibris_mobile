
import 'package:colibris_mobile/widgets/textBox.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:colibris_mobile/widgets/TextFieldWidget.dart';
 
 class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
        
   Widget build(BuildContext context) {
         final topPadding = MediaQuery.of(context).padding.top;

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
               Image.asset("assets/colibris.jpg",
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
              SizedBox(height: 40,),
              const Text("Using phone number", style: TextStyle(
                  fontSize: 15,
                  color: Color.fromARGB(255, 112, 109, 109),
                  fontWeight: FontWeight.bold,
                ),
              ),
                            SizedBox(height: 40,),

              PhoneText(),
              ])
              ))));
       

              
        
   }}

 