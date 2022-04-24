
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

   }
class _FormValidationExampleState extends State<FormValidationExample> {
  final formGlobalKey = GlobalKey < FormState > ();

 // get formGlobalKey => null;

    TextEditingController phone1 =TextEditingController();
      

  @override
  Widget build(BuildContext context) {
  
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
                          suffixIcon: Padding(
  padding: const EdgeInsetsDirectional.only(end: 12.0),
  child: ClipOval(
  child: Material(
    color: Colors.green, // button color
    child: InkWell(
      splashColor: Colors.green, // Couleur qui "envahit" le bouton lors du focus
      child: SizedBox(width: 40, height: 40, child: Icon(Icons.navigate_next,color: Colors.white,)),
      onTap: () { if (formGlobalKey.currentState!.validate()) {
                              formGlobalKey.currentState!.save();}},
    ),)
  ), // myIcon is a 48px-wide widget.
),
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

