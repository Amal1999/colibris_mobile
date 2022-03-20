import 'package:colibris_mobile/controllers/loginController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInGmail extends StatelessWidget {
  final controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login Page')),
      body: Center(child: Obx(() {
        if (controller.googleAccount.value == null) {
          return controller.buildLoginButton();
        } else {
          return controller.buildProfileView();
        }
      })),
    );
  }
}
