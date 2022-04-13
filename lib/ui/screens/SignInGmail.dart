// ignore_for_file: use_key_in_widget_constructors

import 'package:colibris_mobile/controllers/loginController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
