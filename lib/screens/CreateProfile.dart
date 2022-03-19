import 'package:colibris_mobile/widgets/ProfileWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:colibris_mobile/Services/ProfileService.dart';
import 'package:colibris_mobile/models/user.dart';
import 'package:colibris_mobile/widgets/TextFieldWidget.dart';
class CreateProfile extends StatelessWidget {
   TextEditingController username =TextEditingController();
  TextEditingController email =TextEditingController();
    TextEditingController phone1 =TextEditingController();
        TextEditingController phone2 =TextEditingController();

        TextEditingController password =TextEditingController();
                TextEditingController date =TextEditingController();

   CreateProfile({Key? key}) : super(key: key);
   Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 19, 129, 87), Color.fromARGB(255, 31, 167, 87),]
            //begin: Alignment.topLeft,
            //end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        size: 30,
                        color: Colors.black87,
                      ))
                ],
              ),
              SizedBox(height: 20),
              ProfileWidget(),
              SizedBox(height: 20),
             
               SizedBox(height: 20),
               const Text(
                "Votre nouveau profil ",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white60,
                  fontWeight: FontWeight.bold,
                ),
              ),
               TextFieldWidget(name:"Nom et Prénom ",controller: username,hint: "Entrer votre nom et prénom",),
              TextFieldWidget(name:"Email",controller: email,hint:"Exemple : username@email.com "),
              TextFieldWidget(name:"Numero de Telephone 1 ",controller: phone1 ,hint:"Exemple : 00000000 "),
               TextFieldWidget(name:"Numero de Telephone 2 ",controller: phone2 ,hint:"Exemple : 00000000 "),

              TextFieldWidget(name:"Mot de passe ",controller: password ,hint:"********* ",inputType: TextInputType.visiblePassword,
                  obscureText: true,),
              TextFieldWidget(name:"Date de naissance ",controller: date ,hint:"JJ/MM/AAAA "),
               SizedBox(height: 20),
               FloatingActionButton.extended(onPressed: () async {
                    Map<String,dynamic> user={
                      "username":username.text,
                      "email":email.text,
                      "phone1":phone1.text,
                      "phone2":phone2.text,

                     // "userid":'${userid}'
                    };
                    ProfileService().AddProfile(user).then((value) {
                      if(value)
                        {
                        //  Navigator.of(context).push();
                        }
                    });

                  },
              backgroundColor: Colors.green,
              icon :Icon(Icons.add) ,
              label: Text("Creer"),
              
              
              ),
               SizedBox(height: 20),
            


            ]
        ),)
      ),
    ));
   }}
   