import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VerifyNumber extends StatefulWidget {
  const VerifyNumber({Key? key}) : super(key: key);

  @override
  State<VerifyNumber> createState() => _VerifyNumberState();
}

class _VerifyNumberState extends State<VerifyNumber> {
  @override
  final formGlobalKey = GlobalKey < FormState > ();
  TextEditingController phone1 =TextEditingController();

  Widget build(BuildContext context) {
    return Form( key: formGlobalKey,
      child: Column(
        children: [
          const SizedBox(height: 25),
          SizedBox(
            width: 250,

            child: TextFormField(
keyboardType:TextInputType.number ,    textAlign: TextAlign.center,

                inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              ],
              controller: phone1,
              decoration: InputDecoration(
                suffixIcon: Padding(
                  padding: const EdgeInsetsDirectional.only(end:8.0),
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
                hintText: " _ _ _ _  ",



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
              maxLength: 4,
            ),
          ),
          const SizedBox(height: 25),



        ],
      ),);
  }
}
