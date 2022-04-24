import 'package:colibris_mobile/ui/screens/login_profile/widgets/PhoneText.dart';
import 'package:colibris_mobile/ui/screens/sign_up/VerifyNumberWidget.dart';
import 'package:flutter/material.dart';
class sign_up extends StatefulWidget {
  const sign_up({Key? key}) : super(key: key);

  @override
  State<sign_up> createState() => _sign_upState();
}

class _sign_upState extends State<sign_up> {
  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;

    return SafeArea(
      child : Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 224, 233, 230),
                Color.fromARGB(255, 147, 201, 169),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [ SizedBox(height: topPadding),
                  SizedBox(height: 20),
                  Image.asset(
                    "assets/images/colibris.png",
                    width: 130,
                  ),
                  SizedBox(height: 20),
                  SizedBox(height: 20),
                  const Text(
                    "Sign up and get ",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "started ",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  const Text(
                    "Verify your number",
                    style: TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 112, 109, 109),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                Row( mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      VerifyNumber(),
                      SizedBox(height: 10),
                    ]),
            SizedBox(
              width: 20,
            ),
            const Text(
              "we sent a verification code to ",
              style: TextStyle(
                fontSize: 15,
                color: Color.fromARGB(255, 112, 109, 109),
                fontWeight: FontWeight.bold,
              ),
            ),
                  const Text(
                    "your phone ",
                    style: TextStyle(
                      fontSize: 15,
                      color: Color.fromARGB(255, 112, 109, 109),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 73, 151, 231),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 20),
                        textStyle: const TextStyle(fontSize: 20),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'resend code',style: TextStyle(
                          fontSize: 15,
                          color:  Color.fromARGB(255, 230, 233, 236),
                          fontWeight: FontWeight.bold,
                        ),
                        ),
                        // <-- Text
                        SizedBox(
                          width: 20,
                        ),
                        Icon(
                          // <-- Icon
                          Icons.send_rounded  ,
                          color:  Color.fromARGB(255, 230, 233, 236),
                          size: 24.0,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),]
            ),
          )
        )
      )
    );
  }
}
