import 'package:colibris_mobile/Services/ProfileService.dart';
import 'package:flutter/material.dart';
import 'package:colibris_mobile/models/user.dart';
  import 'package:image_picker/image_picker.dart';
  
  
  //mixin InputValidationMixin {
  bool isPasswordValid(String password) => password.length == 6;
bool isNameValid(String username) { 
  if (username.isNotEmpty && username.length >2 && RegExp(r'^[a-z A-Z]+$').hasMatch(username) ){return true;}else { return false;}}

bool isPhoneValid(String value){
  {if (value.isNotEmpty && value.length>=8 && RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}+$').hasMatch(value) )
  {return true; }else {return false;}}
}
bool isPhoneValid2(String value){
  {if (value.isEmpty ||( value.length>=8 && RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}+$').hasMatch(value) ))
  {return true; }else {return false;}}
}
  bool isEmailValid(String email) {

   if (email.isNotEmpty && RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}').hasMatch(email)){return true;}else {return false;}}
  




class FormValidationExample extends StatefulWidget  {
   FormValidationExample({ Key? key }) : super(key: key);

  @override
  State<FormValidationExample> createState() => _FormValidationExampleState();

  final formGlobalKey = GlobalKey < FormState > ();
    late PickedFile imageFile;
     ImagePicker _picker = ImagePicker();}
class _FormValidationExampleState extends State<FormValidationExample> {
  late Map<String, dynamic> user;

 // get formGlobalKey => null;
TextEditingController username =TextEditingController();
  TextEditingController email =TextEditingController();
    TextEditingController phone1 =TextEditingController();
        TextEditingController phone2 =TextEditingController();

        TextEditingController password =TextEditingController();

  @override
  Widget build(BuildContext context) {
  final formGlobalKey = GlobalKey < FormState > ();
    return 
      Form(
            key: formGlobalKey,
              child: Column(
                children: [
              const SizedBox(height: 25),
               TextFormField(
                    controller: username,

                        decoration: InputDecoration(
                        
                          labelText: "Nom et Prénom",
                          fillColor: Colors.white38,
                filled: false,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide:
                  const BorderSide(color: Colors.white38),
                ),
                        ),
                        maxLength: 18,
                        obscureText: false,
                        
                        validator: (username) {
                          if (isNameValid(username!)) return null;
                          else
                            return 'Enter a valid username';
                        },

                      ),
                                          const SizedBox(height: 25),

                    TextFormField(
                    controller: email,

                      decoration: InputDecoration(
                        labelText: "Email",
                        hintText: "username@mail.com",
                        fillColor: Colors.white38,
                filled: false,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide:
                  const BorderSide(color: Colors.white38),
                ),
                      ),
                      validator: (email) {
                        if (isEmailValid(email!)) return null;
                        else
                          return 'Enter a valid email address';
                      },
                    ),
                    const SizedBox(height: 25),

                     TextFormField(
                       controller: phone1,
                      decoration: InputDecoration(
                        labelText: "numero de telephone 1",
                        fillColor: Colors.white38,
                filled: false,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide:
                  const BorderSide(color: Colors.white38),
                ),
                      ),
                      validator: (phone1) {
                        if (isPhoneValid(phone1!)) return null;
                        else
                          return 'Enter a valid phone number';
                      },
                    ),
                    const SizedBox(height: 25),

                     TextFormField(
                       controller: phone2,
                      decoration: InputDecoration(
                        labelText: "numero de telephone 2 si possible",
                        fillColor: Colors.white38,
                filled: false,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide:
                  const BorderSide(color: Colors.white38),
                ),
                      ),
                      validator: (phone2) {
                        if (isPhoneValid2(phone2!)) return null;
                        else
                          return 'Enter a valid phone number';
                      },
                    ),
                    const SizedBox(height: 25),
                      TextFormField(
                        controller: password,
                        decoration: InputDecoration(
                          labelText: "Password",
                          fillColor: Colors.white38,
                filled: false,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide:
                  const BorderSide(color: Colors.white38),
                ),
                        ),
                        maxLength: 6,
                        obscureText: true,
                        validator: (password) {
                          if (isPasswordValid(password!)) return null;
                          else
                            return 'Enter a valid password';
                        },
                      ),
                      const SizedBox(height: 25),
                  
                  
                      ElevatedButton(
                
                          onPressed: () {
                            if (formGlobalKey.currentState!.validate()) {
                              formGlobalKey.currentState!.save();}
                          
                           else
                              // use the email provided here
                            
                               Map<String,dynamic> user={
                      "username":username.text,
                      "email":email.text, 
                      "phone1":phone1.text,
                      "phone2":phone2.text,
                          };
                            ProfileService().AddProfile(user).then((value) {
                      if(value)
                        {
                        //  Navigator.of(context).push();
                        }
                    });},
                            child: const Text('Submit'),

            )
            ],
              ),
            
      );
  }}

