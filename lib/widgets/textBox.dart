import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
bool isPhoneValid(String value){
  {if (value.isNotEmpty && value.length>=8 && RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}+$').hasMatch(value) )
  {return true; }else {return false;}}
}
class PhoneText extends StatefulWidget {
  PhoneText({Key? key}) : super(key: key);

  @override
  State<PhoneText> createState() => _PhoneTextState();
}

class _PhoneTextState extends State<PhoneText> {
  @override
 
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

                     TextFormField(
                       controller: phone1,
                      decoration: InputDecoration(
                        labelText: "Enter your phone number",
                        fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide:
                  const BorderSide(color: Color.fromARGB(232, 230, 227, 227)),
                ),
                      ),
                      validator: (phone1) {
                        if (isPhoneValid(phone1!)) return null;
                        else
                          return 'Enter a valid phone number';
                      },
                    ),
                    const SizedBox(height: 25),
                  
                  
                            
                  
            ],
              ),
            
      );
  }}

