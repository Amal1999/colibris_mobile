import 'package:colibris_mobile/widgets/CreateProfileWidget.dart';
import 'package:colibris_mobile/widgets/MycustomForm.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
  import 'package:image_picker/image_picker.dart';
import 'package:colibris_mobile/models/user.dart';
import 'package:colibris_mobile/widgets/TextFieldWidget.dart';
 
 class CreateProfile extends StatefulWidget {
     CreateProfile({Key? key}) : super(key: key);
_CreateProfileState createState() => _CreateProfileState();
   }

      class _CreateProfileState extends State<CreateProfile>{ 
        
            final _formKey = GlobalKey<FormState>();
                
               late PickedFile imageFile;
     ImagePicker _picker = ImagePicker();
      //  final String imagePath="assets/userprofile.jpg";


   Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 19, 129, 87), Color.fromARGB(255, 31, 167, 87),]
         
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
              imageProfile( context),
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
              SizedBox(height: 20,),
              FormValidationExample(),

              ]
          ),
  
              ))
          
      )
    )
            ;
   }}