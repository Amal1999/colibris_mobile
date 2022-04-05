
import 'package:flutter/material.dart';
import 'package:colibris_mobile/models/user.dart';

  
  
 
bool isPhoneValid(String value){
  {if (value.isNotEmpty && value.length>=8 && RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}+$').hasMatch(value) )
  {return true; }else {return false;}}
}


class FormValidationExample extends StatefulWidget  {
   FormValidationExample({ Key? key }) : super(key: key);

  @override
  State<FormValidationExample> createState() => _FormValidationExampleState();

  final formGlobalKey = GlobalKey < FormState > ();
   }
class _FormValidationExampleState extends State<FormValidationExample> {
  late Map<String, dynamic> user;

 // get formGlobalKey => null;

    TextEditingController phone1 =TextEditingController();
      

  @override
  Widget build(BuildContext context) {
  final formGlobalKey = GlobalKey < FormState > ();
    return 
      Form(
            key: formGlobalKey,
              child: Column(
                children: [
              const SizedBox(height: 25),
                     SizedBox(
                         width: 250,

                       child: TextFormField(
                        
                         controller: phone1,
                        decoration: InputDecoration(
                          hintText: "Enter your phone number ",
                          fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide:
                  const BorderSide(color: Colors.white),
                ),
                        ),
                        validator: (phone1) {
                          if (isPhoneValid(phone1!)) return null;
                          else
                            return 'Enter a valid phone number';
                        },
                    ),
                     ),
                    const SizedBox(height: 25),

                     
                     
            ],
              ),
            
      );
  }}

